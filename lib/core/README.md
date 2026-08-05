# lib/core — Documentación detallada

Propósito general

`lib/core` contiene las abstracciones, utilidades y componentes compartidos entre features. Es la "capa de infraestructura y contratos" del proyecto: modelos base, interfaces (repositorios, servicios), clientes de red, manejo de errores y widgets reutilizables.

Estructura recomendada y descripción de subcarpetas/archivos

- api/
  - http_client.dart (cliente HTTP central con interceptors y manejo de errores)
  - api_exceptions.dart (mapa de excepciones y transformación de errores)

- models/
  - base_entity.dart (interfaces o bases para modelos serializables)
  - response_wrappers.dart (estructuras genéricas de respuesta)

- errors/
  - app_error.dart (clases de error usadas en toda la app)
  - error_mapper.dart (mapea errores externos a AppError)

- services/
  - analytics_service.dart (contrato e implementación opcional)
  - storage_service.dart (contrato para persistencia local)

- dependency_injection/
  - di_container.dart (registro de dependencias: singletons, factories)

- utils/
  - date_utils.dart
  - string_utils.dart
  - validators.dart

- widgets/
  - common_button.dart
  - responsive_scaffold.dart

- core.dart (barrel file que exporta lo público del core)

Reglas y recomendaciones

- Mantener interfaces separadas de implementaciones: definir contratos en `core/services` y concretarlos en `infrastructure` o en la carpeta `data` de cada feature.
- Evitar dependencias hacia `features` o `config` (solo se permiten dependencias hacia `config` si la configuración es puramente declarativa).
- Proveer un `core.dart` que exporte elementos públicos para importar desde features con una sola línea.
- Hacer `core` lo más estable posible: cambios aquí requieren coordinación.

Patrón de inversión de dependencias

- Definir repositorios como abstract classes en `core` o en `features/<feature>/domain`.
- Registrar implementaciones concretas en `dependency_injection/di_container.dart`.
- Las features deben depender de los contratos (interfaces), no de las implementaciones.

Ejemplo sintético (pseudo-Dart)

// api/http_client.dart
class HttpClient {
  Future<Response> get(String path) async {
    // implem con interceptors
  }
}

// services/storage_service.dart
abstract class StorageService {
  Future<void> write(String key, String value);
  Future<String?> read(String key);
}

// dependency_injection/di_container.dart
final container = ServiceLocator();
void registerCore() {
  container.registerSingleton<HttpClient>(HttpClient());
}

Pruebas y calidad

- Las utilidades y servicios en core deben tener tests unitarios muy completos porque impactan todo el proyecto.
- Evitar lógica específica de dominio aquí — si aparece, moverlo a la feature correspondiente.

