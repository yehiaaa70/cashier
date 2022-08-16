import 'package:cashir/core/error/failures.dart';
import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';
import 'package:cashir/features/new_orders/data/data_sources/accept_order_data_source.dart';
import 'package:cashir/features/new_orders/domain/repositories/base_accept_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../home_navigator/domain/entities/acceptor.dart';

class AcceptOrderDataRepo extends BaseAcceptRepository {
  final BaseNetworkInfo networkInfo;
  final BaseAcceptOrderRemoteDataSource acceptOrderRemoteDataSource;

  AcceptOrderDataRepo(
      {required this.networkInfo, required this.acceptOrderRemoteDataSource});

  @override
  Future<Either<Failure, Acceptor>> putAccept(int id) async {
    try {
      final acceptOderRemote = await acceptOrderRemoteDataSource.putAccept(id);
      // await randomQuoteLocalDataSource.cacheQuote(getAllOrderRemote);
      return Right(acceptOderRemote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Acceptor>> putCancel(OrderDetails order, String reason) async {
    try {
      final cancelOderRemote =
          await acceptOrderRemoteDataSource.putCancel(order, reason);
      return Right(cancelOderRemote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Acceptor>> putRejected(OrderDetails order, String reason) async {
    try {
      final rejectOderRemote =
          await acceptOrderRemoteDataSource.putReject(order, reason);
      return Right(rejectOderRemote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
