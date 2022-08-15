class OrderModel {
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
  DateTime? createdAt;
  DateTime? updatedAt;
  String? createdBy;
  String? updatedBy;
  String? addressId;
  String? pointsPaid;
  String? offerType;

  OrderModel({
    this.id,
    this.customerId,
    this.branchId,
    this.serviceType,
    this.subtotal,
    this.taxes,
    this.deliveryFees,
    this.total,
    this.cancellationReason,
    this.state,
    this.points,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.addressId,
    this.pointsPaid,
    this.offerType,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        addressId: json["address_id"],
        pointsPaid: json["points_paid"],
        offerType: json["offer_type"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "address_id": addressId,
        "points_paid": pointsPaid,
        "offer_type": offerType,
      };
}
