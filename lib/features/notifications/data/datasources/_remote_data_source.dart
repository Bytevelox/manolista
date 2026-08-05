import '../models/_model.dart';

abstract class NotificationRemoteDataSource {
  Future<NotificationModel> fetch();
}
