import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';

class CancelModel{
  final OrderDetails orderDetails;
  final String reason;

  CancelModel({required this.orderDetails, required this.reason});
}