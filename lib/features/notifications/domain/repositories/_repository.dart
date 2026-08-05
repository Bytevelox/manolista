import '../entities/_entity.dart';

abstract class NotificationRepository {
  Future<NotificationEntity> getData();
}
