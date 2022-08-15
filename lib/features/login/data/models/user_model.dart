class UserModel {
  UserModel({
    this.id,
    this.name,
    this.firstName,
    this.middleName,
    this.lastName,
    this.firstPhone,
    this.secondPhone,
    this.image,
    this.email,
    this.age,
    this.emailVerifiedAt,
    this.active,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.branchId,
    this.deviceToken,
    this.firstOfferAvailable,
    // this.branches,
  });

  int? id;
  String? name;
  String? firstName;
  String? middleName;
  String? lastName;
  String? firstPhone;
  String? secondPhone;
  String? image;
  String? email;
  String? age;
  dynamic emailVerifiedAt;
  String? active;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic branchId;
  dynamic deviceToken;
  String? firstOfferAvailable;
  // List<Branch> branches;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        firstPhone: json["first_phone"],
        secondPhone: json["second_phone"],
        image: json["image"],
        email: json["email"],
        age: json["age"],
        emailVerifiedAt: json["email_verified_at"],
        active: json["active"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        branchId: json["branch_id"],
        deviceToken: json["device_token"],
        firstOfferAvailable: json["first_offer_available"],
        // branches: List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "first_phone": firstPhone,
        "second_phone": secondPhone,
        "image": image,
        "email": email,
        "age": age,
        "email_verified_at": emailVerifiedAt,
        "active": active,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "branch_id": branchId,
        "device_token": deviceToken,
        "first_offer_available": firstOfferAvailable,
        // "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
      };
}
