
import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';

class CustomerModel extends Customer {
  const CustomerModel(
      {required super.id,
      required super.name,
      required super.firstName,
      required super.middleName,
      required super.lastName,
      required super.firstPhone,
      required super.secondPhone,
      required super.image,
      required super.email,
      required super.age,
      required super.emailVerifiedAt,
      required super.active,
      required super.deletedAt,
      required super.createdAt,
      required super.updatedAt,
      required super.createdBy,
      required super.updatedBy,
      required super.branchId,
      required super.deviceToken,
      required super.firstOfferAvailable});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        middleName: json["middle_name"]??"null",
        lastName: json["last_name"],
        firstPhone: json["first_phone"]??"no mobile",
        secondPhone: json["second_phone"],
        image: json["image"],
        email: json["email"],
        age: json["age"],
        emailVerifiedAt: json["email_verified_at"]??"null",
        active: json["active"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        branchId: json["branch_id"],
        deviceToken: json["device_token"],
        firstOfferAvailable: json["first_offer_available"],
      );
}
