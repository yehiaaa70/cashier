import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationIsLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {}

class NotificationError extends NotificationState {
  final String msg;

  const NotificationError({required this.msg});

  @override
  List<Object> get props => [msg];
}
