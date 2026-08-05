import '../entities/_entity.dart';

abstract class ChatRepository {
  Future<ChatEntity> getData();
}
