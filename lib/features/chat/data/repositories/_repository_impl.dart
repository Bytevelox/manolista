import '../../domain/entities/_entity.dart';
import '../../domain/repositories/_repository.dart';
import '../datasources/remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  const ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<ChatEntity> getData() async {
    await remoteDataSource.fetch();
    return const ChatEntity();
  }
}
