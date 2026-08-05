import '../entities/_entity.dart';

abstract class ServiceRepository {
  Future<ServiceEntity> getData();
}
