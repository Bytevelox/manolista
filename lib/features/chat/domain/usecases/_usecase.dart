import '../entities/_entity.dart';
import '../repositories/_repository.dart';

class ChatUseCase {
  final ChatRepository repository;

  const ChatUseCase(this.repository);

  Future<ChatEntity> call() async {
    return repository.getData();
  }
}
