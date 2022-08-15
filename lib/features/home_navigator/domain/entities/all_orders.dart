
import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';
import 'package:equatable/equatable.dart';

class AllCustomerOrders extends Equatable {
  final bool success;
  final Data data;
  final String message;

  const AllCustomerOrders(
      {required this.success, required this.data, required this.message});

  @override
  List<Object?> get props => [success, data, message];
}

class Data extends Equatable {
  final int currentPage;
  final List<OrderDetails> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final String prevPageUrl;
  final int to;
  final int total;

  const Data(
      {required this.currentPage,
      required this.data,
      required this.firstPageUrl,
      required this.from,
      required this.lastPage,
      required this.lastPageUrl,
      required this.nextPageUrl,
      required this.path,
      required this.perPage,
      required this.prevPageUrl,
      required this.to,
      required this.total});

  @override
  List<Object?> get props => [
        currentPage,
        data,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        nextPageUrl,
        path,
        perPage,
        perPage,
        prevPageUrl,
        to,
        total
      ];
}
