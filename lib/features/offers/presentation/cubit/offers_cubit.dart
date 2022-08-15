import 'package:bloc/bloc.dart';
import 'package:cashir/features/offers/data/data_sources/call_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial());
  static OffersCubit get(context) => BlocProvider.of<OffersCubit>(context);

  getAllOffers() async {
    emit(OffersLoading());
    await CallApiForOffers().getAppOffers();
    emit(OffersLoaded());
  }
}
