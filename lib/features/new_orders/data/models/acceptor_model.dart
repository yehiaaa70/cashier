
import '../../../home_navigator/domain/entities/acceptor.dart';

class AcceptorModel extends Acceptor {
  AcceptorModel(
      {required super.success, required super.data, required super.message});

  factory AcceptorModel.fromJson(Map<String, dynamic> json) => AcceptorModel(
        success: json["success"],
        data: DataAcceptorModel.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class DataAcceptorModel extends DataAcceptor {
  DataAcceptorModel(
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
      required super.orderFrom});

  factory DataAcceptorModel.fromJson(Map<String, dynamic> json) => DataAcceptorModel(
    id: json["id"],
    customerId: json["customer_id"],
    branchId: json["branch_id"],
    serviceType: json["service_type"],
    subtotal: json["subtotal"],
    taxes: json["taxes"],
    deliveryFees: json["delivery_fees"],
    total: json["total"],
    cancellationReason: json["cancellation_reason"],
    state: json["state"],
    points: json["points"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    addressId: json["address_id"],
    pointsPaid: json["points_paid"],
    offerType: json["offer_type"],
    orderFrom: json["order_from"],
  );

}
