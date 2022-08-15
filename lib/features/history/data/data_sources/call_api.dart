import 'dart:convert';
import 'dart:developer';
import 'package:cashir/features/history/data/models/order_model.dart';
import 'package:cashir/features/offers/data/models/offers_model.dart';
import 'package:http/http.dart' as http;

class CallApiForOrders {
  static List<OrderModel> orders = [];
  static List<OrderModel> completedOrders = [];
  static List<OrderModel> inProgressOrders = [];
  static List<OrderModel> cancelledOrders = [];
  static List<OrderModel> rejectedOrders = [];

  Future<void> getAppOrders() async {
    try {
      var headers = {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjJlYzE1NjMyNGJlN2NjNDVhNTVkMGQ3YzM2NzYzOGQ4ZDQwOGU2YTY1ZTc3MTI3NDMyOGY0NTdiMjM0MmYxZDc4ZTU1NWViZjk0N2IxMTQwIn0.eyJhdWQiOiIzIiwianRpIjoiMmVjMTU2MzI0YmU3Y2M0NWE1NWQwZDdjMzY3NjM4ZDhkNDA4ZTZhNjVlNzcxMjc0MzI4ZjQ1N2IyMzQyZjFkNzhlNTU1ZWJmOTQ3YjExNDAiLCJpYXQiOjE2NjA0NjU0MzEsIm5iZiI6MTY2MDQ2NTQzMSwiZXhwIjoxNjkyMDAxNDMxLCJzdWIiOiI3MCIsInNjb3BlcyI6W119.OIK59pnLO1iB9j0b4LVROc5HUolP3qN2cXWwZeN0x2YR3tUKFGhit7PedP-r9VTNEu5dROcDaXSXu75hUjUiZl6za3f8VE1r24CJNg122Vl1CseBSG8-zqAuNKmOh0qrAPX_2gI8gn9i08rwQjZ34Mz2i6MCuEdP0GWERZV0v5fnE6KV4Yif1l0fjcf-936CdWnqZ7De6js2YyKU9OnyCOyw-sF66tGAzdLPgY1tlLpYUNpIKngpjeKB7-9krEPIHc3xuXtKYRzaM53_90fB19INAJa_5EoPshV_6-4MjMb419K6gIVHbX0dM3iG3dIZtxtkvkYo5iFSu6goipLUJ4UOXJdW7Bafma1fX8gRhzFUR1PBeLnJ_gURyURfadpQbn8uQRLMeDdgYMK29rrcDRJoyO5-KCmiCoEKOqWl-0QfRxzr1YMzlfL4zI0MUiJiHynbvEJDZlr1_rziUvQ5rQD9V2QKX0GVknEwFyT8sCiiZSShvmv0oYcKeQVqn9DYdXmdglY9KcHwVhte7isHpPXUkrKLefRnyFqWcx_l_xXa8nw9X8V07kQcfyPs2QOZ8s0VLmSPy6DqntGb2tphK1TVUYTT0IqJ0AkUDxjp1UuZaV2Nf9sAVLdgsHBK0F_sYEMEdTbpJIgKRkzIsuW85Aukm3dmd6K2pmLZ7tMi-lo',
        'Cookie':
            'XSRF-TOKEN=eyJpdiI6IndaQjBaazhEa1FYYVVoVXNRdE94T2c9PSIsInZhbHVlIjoiQjJCdWV3TWN3cVZOK2N5cnJKTWw2dEJ3bjUyQkh4RDZZVURGT1JPcFg5cFpiSTVid09HSWxJemhoVUIycFdnNSIsIm1hYyI6ImRhNjVmNzZhOGYxYjU3NzgzYzE4OGU2OTY2NzNjMTc5NWI0NWEyOWI2YWM4NWUxNThkNTNkZGFkMWExYWIzYWMifQ%3D%3D; kop_session=Nxqq4zl5eMpcvFU6crq205UO17EVWLsc5H3F98xH'
      };
      var respose = await http.get(
        Uri.parse('https://itrplanet.com/Kop/public/api/orders/'),
        headers: headers,
      );

      // log(offers.length.toString());
      if (respose.statusCode == 200) {
        // final data = json.decode(respose.body)['data']['data'];
        // log(data.toString());

        orders = (json.decode(respose.body)['data']['data'] as List)
            .map((data) => OrderModel.fromJson(data))
            .toList();
        for (int i = 0; i < orders.length; i++) {
          if (orders[i].state! == 'completed') {
            completedOrders.add(orders[i]);
          }
          if (orders[i].state! == 'pending') {
            completedOrders.add(orders[i]);
          }
          if (orders[i].state! == 'pending') {
            completedOrders.add(orders[i]);
          }
        }
        // log(orders[0].state.toString());
      } else {
        log(respose.statusCode.toString());
        // log(respose.body.toString());
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
