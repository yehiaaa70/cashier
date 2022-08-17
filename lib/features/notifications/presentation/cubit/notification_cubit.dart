import 'package:cashir/features/notifications/data/data_sources/call_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static NotificationCubit get(context) =>
      BlocProvider.of<NotificationCubit>(context);

  getAllNotifications(context) async {
    emit(NotificationIsLoading());
    await CallApiForNotification().getAppNotifications(context);
    emit(NotificationLoaded());
  }
}
