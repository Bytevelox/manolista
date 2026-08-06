Usuario

↓

LoginScreen

↓

AuthNotifier

↓

LoginUseCase

↓

AuthRepository (interface)

↓

AuthRepositoryImpl

↓

AuthRemoteDatasource

↓

Backend

↓

JSON

↓

UserModel

↓

RepositoryImpl

↓

LoginUseCase

↓

AuthNotifier

↓

AuthState

↓

Riverpod

↓

LoginScreen



features/
└── auth/
    │
    ├── data/
    │   │
    │   ├── datasources/
    │   │   ├── auth_remote_data_source.dart
    │   │   └── auth_remote_data_source_impl.dart
    │   │
    │   ├── models/
    │   │   └── user_model.dart
    │   │
    │   └── repositories/
    │       └── auth_repository_impl.dart
    │
    └── domain/
        │
        ├── entities/
        │   └── user_entity.dart
        │
        ├── repositories/
        │   └── auth_repository.dart
        │
        └── usecases/
            └── login_usecase.dart


AuthNotifier

↓

LoginUseCase

↓

AuthRepository

↓

AuthRepositoryImpl

↓

AuthRemoteDataSource

↓

AuthRemoteDataSourceImpl

↓

Dio

↓

Backend


Y la respuesta vuelve:

Backend

↓

JSON

↓

UserModel

↓

UserEntity

↓

AuthState

↓

UI