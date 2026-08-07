Usuario escribe email/password
            |
            v
LoginScreen
            |
            v
AuthNotifier.login()
            |
            v
LoginUseCase
            |
            v
AuthRepositoryImpl
            |
            v
AuthRemoteDataSourceImpl
            |
            v
Dio POST /login
            |
            v
Backend responde:
{
 id,
 first_name,
 last_name,
 profile_img_url,
 token,
 isActive
}
            |
            v
AuthSessionEntity
            |
            +----------------+
            |                |
            v                v
 TokenStorage             AuthState
 guarda JWT               mantiene sesión en memoria
            |
            v
FlutterSecureStorage