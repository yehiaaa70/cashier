import 'package:bloc/bloc.dart';
import 'package:cashir/features/new_orders/domain/entities/cancel_model_use_case.dart';
import 'package:cashir/features/new_orders/domain/use_cases/accept_order_use_case.dart';
import 'package:cashir/features/new_orders/domain/use_cases/cancel_order_use_case.dart';
import 'package:cashir/features/new_orders/domain/use_cases/rejected_order_use_case.dart';
import 'package:cashir/features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_navigator/domain/entities/acceptor.dart';
import '../../../home_navigator/domain/entities/order_date.dart';
import '../../../order_progress/domain/entities/complete_order.dart';
import '../../../order_progress/domain/use_cases/progress_use_case.dart';

part 'acceptor_state.dart';

class AcceptorCubit extends Cubit<AcceptorState> {
  AcceptorCubit(
      this.acceptOrdersUseCase,
      this.tabBarStatusCubit,
      this.completedOrdersUseCase,
      this.cancelOrdersUseCase,
      this.rejectOrdersUseCase)
      : super(AcceptorInitial());

  final TabBarStatusCubit tabBarStatusCubit;
  final AcceptOrdersUseCase acceptOrdersUseCase;
  final CompletedOrdersUseCase completedOrdersUseCase;
  final CancelOrdersUseCase cancelOrdersUseCase;
  final RejectOrdersUseCase rejectOrdersUseCase;

  List<OrderDetails> pending = [];
  List<OrderDetails> progress = [];
  List<OrderDetails> completed = [];
  List<OrderDetails> canceled = [];
  List<OrderDetails> rejected = [];

  Future<void> acceptOrders(OrderDetails details) async {
    emit(AcceptorLoading());
    Either<Failure, Acceptor> response = await acceptOrdersUseCase(details);
    emit(response.fold(
        (failure) => AcceptorError(message: _mapFailureToMessage(failure)),
        (accept) {
      updatePendingLists(accept);
      return AcceptorLoaded(accept);
    }));
  }

  Future<void> completedOrders(OrderDetails details) async {
    emit(AcceptorLoading());
    Either<Failure, Completed> response = await completedOrdersUseCase(details);
    emit(response.fold(
        (failure) => AcceptorError(message: _mapFailureToMessage(failure)),
        (completed) {
      updateProgressLists(completed);
      return ProgressLoaded(completed);
    }));
  }

  Future<void> cancelOrders(OrderDetails details, String reason,String state) async {
    emit(AcceptorLoading());
    Either<Failure, Acceptor> response = await cancelOrdersUseCase(
        CancelModel(orderDetails: details, reason: reason));
    emit(response.fold(
        (failure) => AcceptorError(message: _mapFailureToMessage(failure)),
        (cancel) {
      updateCancelLists(cancel, reason,state);
      return AcceptorLoaded(cancel);
    }));
  }

  Future<void> rejectOrders(OrderDetails details, String reason) async {
    emit(AcceptorLoading());
    Either<Failure, Acceptor> response = await rejectOrdersUseCase(
        CancelModel(orderDetails: details, reason: reason));
    emit(response.fold(
        (failure) => AcceptorError(message: _mapFailureToMessage(failure)),
        (reject) {
      updateRejectLists(reject, reason);
      return AcceptorLoaded(reject);
    }));
  }


  updatePendingLists(Acceptor accept) {
    OrderDetails pendingOrder =
        pending.where((element) => element.id == accept.data.id).first;

    OrderDetails progressOrder = OrderDetails(
        id: pendingOrder.id,
        state: "in-progress",
        address: pendingOrder.address,
        addressId: pendingOrder.addressId,
        branch: pendingOrder.branch,
        branchId: pendingOrder.branchId,
        cancellationReason: pendingOrder.cancellationReason,
        createdAt: pendingOrder.createdAt,
        paymentType: pendingOrder.paymentType,
        createdBy: pendingOrder.createdBy,
        customer: pendingOrder.customer,
        customerId: pendingOrder.customerId,
        deletedAt: pendingOrder.deletedAt,
        deliveryFees: pendingOrder.deliveryFees,
        items: pendingOrder.items,
        offerType: pendingOrder.offerType,
        orderFrom: pendingOrder.orderFrom,
        pointsPaid: pendingOrder.pointsPaid,
        serviceType: pendingOrder.serviceType,
        subtotal: pendingOrder.subtotal,
        taxes: pendingOrder.taxes,
        total: pendingOrder.total,
        updatedAt: pendingOrder.updatedAt,
        updatedBy: pendingOrder.updatedBy, offerValue: pendingOrder.offerValue);

    progress.add(progressOrder);

    pending.removeWhere((element) => element.id == accept.data.id);

    tabBarStatusCubit.changeLength(
        pending.length, progress.length, completed.length, "progress",
        canceled: canceled.length, rejected: rejected.length);
  }

  updateCancelLists(Acceptor accept, String reason, String state) {
    if(state=="pending"){
      OrderDetails pendingOrder =
          pending.where((element) => element.id == accept.data.id).first;
      OrderDetails cancelOrder = OrderDetails(
          id: pendingOrder.id,
          state: "canceled",
          cancellationReason: reason,
          address: pendingOrder.address,
          addressId: pendingOrder.addressId,
          branch: pendingOrder.branch,
          branchId: pendingOrder.branchId,
          createdAt: pendingOrder.createdAt,
          createdBy: pendingOrder.createdBy,
          customer: pendingOrder.customer,
          customerId: pendingOrder.customerId,
          deletedAt: pendingOrder.deletedAt,
          deliveryFees: pendingOrder.deliveryFees,
          items: pendingOrder.items,
          offerType: pendingOrder.offerType,
          orderFrom: pendingOrder.orderFrom,
          paymentType: pendingOrder.paymentType,
          pointsPaid: pendingOrder.pointsPaid,
          serviceType: pendingOrder.serviceType,
          subtotal: pendingOrder.subtotal,
          taxes: pendingOrder.taxes,
          total: pendingOrder.total,
          updatedAt: pendingOrder.updatedAt,
          updatedBy: pendingOrder.updatedBy
          , offerValue: pendingOrder.offerValue);
      canceled.add(cancelOrder);
      pending.removeWhere((element) => element.id == accept.data.id);
    }else if(state=="progress"){
      OrderDetails pendingOrder =
          progress.where((element) => element.id == accept.data.id).first;
      OrderDetails cancelOrder = OrderDetails(
          id: pendingOrder.id,
          state: "canceled",
          cancellationReason: reason,
          address: pendingOrder.address,
          addressId: pendingOrder.addressId,
          branch: pendingOrder.branch,
          branchId: pendingOrder.branchId,
          createdAt: pendingOrder.createdAt,
          paymentType: pendingOrder.paymentType,
          createdBy: pendingOrder.createdBy,
          customer: pendingOrder.customer,
          customerId: pendingOrder.customerId,
          deletedAt: pendingOrder.deletedAt,
          deliveryFees: pendingOrder.deliveryFees,
          items: pendingOrder.items,
          offerType: pendingOrder.offerType,
          orderFrom: pendingOrder.orderFrom,
          pointsPaid: pendingOrder.pointsPaid,
          serviceType: pendingOrder.serviceType,
          subtotal: pendingOrder.subtotal,
          taxes: pendingOrder.taxes,
          total: pendingOrder.total,
          updatedAt: pendingOrder.updatedAt,
          updatedBy: pendingOrder.updatedBy,
          offerValue: pendingOrder.offerValue);
      canceled.add(cancelOrder);
      progress.removeWhere((element) => element.id == accept.data.id);
    }else{
      print("errrrrrrrrrrrrrror");
    }


    tabBarStatusCubit.changeLength(
        pending.length,
        progress.length,
        completed.length,
        canceled: canceled.length,
        rejected: rejected.length,
        "canceled");
  }

  updateRejectLists(Acceptor accept, String reason) {
    OrderDetails pendingOrder =
        pending.where((element) => element.id == accept.data.id).first;

    OrderDetails rejectOrder = OrderDetails(
        id: pendingOrder.id,
        state: "rejected",
        cancellationReason: reason,
         paymentType: pendingOrder.paymentType,
        address: pendingOrder.address,
        addressId: pendingOrder.addressId,
        branch: pendingOrder.branch,
        branchId: pendingOrder.branchId,
        createdAt: pendingOrder.createdAt,
        createdBy: pendingOrder.createdBy,
        customer: pendingOrder.customer,
        customerId: pendingOrder.customerId,
        deletedAt: pendingOrder.deletedAt,
        deliveryFees: pendingOrder.deliveryFees,
        items: pendingOrder.items,
        offerType: pendingOrder.offerType,
        orderFrom: pendingOrder.orderFrom,
        pointsPaid: pendingOrder.pointsPaid,
        serviceType: pendingOrder.serviceType,
        subtotal: pendingOrder.subtotal,
        taxes: pendingOrder.taxes,
        total: pendingOrder.total,
        updatedAt: pendingOrder.updatedAt,
        updatedBy: pendingOrder.updatedBy, offerValue: pendingOrder.offerValue);

    rejected.add(rejectOrder);

    pending.removeWhere((element) => element.id == accept.data.id);

    tabBarStatusCubit.changeLength(
        pending.length,
        progress.length,
        completed.length,
        canceled: canceled.length,
        rejected: rejected.length,
        "rejected");
  }

  updateProgressLists(Completed completedModel) {
    OrderDetails progressOrder =
        progress.where((element) => element.id == completedModel.data.id).first;

    OrderDetails completedOrder = OrderDetails(
        id: progressOrder.id,
        state: "completed",
        address: progressOrder.address,
        addressId: progressOrder.addressId,
        branch: progressOrder.branch,
        branchId: progressOrder.branchId,
        cancellationReason: progressOrder.cancellationReason,
        createdAt: progressOrder.createdAt,
        createdBy: progressOrder.createdBy,
        customer: progressOrder.customer,
        customerId: progressOrder.customerId,
        deletedAt: progressOrder.deletedAt,
        deliveryFees: progressOrder.deliveryFees,
        items: progressOrder.items,
        offerType: progressOrder.offerType,
        orderFrom: progressOrder.orderFrom,
        pointsPaid: progressOrder.pointsPaid,
        serviceType: progressOrder.serviceType,
        subtotal: progressOrder.subtotal,
        taxes: progressOrder.taxes,
        total: progressOrder.total,
        updatedAt: progressOrder.updatedAt,
        updatedBy: progressOrder.updatedBy, offerValue: progressOrder.offerValue, paymentType: progressOrder.paymentType);

    completed.add(completedOrder);

    progress.removeWhere((element) => element.id == completedModel.data.id);

    tabBarStatusCubit.changeLength(
        pending.length,
        progress.length,
        completed.length,
        canceled: canceled.length,
        rejected: rejected.length,
        "completed");
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }

}
