import '../models/_model.dart';

abstract class ProviderRemoteDataSource {
  Future<ProviderModel> fetch();
}
