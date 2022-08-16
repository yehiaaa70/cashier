part of 'progress_cubit.dart';

@immutable
abstract class ProgressState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProgressInitial extends ProgressState {}



class ProgressLoading extends ProgressState {}

class ProgressLoaded extends ProgressState {
  final Completed completed;

  ProgressLoaded(this.completed);


  @override
  List<Object?> get props => [completed];
}


class ProgressError extends ProgressState {
  final String message;

  ProgressError({required this. message});

  @override
  List<Object> get props => [message];
}