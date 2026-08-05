import 'package:manolista/core/errors/exceptions.dart';

class NetworkException extends AppException {
  const NetworkException([super.message = 'No Internet']);
}
