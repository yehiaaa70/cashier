
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home_navigator/domain/entities/acceptor.dart';

abstract class BaseAcceptRepository{
  Future<Either<Failure, Acceptor>> putAccept(int id);
}