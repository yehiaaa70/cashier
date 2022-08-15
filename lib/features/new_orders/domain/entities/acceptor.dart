// To parse this JSON data, do
//
//     final acceptor = acceptorFromJson(jsonString);

import 'dart:convert';

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

  int id;
  final String customerId;
  final String branchId;
  final String serviceType;
  final String subtotal;
  final String taxes;
  final String deliveryFees;
  final String total;
  final dynamic cancellationReason;
  final String state;
  final String points;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String addressId;
  final String pointsPaid;
  final dynamic offerType;
  final String orderFrom;


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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_by": createdBy,
    "updated_by": updatedBy,
    "address_id": addressId,
    "points_paid": pointsPaid,
    "offer_type": offerType,
    "order_from": orderFrom,
  };

}
