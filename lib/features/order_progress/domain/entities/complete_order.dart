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

  CompletedData.empty();

   int? id;
   String? customerId;
   String? branchId;
   String? serviceType;
   String? subtotal;
   String? taxes;
   String? deliveryFees;
   String? total;
   String? cancellationReason;
   String? state;
   String? points;
   String? deletedAt;
   DateTime? createdAt;
   DateTime? updatedAt;
   String? createdBy;
   String? updatedBy;
   String? addressId;
   String? pointsPaid;
   String? offerType;
   String? offerValue;
   String? orderFrom;
}
