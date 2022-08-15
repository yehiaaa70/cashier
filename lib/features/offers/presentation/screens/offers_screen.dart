import 'dart:developer';

import 'package:cashir/core/utils/app_strings.dart';
import 'package:cashir/features/offers/data/data_sources/call_api.dart';
import 'package:cashir/features/offers/data/models/offers_model.dart';
import 'package:cashir/features/offers/presentation/cubit/offers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/utils/assets_manager.dart';
import '../widgets/available_offer_widget.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  void initState() {
    OffersCubit.get(context).getAllOffers();
    // OffersCubit.get(context).getAvaliableOffers();
    // CallApiForOffers().getAvailableOffers();
    // CallApiForOffers.availableOffers;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log(CallApiForOffers.offers.length.toString());
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
                AppStrings.availableOffers,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: AppColors.darkBlue),
              ),
              const SizedBox(
                height: 15,
              ),
              ...List.generate(
                  CallApiForOffers.availableOffers.length,
                  (index) => AvailableOfferWidget(
                        index: index,
                        offers: CallApiForOffers.availableOffers,
                        color: 0,
                      )),
              const SizedBox(
                height: 30,
              ),
              Text(
                AppStrings.expiredOffers,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: AppColors.darkBlue),
              ),
              const SizedBox(
                height: 15,
              ),
              ...List.generate(
                  CallApiForOffers.expiredOffers.length,
                  (index) => AvailableOfferWidget(
                        index: index,
                        offers: CallApiForOffers.expiredOffers,
                        color: 1,
                      )),
            ],
          );
        },
      ),
    );
  }
}
