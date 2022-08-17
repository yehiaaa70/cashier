import 'package:cashir/features/order_progress/domain/entities/complete_order.dart';

class CompletedModel extends Completed {
  CompletedModel(
      {required super.success, required super.data, required super.message});

  factory CompletedModel.fromJson(Map<String, dynamic> json) => CompletedModel(
        success: json["success"],
        data: CompletedDataModel.fromJson(json["data"]),
        message: json["message"],
      );

}

class CompletedDataModel extends CompletedData {
  CompletedDataModel(
      {required super.id,
      required super.customerId,
      required super.branchId,
      required super.serviceType,
      required super.subtotal,
      required super.taxes,
      required super.deliveryFees,
      required super.total,
      required super.cancellationReason,
      required super.state,
      required super.points,
      required super.deletedAt,
      required super.createdAt,
      required super.updatedAt,
      required super.createdBy,
      required super.updatedBy,
      required super.addressId,
      required super.pointsPaid,
      required super.offerType,
      required super.offerValue,
      required super.orderFrom});

  factory CompletedDataModel.fromJson(Map<String, dynamic> json) =>
      CompletedDataModel(
        id: json["id"],
        customerId: json["customer_id"],
        branchId: json["branch_id"]??"No Data",
        serviceType: json["service_type"]??"No Data",
        subtotal: json["subtotal"]??"No Data",
        taxes: json["taxes"]??"No Data",
        deliveryFees: json["delivery_fees"]??"No Data",
        total: json["total"]??"No Data",
        cancellationReason: json["cancellation_reason"]??"No Reason",
        state: json["state"]??"No Data",
        points: json["points"]??"No Points",
        deletedAt: json["deleted_at"]??"No Data",
        createdAt: DateTime.parse(json["created_at"]??"No Data"),
        updatedAt: DateTime.parse(json["updated_at"]??"No Data"),
        createdBy: json["created_by"]??"No Data",
        updatedBy: json["updated_by"]??"No Data",
        addressId: json["address_id"]??"No Data",
        pointsPaid: json["points_paid"]??"No Data",
        offerType: json["offer_type"]??"No Data",
        offerValue: json["offer_value"]??"No Data",
        orderFrom: json["order_from"]??"No Data",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "branch_id": branchId,
        "service_type": serviceType,
        "subtotal": subtotal,
        "taxes": taxes,
        "delivery_fees": deliveryFees,
        "total": total,
        "cancellation_reason": cancellationReason,
        "state": state,
        "points": points,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "address_id": addressId,
        "points_paid": pointsPaid,
        "offer_type": offerType,
        "offer_value": offerValue,
        "order_from": orderFrom,
      };
}
