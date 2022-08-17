import 'dart:convert';
import 'dart:developer';
import 'package:cashir/features/offers/data/models/offers_model.dart';
import 'package:cashir/features/offers/presentation/cubit/offers_cubit.dart';
import 'package:http/http.dart' as http;

class CallApiForOffers {
  static List<OffersModel> offers = [];
  static List<OffersModel> availableOffers = [];
  static List<OffersModel> expiredOffers = [];
  Future<void> getAppOffers(context) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${OffersCubit.get(context).token}',
        'Cookie': 'kop_session=Ro1RaKrOuWI5Ge1o7QuuwGmYfFoN2FuFbnTSQhEq'
      };
      var respose = await http.get(
        Uri.parse('https://itrplanet.com/Kop/public/api/offers/'),
        headers: headers,
      );

      // log(offers[0].title.toString());
      // available list

      // log(offers.length.toString());
      if (respose.statusCode == 200) {
        log(respose.statusCode.toString());
        final data = json.decode(respose.body)['data'];
        // log(data.toString());

        offers =
            (data as List).map((data) => OffersModel.fromJson(data)).toList();
        for (int i = 0; i < offers.length; i++) {
          if (DateTime.parse(offers[i].dateTo!).isAfter(DateTime.now())) {
            availableOffers.add(offers[i]);
          }
          if (DateTime.parse(offers[i].dateTo!).isBefore(DateTime.now())) {
            expiredOffers.add(offers[i]);
          }
        }
      } else {
        log(respose.statusCode.toString());
        // log(respose.body.toString());
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
