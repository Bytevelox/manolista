import '../models/_model.dart';

abstract class SettingsRemoteDataSource {
  Future<SettingsModel> fetch();
}
