import '../models/_model.dart';

abstract class BookingRemoteDataSource {
  Future<BookingModel> fetch();
}
