import '../entities/_entity.dart';

abstract class BookingRepository {
  Future<BookingEntity> getData();
}
