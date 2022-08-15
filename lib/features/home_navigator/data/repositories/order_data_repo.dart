
import 'package:cashir/features/home_navigator/data/data_sources/all_orders_data_sources.dart';
import 'package:cashir/features/home_navigator/domain/entities/all_orders.dart';
import 'package:cashir/features/home_navigator/domain/repositories/base_orders_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';

class OrdersDataRepo extends BaseOrderRepository{

  final BaseNetworkInfo networkInfo;
  final BaseAllOrdersRemoteDataSource allOrdersRemoteDataSource;

  OrdersDataRepo({required this.networkInfo, required this.allOrdersRemoteDataSource});

  // final BaseRandomQuoteLocalDataSource randomQuoteLocalDataSource;


  @override
  Future<Either<Failure, AllCustomerOrders>> getAllCustomer() async {
    // if (await networkInfo.isConnected) {
      try {
        final getAllOrderRemote =
            await allOrdersRemoteDataSource.getAllOrders();
        // await randomQuoteLocalDataSource.cacheQuote(getAllOrderRemote);
        return Right(getAllOrderRemote);
      } on ServerException {
        return Left(ServerFailure());
      }
    // }
    // else {
    //   try {
    //     final cacheRandomQuote =
    //         await randomQuoteLocalDataSource.getLastRandomQuote();
    //     return Right(cacheRandomQuote);
    //   } on CacheException {
    //     return Left(CacheFailure());
    //   }
    // }
  }

}