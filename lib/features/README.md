# lib/features — Documentación detallada

Propósito general

`lib/features` organiza las funcionalidades del dominio en módulos aislados. Cada feature debe ser independiente, testeable y seguir una estructura consistente que facilite el entendimiento y mantenimiento.

Estructura recomendada por feature

Cada carpeta de feature debe contener al menos estas subcarpetas:

- presentation/
  - screens/ (pantallas, routes)
  - widgets/ (componentes UI propios)
  - state/ (bloC, providers, viewmodels)
  - pages.dart o feature_router.dart (puntos de entrada UI)

- domain/
  - entities/ (modelos del dominio propios)
  - repositories/ (interfaces/abstract classes que definen la persistencia/servicios)
  - usecases/ (casos de uso o interactor: acción atómica del dominio)

- data/
  - datasources/ (API, local: implementación concreta de acceso a datos)
  - models/ (mapeo a DTO si difiere del entity)
  - repositories/ (implementaciones concretas de los repositorios)

- di/ (registro de dependencias o helper para registrar la feature en el DI global)
- feature.dart (barrel o fachada pública de la feature)
- README.md (documentación y contratos públicos de la feature)

Ejemplo de árbol para `features/auth`

features/
  auth/
    presentation/
      screens/
        login_screen.dart
      state/
        login_bloc.dart
    domain/
      entities/
        user.dart
      repositories/
        auth_repository.dart (abstract)
      usecases/
        login_usecase.dart
    data/
      datasources/
        auth_api.dart
      models/
        user_dto.dart
      repositories/
        auth_repository_impl.dart
    di/
      auth_di.dart
    feature.dart

Principios y reglas

- Encapsulamiento: todo lo que sea específico de la feature se queda dentro de ella.
- Comunicación entre features: preferir eventos, servicios compartidos (contratos en core) o un bus de mensajes. Evitar imports directos de una feature a otra.
- Tests: Cada layer debe tener tests: domain (unitario de usecases), data (mocks para datasources), presentation (tests de widgets y estados).
- API pública: Definir en `feature.dart` lo que la feature exporta al resto de la app (por ejemplo, un `AuthService` o `AuthModule` que registre routes y DI).

Patrones útiles

- Repository Pattern: define la interfaz en domain y la implementacion en data.
- Use Case / Interactor: encapsular lógica de negocio en casos de uso sencillos y testeables.
- State Management: elegir un patrón consistente (Bloc, Provider, Riverpod, MobX) y documentarlo en la raíz del proyecto.

Cómo añadir una nueva feature (pasos rápidos)

1. Crear la carpeta `features/<new_feature>`.
2. Añadir subcarpetas presentation/domain/data/di.
3. Definir las entidades y contratos del dominio primero.
4. Implementar los datasources y repositorios.
5. Implementar la UI y el wiring de routes.
6. Registrar la feature en el DI y en el enrutador de la app.
7. Añadir tests unitarios e integración.

               USER
                |
                |
          LoginScreen
                |
                |
        authProvider.login()
                |
                |
          AuthNotifier
                |
                |
          LoginUseCase
                |
                |
        AuthRepository
          (contrato)
                |
                |
     AuthRepositoryImpl
                |
                |
     AuthRemoteDataSource
          (contrato)
                |
                |
 AuthRemoteDataSourceImpl
                |
                |
          ApiClient
                |
                |
             Dio
                |
                |
            BACKEND


BACKEND RESPONSE

JSON
 |
 ↓
UserModel
 |
 ↓
UserEntity
 |
 ↓
AuthState
 |
 ↓
HomeScreen