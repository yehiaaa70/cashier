class Completed {
  Completed({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final CompletedData data;
  final String message;
}

class CompletedData {
  CompletedData({
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
    required this.offerValue,
    required this.orderFrom,
  });

  final int id;
  final String customerId;
  final String branchId;
  final String serviceType;
  final String subtotal;
  final String taxes;
  final String deliveryFees;
  final String total;
  final String cancellationReason;
  final String state;
  final String points;
  final String deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final String updatedBy;
  final String addressId;
  final String pointsPaid;
  final String offerType;
  final String offerValue;
  final String orderFrom;
}
