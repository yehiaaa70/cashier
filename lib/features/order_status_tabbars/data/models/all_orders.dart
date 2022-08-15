import 'package:cashir/features/order_status_tabbars/data/models/order_details_model.dart';
import 'package:cashir/features/order_status_tabbars/domain/entities/order_date.dart';

import '../../domain/entities/all_orders.dart';

class AllOrdersModel extends AllCustomerOrders{
  const AllOrdersModel({required super.success, required super.data, required super.message});

  factory AllOrdersModel.fromJson(Map<String, dynamic> json) => AllOrdersModel(
    success: json["success"],
    data: DataModel.fromJson(json["data"]),
    message: json["message"],
  );

}




class DataModel extends Data{
  const DataModel({required super.currentPage, required super.data, required super.firstPageUrl, required super.from, required super.lastPage, required super.lastPageUrl, required super.nextPageUrl, required super.path, required super.perPage, required super.prevPageUrl, required super.to, required super.total});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    currentPage: json["current_page"],
    data: List<OrderDetails>.from(json["data"].map((x) => OrderDetailsModel.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );
}