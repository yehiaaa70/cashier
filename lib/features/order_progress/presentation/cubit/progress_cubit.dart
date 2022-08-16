import 'package:bloc/bloc.dart';
import 'package:cashir/features/order_progress/domain/entities/complete_order.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_navigator/domain/entities/order_date.dart';
import '../../../order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
import '../../domain/use_cases/progress_use_case.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit()
      : super(ProgressInitial());


}
