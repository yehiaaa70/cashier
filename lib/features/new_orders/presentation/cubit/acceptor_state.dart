part of 'acceptor_cubit.dart';

@immutable
abstract class AcceptorState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AcceptorInitial extends AcceptorState {}

class AcceptorLoading extends AcceptorState {}

class AcceptorLoaded extends AcceptorState {
  final Acceptor acceptor;

  AcceptorLoaded(this.acceptor);

  @override
  List<Object?> get props => [acceptor];
}

class ProgressLoaded extends AcceptorState {
  final Completed completed;

  ProgressLoaded(this.completed);

  @override
  List<Object?> get props => [completed];
}

class AcceptorError extends AcceptorState {
  final String message;

  AcceptorError({required this.message});

  @override
  List<Object> get props => [message];
}
