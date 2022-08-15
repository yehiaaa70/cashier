import 'dart:convert';
import 'dart:developer';
import 'package:cashir/features/offers/data/models/offers_model.dart';
import 'package:http/http.dart' as http;

class CallApiForOffers {
  static List<OffersModel> offers = [];
  static List<OffersModel> availableOffers = [];
  static List<OffersModel> expiredOffers = [];
  Future<void> getAppOffers() async {
    try {
      var headers = {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImIxYjljMGE2ZDUzMjljYzUyZmI2YmY5OTFjNzMyNzAwODI5MzAwMDM4YTA2YzA0MzI5ZWQzZGM0YzhmY2FkY2IxYjUwNjc4MWU2ZTQ2OTc3In0.eyJhdWQiOiIxIiwianRpIjoiYjFiOWMwYTZkNTMyOWNjNTJmYjZiZjk5MWM3MzI3MDA4MjkzMDAwMzhhMDZjMDQzMjllZDNkYzRjOGZjYWRjYjFiNTA2NzgxZTZlNDY5NzciLCJpYXQiOjE2NjA1NjAwODEsIm5iZiI6MTY2MDU2MDA4MSwiZXhwIjoxNjkyMDk2MDgxLCJzdWIiOiIxNjEiLCJzY29wZXMiOltdfQ.k3EIvYTAXYGY8M3tzp52RCsVPAo7otVgyR0_SsiZgqRb6WzrOBni7GryD7BOI4H5vECeFJATCnSMSFHnLyD8qh95PQHzKHQx-VuHTBiDJ1ARx21LbqDNZmSYQZfeXbwjxqfAAPK4NM4NYYqrmgWQQSA_5hj1NOhpLwcijFnXmvbMPXQSDoJ5Vs-J1CH5Tm3PCA0cRFRRXhZaKbXwRDSH2hidL0xWsh-jgW5b9PjuyuHvyyeqjgOvqL7YPD7C9l55g7etAZRPFMi6WyjPz22QXssPnqC3Yvc3gdlBYdjfD8YkMWYpugYkmqIjGUKuhAu4A4RYsTpTqEdW_efRTFHTCl-sT01z1o1DIRhbqMT-pgiYtzqaok6bdUyK5nV-eTVuRq_nG_E4nweNggQSGLWAQ3ih7dtSfVtJ-teXel_yyqFkiE4iYsOvKRK_i428WD5XD2IWwJQTy6w_FEtv0jsvme2EBwLTYCKSKjL7hjPtg7WRnfYHnXc0DoFly8dUtzVqxPtzMh3eGjg-tDmg2YIdCtcqVpLRHjsT8JoITaFQawErWwS8gVVR-ywAjuafZU7cz822ppt5nHQgcUgBAhMwgr5uIyJl2-aAWAXBle4Q0MqFOcKUpeyrp779uy5Link__TdDm4SVif7mJRDndUlwi5b-t1A2mbpnOEEiiov8JT0',
        'Cookie': 'kop_session=T9AshLRLvouWIwRTXj6lszZWmkwOfPhg6XWTniqc'
      };
      var respose = await http.get(
        Uri.parse('https://itrplanet.com/Kop/public/api/offers/'),
        headers: headers,
      );

      // log(offers[0].title.toString());
      // available list

      // log(offers.length.toString());
      if (respose.statusCode == 200) {
        final data = json.decode(respose.body)['data'];
        // log(data.toString());

        offers = (json.decode(respose.body)['data'] as List)
            .map((data) => OffersModel.fromJson(data))
            .toList();
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
