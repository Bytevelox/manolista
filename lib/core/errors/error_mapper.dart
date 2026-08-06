import 'package:dio/dio.dart';

class ErrorMapper {
  ErrorMapper._();

  static String fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Tiempo de conexión agotado';

      case DioExceptionType.receiveTimeout:
        return 'El servidor tardó demasiado en responder';

      case DioExceptionType.sendTimeout:
        return 'No se pudo enviar la solicitud';

      case DioExceptionType.connectionError:
        return 'No hay conexión con el servidor';

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response?.statusCode);

      default:
        return 'Ocurrió un error inesperado';
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Datos inválidos';

      case 401:
        return 'Correo o contraseña incorrectos';

      case 403:
        return 'No tienes permisos para realizar esta acción';

      case 404:
        return 'Servicio no encontrado';

      case 500:
        return 'Error interno del servidor';

      default:
        return 'Error desconocido del servidor';
    }
  }
}
