class EndPoints {
  static const String baseUrl = 'https://itrplanet.com/Kop/public/api';
  static const String allOrdersUrl = '$baseUrl/orders/today-orders';
  // static const String acceptUrl = 'accept';

  static String orderState(int id,String state){
    return "$baseUrl/orders/$id/$state";
  }


}
