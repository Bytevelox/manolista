import '../models/_model.dart';

abstract class ChatRemoteDataSource {
  Future<ChatModel> fetch();
}
