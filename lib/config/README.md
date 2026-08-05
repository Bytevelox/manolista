# lib/config — Documentación detallada

Propósito general

La carpeta `lib/config` agrupa toda la configuración de la aplicación: constantes, selección de entornos (flavors), carga de variables externas, y puntos de configuración global que no implementan lógica de negocio. Debe ser lo más declarativa posible.

Estructura recomendada y describción de subcarpetas/archivos

- env/
  - .env.example (plantilla de variables de entorno)
  - env_loader.dart (lógica para cargar variables de entorno desde assets o .env)

- flavors/
  - flavor.dart (enumeración de sabores: dev, staging, prod)
  - flavor_config.dart (clase que expone valores por flavor)

- constants/
  - app_constants.dart (strings usados globalmente: nombres, paths, keys)
  - ui_constants.dart (tamaños, paddings, breakpoints)

- config_loader.dart
  - Punto central para inicializar la configuración (lee env, selecciona flavor, setea timeouts, feature flags)

- logging/
  - logger.dart (configuración y adaptador del logger global)

- README.md (este archivo)

Recomendaciones y convenciones

- Mantener el código aquí libre de dependencias a `features`. Puede depender de `core` si hay utilidades neutrales.
- No colocar lógica de negocio, sólo wiring y valores. Si existe lógica compleja para seleccionar valores, factorizar a `core/utils` o a un helper claramente nombrado.
- Documentar cualquier variable de entorno en `.env.example` y anotar el propósito y tipo (string/int/bool).
- Evitar valores mágicos en el código: usar constantes nombradas.

Ejemplo sintético (pseudo-Dart)

// flavor_config.dart
class FlavorConfig {
  final String apiBaseUrl;
  final bool enableAnalytics;
  FlavorConfig({required this.apiBaseUrl, this.enableAnalytics = false});
}

// config_loader.dart
Future<void> initializeConfig(Flavor flavor) async {
  final config = flavor == Flavor.prod
    ? FlavorConfig(apiBaseUrl: 'https://api.prod')
    : FlavorConfig(apiBaseUrl: 'https://api.dev', enableAnalytics: false);
  // registrar en un singleton o inyección de dependencias
}

Cuándo añadir cosas en config

- Variables de entorno y sus lecturas.
- Bandera de features globales.
- Configuración de clientes (time-outs, límites) si no dependen de detalles de infra.

No incluir

- Repositorios, casos de uso o lógica de datos.
- Widgets ni código UI.

