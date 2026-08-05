# Responsabilidades de las carpetas en /lib

Este documento describe las responsabilidades y convenciones sugeridas para cada carpeta dentro de `lib` de este proyecto. Sirve para entender la arquitectura, mantener límites claros entre capas y saber cómo añadir nuevas funcionalidades de forma consistente.

Estructura principal encontrada:

- [lib/config](C:/Users/Walid/Desktop/manolista.worktrees/lib-folder-responsibilities-doc/lib/config) - Configuración y constantes
- [lib/core](C:/Users/Walid/Desktop/manolista.worktrees/lib-folder-responsibilities-doc/lib/core) - Núcleo compartido y abstracciones
- [lib/features](C:/Users/Walid/Desktop/manolista.worktrees/lib-folder-responsibilities-doc/lib/features) - Módulos/funcionalidades por dominio
- [lib/main.dart](C:/Users/Walid/Desktop/manolista.worktrees/lib-folder-responsibilities-doc/lib/main.dart) - Punto de entrada de la aplicación

---

1) lib/config

Responsabilidad:
- Contener la configuración de la aplicación: constantes, parámetros por entorno, carga de variables de entorno y configuración global (p. ej. timeouts, keys, flags de feature). También puede incluir la configuración de routing o temas si se considera "configuración" y no lógica de negocio.

Contenido típico:
- constantes.dart (claves, strings, tamaños por defecto)
- env.dart / flavor.dart (selección de entorno: dev/staging/prod)
- config_loader.dart (si hay lógica para leer archivos/assets o .env)

Reglas y recomendaciones:
- No incluir lógica de negocio ni servicios con comportamiento complejo.
- Mantener tipos estáticos y seguros (evitar mágia en strings sin comentar).
- Si se usa inyección de dependencias, colocar la configuración de ambientes aquí o un punto único que sea consumido desde el bootstrap.
- Documentar cambios de configuración en el archivo o en el README de la carpeta.

---

2) lib/core

Responsabilidad:
- Contener todo lo que es compartido entre features y que no pertenece a ninguna funcionalidad concreta: abstracciones, utilidades, modelos base, manejo de errores, implementaciones genéricas de servicios (client HTTP, logger), helpers y componentes UI reutilizables.

Contenido típico:
- models/ (entidades genéricas o DTOs que se comparten)
- errors/ (excepciones, mapeo de errores)
- network/ (cliente HTTP, interceptors)
- services/ (interfaces y adaptadores reutilizables)
- utils/ (helpers, extensiones)
- widgets/ (componentes UI reutilizables: botones, layouts comunes)

Reglas y recomendaciones:
- Mantener el core lo más estable posible: cambios aquí impactan muchas features.
- Separar interfaces (contratos) de implementaciones concretas. Preferir que features dependan de interfaces del core y no de implementaciones concretas.
- Exportar un barrel file (`core.dart`) para importar desde features: `import 'package:project_name/core.dart';`.
- Evitar dependencias hacia features desde core para prevenir ciclos.

---

3) lib/features

Responsabilidad:
- Implementar las funcionalidades del dominio en módulos independientes y encapsulados. Cada feature debe contener su propia estructura (idealmente siguiendo capas: presentation, domain, data) para facilitar testing, entendimiento y reuso.

Estructura sugerida por feature (ejemplo `features/auth`):
- features/
  - auth/
    - presentation/ (widgets, pantallas, controllers/blocs/viewmodels)
    - domain/ (entidades del dominio, casos de uso / usecases, interfaces de repositorio)
    - data/ (implementaciones de repositorio, fuentes de datos: API, local)
    - widgets/ (componentes específicos de la feature)
    - auth_exports.dart (barrel file local si hace falta)

Reglas y recomendaciones:
- Encapsular internamente: otras features deben interactuar con la feature a través de su API pública o mediante contratos/servicios (interfaces en core o domain).
- Mantener dependencias hacia `core` y `config` únicamente; evitar que features se dependan entre sí directamente (usar eventos, servicios compartidos o repositorios definidos en core para comunicar).
- Tests: cada feature debe tener sus tests unitarios y de integración localizados en `test/features/<feature_name>/...`.
- Documentar la API pública de la feature en un README dentro de la carpeta cuando la feature expone contratos usados por otras partes.

---

4) lib/main.dart

Responsabilidad:
- Punto de arranque de la aplicación. Inicializa la configuración global, el DI (si aplica), handlers globales de errores, logging y lanza la aplicación (por ejemplo `runApp(MyApp())` si es Flutter).

Buenas prácticas:
- Mantener `main.dart` lo más pequeño posible: delegar la lógica de bootstrap a un archivo/función (ej.: `bootstrap.dart` en `core` o `config`) para mantener testabilidad.
- No incluir lógica de negocio aquí: solo inicialización y wiring.

---

Convenciones y buenas prácticas generales

- Separación de capas: donde aplique, seguir la separación presentation/domain/data para cada feature.
- Barrels: usar archivos barrel (`index`/`exports`) por carpeta para simplificar imports y controlar la API pública de cada módulo.
- Naming: usar nombres consistentes y en inglés o español según el estándar del repositorio (preferir inglés en proyectos abiertos). Ej.: `auth_repository.dart`, `get_current_user_usecase.dart`.
- Tests: cada carpeta relevante debe incluir su equivalente de tests. Mantener unitarios dentro de `test/` y organizar por feature.
- Evitar ciclos de dependencia: las dependencias deben apuntar desde features -> core/config, nunca al revés. Usar contratos/abstract classes para invertir dependencias cuando sea necesario.
- Documentación local: cada feature y cada carpeta core deben tener un README corto explicando su propósito y puntos de contacto con el resto de la app.

Cómo añadir una nueva feature (pasos recomendados)

1. Crear `features/<feature_name>/` con subcarpetas `presentation`, `domain`, `data`.
2. Definir las interfaces y casos de uso en `domain/`.
3. Implementar repositorios y data sources en `data/`.
4. Implementar la UI y controladores en `presentation/`.
5. Añadir tests unitarios y de integración en `test/features/<feature_name>/`.
6. Añadir un barrel `features/<feature_name>/index.dart` que exporte lo público.
7. Registrar la feature en el wiring/DI si la app lo requiere (p. ej. en `main.dart` o en el bootstrap).

Comprobaciones de calidad antes de mergear cambios

- ¿El cambio introduce dependencia entre features? Evitarlo.
- ¿Existe documentación o README en la carpeta modificada? Añadir si falta.
- ¿Se añadieron tests para la nueva lógica? Incluirlos.
- ¿Los nombres y exports son claros y limitan la API pública del módulo?

---

Si quieres, puedo:
- Generar un README por cada carpeta (`lib/config/README.md`, `lib/core/README.md`, `lib/features/README.md`).
- Crear un template de feature con la estructura sugerida.
- Añadir un barrel `lib/core.dart` o `lib/features/index.dart` si los deseas.

Dime cuál de estas acciones prefieres y la realizo (por ejemplo, "crear templates y READMEs" o "solo crear README principal").
