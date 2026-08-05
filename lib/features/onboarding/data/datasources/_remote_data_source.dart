import '../models/_model.dart';

abstract class OnboardingRemoteDataSource {
  Future<OnboardingModel> fetch();
}
