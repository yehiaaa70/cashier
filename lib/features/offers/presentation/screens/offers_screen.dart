import 'dart:developer';

import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/features/offers/data/data_sources/call_api.dart';
import 'package:cashir/features/offers/data/models/offers_model.dart';
import 'package:cashir/features/offers/presentation/cubit/offers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/available_offer_widget.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  void initState() {
    OffersCubit.get(context).getAllOffers(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OffersCubit, OffersState>(
        builder: (context, state) {
          if (state is OffersLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              Text(
                AppLocalizations.of(context)!
                    .translate(AppStrings.availableOffers)
                    .toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: AppColors.darkBlue),
              ),
              (CallApiForOffers.availableOffers.isEmpty)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('No available offers added yet.'),
                      ],
                    )
                  : Container(),
              const SizedBox(
                height: 15,
              ),
              ...List.generate(
                CallApiForOffers.availableOffers.length,
                (index) => AvailableOfferWidget(
                  offers: CallApiForOffers.availableOffers[index],
                  length: CallApiForOffers.availableOffers.length,
                  color: 0,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                AppLocalizations.of(context)!
                    .translate(AppStrings.expiredOffers)
                    .toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: AppColors.darkBlue),
              ),
              (CallApiForOffers.expiredOffers.isEmpty)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('No expired offers added yet.'),
                      ],
                    )
                  : Container(),
              const SizedBox(
                height: 15,
              ),
              ...List.generate(
                CallApiForOffers.expiredOffers.length,
                (index) => AvailableOfferWidget(
                  offers: CallApiForOffers.expiredOffers[index],
                  length: CallApiForOffers.expiredOffers.length,
                  color: 1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
