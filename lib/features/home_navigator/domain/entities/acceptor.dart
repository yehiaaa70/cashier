import 'package:equatable/equatable.dart';

class Acceptor extends Equatable {
  Acceptor({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final DataAcceptor data;
  final String message;

  @override
  List<Object?> get props => [success, data, message];
}

class DataAcceptor extends Equatable {
  DataAcceptor({
    required this.id,
    required this.customerId,
    required this.branchId,
    required this.serviceType,
    required this.subtotal,
    required this.taxes,
    required this.deliveryFees,
    required this.total,
    required this.cancellationReason,
    required this.state,
    required this.points,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.addressId,
    required this.pointsPaid,
    required this.offerType,
    required this.orderFrom,
  });

  DataAcceptor.empty();

   int? id;
   String? customerId;
   String? branchId;
   String? serviceType;
   String? subtotal;
   String? taxes;
   String? deliveryFees;
   String? total;
   dynamic cancellationReason;
   String? state;
   String? points;
   dynamic deletedAt;
   DateTime? createdAt;
   DateTime? updatedAt;
   dynamic? createdBy;
   dynamic? updatedBy;
   String? addressId;
   String? pointsPaid;
   dynamic offerType;
   String? orderFrom;

  @override
  List<Object?> get props => [
        id,
        customerId,
        branchId,
        serviceType,
        subtotal,
        taxes,
        deliveryFees,
        total,
        cancellationReason,
        state,
        points,
        deletedAt,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy,
        addressId,
        pointsPaid,
        offerType,
        orderFrom
      ];

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
        "order_from": orderFrom,
      };
}
