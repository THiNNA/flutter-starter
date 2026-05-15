# Enterprise Feature-First Clean Architecture

This project follows a strict **Feature-First + Clean Architecture** structure designed for high scalability, loose coupling, and robust testing in production environments.

## Technology Stack
- **State Management:** Riverpod
- **Dependency Injection:** GetIt
- **Routing:** GoRouter
- **Networking:** Dio
- **Data Modeling:** Freezed & Json Serializable
- **Functional Programming (Error Handling):** fpdart (`Either` monads)

## Project Structure (`lib/`)

### 1. `app/` (Application Layer)
Responsible for app initialization and bootstrapping.
- `app.dart`: The root `MaterialApp.router` widget.
- `bootstrap.dart`: Initializes `WidgetsFlutterBinding`, Dependency Injection (`GetIt`), and runs the app.
- `providers.dart`: Global Riverpod providers that don't belong to a specific feature.

### 2. `core/` (Core Layer)
Contains global, cross-cutting concerns shared across the entire application. **No feature-specific business logic is allowed here.**
- `config/`: Environment configurations (`dev`, `staging`, `prod`).
- `constants/`: Global constants, API endpoints, storage keys.
- `di/`: Dependency Injection setup (`injection_container.dart`).
- `errors/`: Custom Exceptions, Failures, and global error handlers.
- `extensions/`: Helpful extensions (e.g., `BuildContext`, `String`).
- `network/`: Dio client setup, interceptors, and generic API response models.
- `routing/`: GoRouter setup and route names.
- `services/`: Global services (if any, though prefer Feature Repositories).
- `storage/`: Secure storage and SharedPreferences helpers.
- `theme/`: App colors, typography, and light/dark theme definitions.
- `utils/`: Validators, formatters, and loggers.
- `widgets/`: Reusable UI components (e.g., `AppButton`, `EmptyStateWidget`).

### 3. `shared/` (Shared Layer)
Contains reusable UI widgets, enums, mixins, and types that are shared across multiple features, but do not belong in the global `core/` layer.
- `enums/`: Shared enums (e.g., `AppState`).
- `mixins/`: Reusable logic (e.g., `ValidationMixin`).
- `types/`: Type definitions (e.g., `FutureEither<T>`).
- `widgets/`: Feature-agnostic widgets (e.g., `SharedAppBar`).

### 4. `features/` (Feature Layer)
The main building blocks of the app. Each feature is an isolated module following Clean Architecture.

```text
features/[feature_name]/
├── data/
│   ├── datasources/  # Remote APIs (Dio) or Local Storage calls
│   ├── models/       # Freezed classes with JSON serialization
│   └── repositories/ # Concrete implementation of Domain Repositories
│
├── domain/
│   ├── entities/     # Pure Dart classes (No JSON/Flutter dependencies)
│   ├── repositories/ # Abstract interfaces defining what the feature can do
│   └── usecases/     # Single-responsibility business logic classes returning Either<Failure, Type>
│
└── presentation/
    ├── pages/        # Full-screen views
    ├── providers/    # Riverpod Notifiers that call UseCases
    └── widgets/      # UI components specific ONLY to this feature
```

## Architectural Rules 🚨

1. **Dependency Inversion (The Golden Rule):**
   - `Presentation` depends on `Domain`.
   - `Data` depends on `Domain`.
   - **`Domain` depends on NOTHING.** It must be pure Dart without flutter or external package dependencies (except `fpdart`).
2. **Error Handling:**
   - Do NOT throw exceptions in the UI or UseCases.
   - `Data` layer catches `Exceptions` (like `DioException`) and converts them into `Failures`.
   - `UseCases` always return `Either<Failure, SuccessType>`.
   - `Presentation` handles the `Failure` gracefully to show error messages.
3. **Feature Isolation:**
   - **Never import across features' presentation layers.**
   - If two features need the same widget, move it to `lib/core/widgets/`.
   - If two features need the same data, consider a shared core service or a shared feature module.
4. **Dependency Injection:**
   - Use `GetIt` for globally shared singletons, data sources, repositories, and usecases.
   - Use `Riverpod` purely for State Management in the Presentation layer. Providers should resolve their UseCases via GetIt (`sl<MyUseCase>()`).
