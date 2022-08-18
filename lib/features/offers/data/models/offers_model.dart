class OffersModel {
  int? id;
  String? title;
  String? serviceType;
  String? dateFrom;
  String? dateTo;
  String? description;
  String? image;
  String? offerType;
  String? titleAr;
  String? descriptionAr;
  String? createdAt;
  String? updatedAt;
  String? createdBy;

  OffersModel({
    this.id,
    this.title,
    this.serviceType,
    this.dateFrom,
    this.dateTo,
    this.description,
    this.image,
    this.offerType,
    this.titleAr,
    this.descriptionAr,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
  });

  OffersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    title = json['title'] ?? '';
    serviceType = json['service_type'] ?? '';
    dateFrom = json['date_from'] ?? '';
    dateTo = json['date_to'] ?? '';
    description = json['description'] ?? '';
    image = json['image'] ?? '';
    offerType = json['offer_type'] ?? '';
    titleAr = json['title_ar'] ?? '';
    descriptionAr = json['description_ar'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    createdBy = json['created_by'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['service_type'] = this.serviceType;
    data['date_from'] = this.dateFrom;
    data['date_to'] = this.dateTo;
    data['description'] = this.description;
    data['image'] = this.image;
    data['offer_type'] = this.offerType;
    data['title_ar'] = this.titleAr;
    data['description_ar'] = this.descriptionAr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;

    return data;
  }
}
