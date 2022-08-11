import 'package:cashir/features/order_status_tabbars/domain/entities/order_date.dart';

import 'city_model.dart';


class AddressModel extends Address{
  const AddressModel({required super.id, required super.name, required super.street, required super.buildingNumber, required super.floorNumber, required super.landmark, required super.cityId, required super.areaId, required super.customerId, required super.deletedAt, required super.createdAt, required super.updatedAt, required super.city, required super.area});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    name:json["name"],
    street: json["street"],
    buildingNumber: json["building_number"],
    floorNumber: json["floor_number"],
    landmark: json["landmark"],
    cityId: json["city_id"],
    areaId: json["area_id"],
    customerId: json["customer_id"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]).toString(),
    updatedAt: DateTime.parse(json["updated_at"]).toString(),
    city: CityModel.fromJson(json["city"]),
    area: AreaModel.fromJson(json["area"]),
  );

}

class AreaModel extends Area{
  const AreaModel({required super.id, required super.cityId, required super.nameAr, required super.nameEn, required super.descriptionAr, required super.descriptionEn, required super.deliveryFees, required super.minDeliveryAmmount, required super.deletedAt, required super.createdAt, required super.updatedAt});


  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
    id: json["id"],
    cityId: json["city_id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    descriptionAr: json["description_ar"],
    descriptionEn: json["description_en"],
    deliveryFees: json["delivery_fees"],
    minDeliveryAmmount: json["min_delivery_ammount"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]).toString(),
    updatedAt: DateTime.parse(json["updated_at"]).toString(),
  );
}
