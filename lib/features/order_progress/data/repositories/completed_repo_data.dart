

import 'package:cashir/core/error/failures.dart';
import 'package:cashir/features/order_progress/data/data_sources/completed_order_data_source.dart';
import 'package:cashir/features/order_progress/domain/entities/complete_order.dart';
import 'package:cashir/features/order_progress/domain/repositories/completed_repositiry.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';

class CompletedOrderDataRepo extends BaseCompletedRepository{
  final BaseNetworkInfo networkInfo;
  final BaseCompletedOrderRemoteDataSource completedOrderRemoteDataSource;

  CompletedOrderDataRepo(
      {required this.networkInfo, required this.completedOrderRemoteDataSource});

  @override
  Future<Either<Failure, Completed>> putCompleted(int id) async {
    try {
      final completedOderRemote =
          await completedOrderRemoteDataSource.putCompleted(id);
      return Right(completedOderRemote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}