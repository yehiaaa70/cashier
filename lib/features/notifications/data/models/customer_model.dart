class CustomerModel {
  final int? id;
  final String? name;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? firstPhone;
  final String? image;
  final String? email;
  final String? age;
  final String? emailVerifiedAt;
  final String? active;
  final String? createdAt;
  final String? updatedAt;

  final String? firstOfferAvailable;

  CustomerModel({
    this.id,
    this.name,
    this.firstName,
    this.middleName,
    this.lastName,
    this.firstPhone,
    this.image,
    this.email,
    this.age,
    this.emailVerifiedAt,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.firstOfferAvailable,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (firstName != null) {
      result.addAll({'firstName': firstName});
    }
    if (middleName != null) {
      result.addAll({'middleName': middleName});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
    }
    if (firstPhone != null) {
      result.addAll({'firstPhone': firstPhone});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (age != null) {
      result.addAll({'age': age});
    }
    if (emailVerifiedAt != null) {
      result.addAll({'emailVerifiedAt': emailVerifiedAt});
    }
    if (active != null) {
      result.addAll({'active': active});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (firstOfferAvailable != null) {
      result.addAll({'firstOfferAvailable': firstOfferAvailable});
    }

    return result;
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'],
      name: map['name'],
      firstName: map['firstName'],
      middleName: map['middleName'],
      lastName: map['lastName'],
      firstPhone: map['firstPhone'],
      image: map['image'],
      email: map['email'],
      age: map['age'],
      emailVerifiedAt: map['emailVerifiedAt'],
      active: map['active'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      firstOfferAvailable: map['firstOfferAvailable'],
    );
  }
}
