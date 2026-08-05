# Responsabilidades de las carpetas en lib

Este documento define la estructura esperada para el proyecto y explica qué debe ir en cada carpeta para mantener una arquitectura limpia y escalable.

## Objetivo general

El proyecto sigue una arquitectura basada en:
- Feature First
- Clean Architecture
- Separación clara entre UI, dominio y datos

La idea es que cada feature sea independiente, que el código global viva en core y que las pantallas no se conviertan en contenedores de lógica de negocio.

---

## Estructura principal

- [lib/config](lib/config): configuración global y valores reutilizables
- [lib/core](lib/core): utilidades, servicios compartidos y abstracciones globales
- [lib/features](lib/features): módulos de negocio organizados por dominio
- [lib/shared](lib/shared): componentes reutilizables que no son tan globales como core
- [lib/main.dart](lib/main.dart): punto de entrada de la aplicación

---

## 1) lib/config

Responsabilidad:
- Mantener la configuración global de la app.
- Contener constantes, valores por entorno, flags, URLs base, temas y opciones compartidas.

Debe contener:
- constantes de la app
- configuración de entornos (dev, staging, prod)
- valores estáticos que no cambian con la lógica del negocio

No debe contener:
- lógica compleja de negocio
- widgets o pantallas
- clases de dominio específicas de una feature

---

## 2) lib/core

Responsabilidad:
- Alojar todo el código transversal que se reutiliza en varias features.
- Ser el lugar del núcleo técnico del proyecto.

Debe contener:
- servicios globales (network, storage, logger, DI, etc.)
- utilidades y helpers compartidos
- manejo de errores y excepciones
- router, theme, helpers de formato o validación
- widgets reutilizables a nivel de aplicación

Reglas:
- El core no debe depender de features específicas.
- Si algo se usa en más de una feature y no pertenece a una feature concreta, va aquí.
- Si algo es solo de una feature, no va en core.

---

## 3) lib/features

Responsabilidad:
- Agrupar las funcionalidades del negocio por dominio.
- Cada feature debe ser autónoma y tener su propia capa de presentación, dominio y datos.

### Estructura recomendada por feature

Por ejemplo, para [lib/features/auth](lib/features/auth):

- [lib/features/auth/data](lib/features/auth/data):
  - fuentes de datos remotas o locales
  - modelos de datos
  - repositorios concretos
  - adaptadores o mappers

- [lib/features/auth/domain](lib/features/auth/domain):
  - entidades del dominio
  - contratos de repositorio
  - casos de uso o use cases
  - reglas de negocio puras

- [lib/features/auth/presentation](lib/features/auth/presentation):
  - pantallas
  - páginas
  - widgets específicos
  - providers, controllers o view models
  - navegación local de la feature

### Reglas para las features
- Una feature solo debe conocer lo que necesita para cumplir su responsabilidad.
- No crear carpetas separadas por pantalla si ya existe una feature que agrupa varias pantallas del mismo dominio.
- Auth debe permanecer como una única feature, aunque tenga login, register y forgot password.
- Las features principales esperadas son:
  - auth
  - home
  - services
  - bookings
  - profile
  - chat
  - notifications
  - favorites
  - reviews
  - payments

---

## 4) lib/shared

Responsabilidad:
- Contener componentes reutilizables que se usan en varias pantallas pero que no son tan globales como los del core.

Debe contener:
- componentes UI compartidos
- widgets de uso general dentro de la app
- helpers visuales o layouts reutilizables

No debe contener:
- lógica de negocio específica
- datos o modelos de dominio
- servicios de infraestructura

---

## 5) lib/main.dart

Responsabilidad:
- Ser el punto de entrada de la aplicación.
- Inicializar la app y conectar la configuración global.

Debe contener:
- inicialización de la app
- configuración de MaterialApp / widgets base
- wiring inicial de dependencias si aplica

No debe contener:
- lógica de negocio compleja
- pantallas específicas
- reglas de dominio

---

## Qué debe ir en cada capa

### Data
- repositorios concretos
- data sources
- modelos DTO o response models
- mappers
- llamadas a API o almacenamiento local

### Domain
- entidades del negocio
- contratos de repositorio
- casos de uso
- reglas de negocio

### Presentation
- pantallas
- páginas
- widgets visuales
- state management
- controladores y view models

---

## Buenas prácticas

- Mantener las dependencias en una sola dirección: presentation -> domain -> data.
- Evitar que una feature dependa directamente de otra feature.
- Si algo se comparte entre varias features, moverlo a core o shared.
- Mantener cada feature encapsulada y fácil de probar.
- No mezclar UI con lógica de negocio en los widgets.

---

## Resumen rápido

- Si es global y transversal: va en core o config.
- Si es de una feature concreta: va en features/<feature>.
- Si es un componente visual reutilizable: va en shared o core/widgets.
- Si es pantalla o widget específico de una feature: va en presentation.
- Si es regla de negocio: va en domain.
- Si es acceso a datos: va en data.
