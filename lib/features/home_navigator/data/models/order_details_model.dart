import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';

import 'customer_model.dart';

class OrderDetailsModel extends OrderDetails {
  OrderDetailsModel(
      {required super.id,
      required super.customerId,
      required super.branchId,
      required super.paymentType,
      required super.serviceType,
      required super.subtotal,
      required super.taxes,
      required super.deliveryFees,
      required super.total,
      required super.state,
      required super.cancellationReason,
      required super.deletedAt,
      required super.createdAt,
      required super.updatedAt,
      required super.createdBy,
      required super.updatedBy,
      required super.addressId,
      required super.pointsPaid,
      required super.offerValue,
      required super.offerType,
      required super.orderFrom,
      required super.customer,
      required super.branch,
      required super.items,
      required super.address});

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        id: json["id"],
        customerId: json["customer_id"],
        branchId: json["branch_id"],
        serviceType: json["service_type"],
        subtotal: json["subtotal"],
        taxes: json["taxes"],
        deliveryFees: json["delivery_fees"],
        total: json["total"],
        state: json["state"],
        cancellationReason: json["cancellation_reason"] ?? "NO Reason",
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        addressId: json["address_id"] ?? "null",
        pointsPaid: json["points_paid"],
        offerValue: json["offer_value"]??"",
        paymentType: json["payment_type"],
        offerType: json["offer_type"],
        orderFrom: json["order_from"],
        customer: CustomerModel.fromJson(json["customer"]),
        branch: BranchModel.fromJson(json["branch"]),
        items: List<ItemModel>.from(
            json["items"].map((x) => ItemModel.fromJson(x))),
        // address: AddressModel.fromJson(json["address"]??""),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),

        // address: json["address"] == null ? null : AddressModel.fromJson(json["address"]),
      );
}

class ItemModel extends Items {
  const ItemModel(
      {required super.id,
      required super.nameAr,
      required super.nameEn,
      required super.descriptionAr,
      required super.descriptionEn,
      required super.price,
      required super.calories,
      required super.image,
      required super.bestSeller,
      required super.view,
      required super.recommended,
      required super.categoryId,
      required super.deletedAt,
      required super.createdAt,
      required super.updatedAt,
      required super.extras,
      required super.isHidden,
      required super.doughType,
      required super.pivot});

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        price: json["price"],
        calories: json["calories"],
        image: json["image"],
        bestSeller: json["best_seller"],
        view: json["view"],
        recommended: json["recommended"],
        categoryId: json["category_id"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
        extras: List<ExtraModel>.from(
            json["extras"].map((x) => ExtraModel.fromJson(x))),
        isHidden: json["is_hidden"],
        doughType: List<DoughTypeModel>.from(
            json["dough_type"].map((x) => DoughTypeModel.fromJson(x))),
        pivot: PivotModel.fromJson(json["pivot"]),
      );
}

class ExtraModel extends Extras {
  const ExtraModel(
      {required super.id,
      required super.nameAr,
      required super.nameEn,
      required super.descriptionAr,
      required super.descriptionEn,
      required super.price,
      required super.calories,
      required super.categoryId,
      required super.deletedAt,
      required super.createdAt,
      required super.updatedAt,
      required super.image});

  factory ExtraModel.fromJson(Map<String, dynamic> json) => ExtraModel(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        price: json["price"],
        calories: json["calories"],
        categoryId: json["category_id"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
        image: json["image"],
      );
}

class DoughTypeModel extends DoughType {
  const DoughTypeModel({required super.nameAr, required super.nameEn});

  factory DoughTypeModel.fromJson(Map<String, dynamic> json) => DoughTypeModel(
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
      );
}

class PivotModel extends Pivot {
  const PivotModel(
      {required super.orderId,
      required super.itemId,
      required super.itemExtras,
      required super.itemWithouts,
      required super.doughTypeAr,
      required super.doughTypeEn,
      required super.price,
      required super.offerPrice,
      required super.quantity,
      required super.offerId});

  factory PivotModel.fromJson(Map<String, dynamic> json) => PivotModel(
        orderId: json["order_id"],
        itemId: json["item_id"],
        itemExtras: json["item_extras"] ?? "",
        itemWithouts: json["item_withouts"] ?? "",
        doughTypeAr: json["dough_type_ar"] ?? "",
        doughTypeEn: json["dough_type_en"] ?? "",
        price: json["price"],
        offerPrice: json["offer_price"],
        quantity: json["quantity"],
        offerId: json["offer_id"],
      );
}

class BranchModel extends Branch {
  const BranchModel(
      {required super.id,
      required super.nameAr,
      required super.nameEn,
      required super.cityId,
      required super.areaId,
      required super.addressDescription,
      required super.addressDescriptionEn,
      required super.firstPhone,
      required super.secondPhone,
      required super.email,
      required super.deliveryFees,
      required super.serviceType,
      required super.createdBy,
      required super.updatedBy,
      required super.deletedAt,
      required super.createdAt,
      required super.updatedAt});

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        cityId: json["city_id"],
        areaId: json["area_id"],
        addressDescription: json["address_description"],
        addressDescriptionEn: json["address_description_en"],
        firstPhone: json["first_phone"],
        secondPhone: json["second_phone"] ?? "null",
        email: json["email"],
        deliveryFees: json["delivery_fees"],
        serviceType: json["service_type"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
      );
}
