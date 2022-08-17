import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationIsLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {}
