
import 'package:cashir/core/error/failures.dart';
import 'package:cashir/features/new_orders/data/data_sources/accept_order_data_source.dart';
import 'package:cashir/features/new_orders/domain/repositories/base_accept_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../home_navigator/domain/entities/acceptor.dart';

class AcceptOrderDataRepo extends BaseAcceptRepository{
  final BaseNetworkInfo networkInfo;
  final BaseAcceptOrderRemoteDataSource acceptOrderRemoteDataSource;

  AcceptOrderDataRepo({required this.networkInfo, required this.acceptOrderRemoteDataSource});

  @override
  Future<Either<Failure, Acceptor>> putAccept(int id) async {
    try {
      final acceptOderRemote =
          await acceptOrderRemoteDataSource.putAccept(id);
      // await randomQuoteLocalDataSource.cacheQuote(getAllOrderRemote);
      return Right(acceptOderRemote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}