class EndPoints {
  static const String baseUrl = 'https://itrplanet.com/Kop/public/api';
  static const String allTodayOrders = '$baseUrl/orders/today-orders';
  static const String allHistoryOrders = '$baseUrl/orders/order-history';

  static String orderState(int id,String state){
    return "$baseUrl/orders/$id/$state";
  }


}
