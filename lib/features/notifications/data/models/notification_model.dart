import 'package:cashir/features/home_navigator/data/models/customer_model.dart';

class NotificationModel {
  int? id;
  String? userId;
  String? chatId;
  String? body;
  List<dynamic>? data;
  String? type;
  String? createdAt;
  String? updatedAt;
  CustomerModel? customerModel;

  NotificationModel({
    this.id,
    this.userId,
    this.chatId,
    this.body,
    this.data,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.customerModel,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    userId = json['user_id'] ?? '';
    chatId = json['chat_id'] ?? '';
    body = json['body'] ?? '';
    data = json['data'] ?? [];
    type = json['type'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    customerModel = json['customer'] != null
        ? CustomerModel.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['chat_id'] = chatId;
    data['body'] = body;
    data['data'] = data;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['customer'] = customerModel;
    return data;
  }
}
