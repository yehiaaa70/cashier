import 'package:cashir/features/order_status_tabbars/domain/entities/order_date.dart';


class CityModel extends City{
  const CityModel({required super.id, required super.nameAr, required super.nameEn, required super.descriptionAr, required super.descriptionEn, required super.deletedAt, required super.createdAt, required super.updatedAt});
  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json["id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    descriptionAr: json["description_ar"],
    descriptionEn: json["description_en"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]).toString(),
    updatedAt: DateTime.parse(json["updated_at"]).toString(),
  );

}
