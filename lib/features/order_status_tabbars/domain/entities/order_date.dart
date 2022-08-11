import 'package:equatable/equatable.dart';

class OrderDetails extends Equatable {
  final int id;
  final String customerId;
  final String branchId;
  final String serviceType;
  final String subtotal;
  final String taxes;
  final String deliveryFees;
  final String total;
  final String state;
  final String cancellationReason;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;
  final String createdBy;
  final String updatedBy;
  final String addressId;
  final String pointsPaid;
  final String offerType;
  final String orderFrom;
  final Customer customer;
  final Branch branch;
  final List<Items> items;
  final Address address;

  const OrderDetails(
      {required this.id,
      required this.customerId,
      required this.branchId,
      required this.serviceType,
      required this.subtotal,
      required this.taxes,
      required this.deliveryFees,
      required this.total,
      required this.state,
      required this.cancellationReason,
      required this.deletedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.createdBy,
      required this.updatedBy,
      required this.addressId,
      required this.pointsPaid,
      required this.offerType,
      required this.orderFrom,
      required this.customer,
      required this.branch,
      required this.items,
      required this.address});

  @override
  List<Object?> get props => [
        customerId,
        branchId,
        serviceType,
        taxes,
        deliveryFees,
        total,
        state,
        cancellationReason,
        deletedAt,
        createdAt,
        updatedBy,
        addressId,
        pointsPaid,
        offerType,
        orderFrom,
        customer,
        branch,
        items,
        address
      ];
}

class Customer extends Equatable {
  final int id;
  final String name;
  final String firstName;
  final String middleName;
  final String lastName;
  final String firstPhone;
  final String secondPhone;
  final String image;
  final String email;
  final String age;
  final String emailVerifiedAt;
  final String active;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;
  final String createdBy;
  final String updatedBy;
  final String branchId;
  final String deviceToken;
  final String firstOfferAvailable;

  const Customer(
      {required this.id,
      required this.name,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.firstPhone,
      required this.secondPhone,
      required this.image,
      required this.email,
      required this.age,
      required this.emailVerifiedAt,
      required this.active,
      required this.deletedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.createdBy,
      required this.updatedBy,
      required this.branchId,
      required this.deviceToken,
      required this.firstOfferAvailable});

  @override
  List<Object?> get props => [
        id,
        name,
        firstName,
        middleName,
        lastName,
        firstPhone,
        secondPhone,
        image,
        email,
        age,
        emailVerifiedAt,
        active,
        deletedAt,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy,
        branchId,
        deviceToken,
        firstOfferAvailable
      ];
}

class Branch extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final String cityId;
  final String areaId;
  final String addressDescription;
  final String addressDescriptionEn;
  final String firstPhone;
  final String secondPhone;
  final String email;
  final String deliveryFees;
  final String serviceType;
  final String createdBy;
  final String updatedBy;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;

  const Branch(
      {required this.id,
      required this.nameAr,
      required this.nameEn,
      required this.cityId,
      required this.areaId,
      required this.addressDescription,
      required this.addressDescriptionEn,
      required this.firstPhone,
      required this.secondPhone,
      required this.email,
      required this.deliveryFees,
      required this.serviceType,
      required this.createdBy,
      required this.updatedBy,
      required this.deletedAt,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        nameAr,
        nameEn,
        cityId,
        areaId,
        addressDescription,
        addressDescriptionEn,
        firstPhone,
        secondPhone,
        email,
        email,
        deliveryFees,
        deliveryFees,
        serviceType,
        createdBy,
        updatedBy,
        deletedAt,
        createdAt,
        updatedAt
      ];
}

class Items extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String descriptionEn;
  final String price;
  final String calories;
  final String image;
  final String bestSeller;
  final String view;
  final String recommended;
  final String categoryId;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;
  final List<Extras> extras;
  final bool isHidden;
  final List<DoughType> doughType;
  final Pivot pivot;

  const Items(
      {required this.id,
      required this.nameAr,
      required this.nameEn,
      required this.descriptionAr,
      required this.descriptionEn,
      required this.price,
      required this.calories,
      required this.image,
      required this.bestSeller,
      required this.view,
      required this.recommended,
      required this.categoryId,
      required this.deletedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.extras,
      required this.isHidden,
      required this.doughType,
      required this.pivot});

  @override
  List<Object?> get props => [
        id,
        nameAr,
        descriptionAr,
        descriptionEn,
        price,
        calories,
        image,
        bestSeller,
        view,
        recommended,
        categoryId,
        deletedAt,
        createdAt,
        updatedAt,
        extras,
        isHidden,
        doughType,
        pivot
      ];
}

class Extras extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String descriptionEn;
  final String price;
  final String calories;
  final String categoryId;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;
  final String image;

  const Extras(
      {required this.id,
      required this.nameAr,
      required this.nameEn,
      required this.descriptionAr,
      required this.descriptionEn,
      required this.price,
      required this.calories,
      required this.categoryId,
      required this.deletedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.image});

  @override
  List<Object?> get props => [
        id,
        nameAr,
        nameEn,
        descriptionAr,
        descriptionEn,
        price,
        calories,
        categoryId,
        categoryId,
        deletedAt,
        createdAt,
        updatedAt,
        image
      ];
}

class DoughType extends Equatable {
  final String nameAr;
  final String nameEn;

  const DoughType({required this.nameAr, required this.nameEn});

  @override
  List<Object?> get props => [nameAr, nameEn];
}

class Pivot extends Equatable {
  final String orderId;
  final String itemId;
  final String itemExtras;
  final String itemWithouts;
  final String doughTypeAr;
  final String doughTypeEn;
  final String price;
  final String offerPrice;
  final String quantity;
  final String offerId;

  const Pivot(
      {required this.orderId,
      required this.itemId,
      required this.itemExtras,
      required this.itemWithouts,
      required this.doughTypeAr,
      required this.doughTypeEn,
      required this.price,
      required this.offerPrice,
      required this.quantity,
      required this.offerId});

  @override
  List<Object?> get props => [
        orderId,
        itemId,
        itemExtras,
        itemWithouts,
        doughTypeAr,
        doughTypeEn,
        price,
        offerPrice,
        quantity,
        offerId
      ];
}

class Address extends Equatable {
  final int? id;
  final String name;
  final String street;
  final String buildingNumber;
  final String floorNumber;
  final String landmark;
  final String cityId;
  final String areaId;
  final String customerId;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;
  final City? city;
  final Area? area;

  const Address(
      {required this.id,
      required this.name,
      required this.street,
      required this.buildingNumber,
      required this.floorNumber,
      required this.landmark,
      required this.cityId,
      required this.areaId,
      required this.customerId,
      required this.deletedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.city,
      required this.area});

  @override
  List<Object?> get props => [
        id,
        name,
        street,
        buildingNumber,
        floorNumber,
        landmark,
        cityId,
        areaId,
        customerId,
        deletedAt,
        createdAt,
        updatedAt,
        city,
        area
      ];
}

class City extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String descriptionEn;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;

  const City(
      {required this.id,
      required this.nameAr,
      required this.nameEn,
      required this.descriptionAr,
      required this.descriptionEn,
      required this.deletedAt,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        nameAr,
        nameEn,
        descriptionAr,
        descriptionEn,
        deletedAt,
        createdAt,
        updatedAt
      ];
}

class Area extends Equatable {
  final int id;
  final String cityId;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String descriptionEn;
  final String deliveryFees;
  final String minDeliveryAmmount;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;

  const Area(
      {required this.id,
      required this.cityId,
      required this.nameAr,
      required this.nameEn,
      required this.descriptionAr,
      required this.descriptionEn,
      required this.deliveryFees,
      required this.minDeliveryAmmount,
      required this.deletedAt,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        cityId,
        nameAr,
        nameEn,
        descriptionAr,
        descriptionEn,
        deliveryFees,
        minDeliveryAmmount,
        deletedAt,
        createdAt,
        updatedAt
      ];
}
