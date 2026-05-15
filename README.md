# Flutter Starter Project

A production-ready Flutter starter template built with **Feature-First Clean Architecture**.

## Architecture Overview
This project is structured for high scalability and maintainability:
- **`lib/app/`**: Application bootstrapping and initialization.
- **`lib/core/`**: Global utilities, constants, themes, network clients, and reusable widgets.
- **`lib/shared/`**: Reusable mixins, types, enums, and shared UI components.
- **`lib/features/`**: Isolated feature modules (e.g., Auth, Home, App Shell) strictly adhering to Clean Architecture (Domain, Data, Presentation).

Please read [`docs/core/architecture_guide.md`](docs/core/architecture_guide.md) for a detailed breakdown of the architectural rules and folder structure.

## 🧱 Code Generation (Mason)
We use Mason to instantly generate new Clean Architecture features. Instead of creating folders manually, you can run a single command. 
**Read the guide here:** 👉 [`docs/core/mason_guide.md`](docs/core/mason_guide.md)

## Tech Stack
- **State Management:** [Riverpod](https://riverpod.dev/)
- **Dependency Injection:** [GetIt](https://pub.dev/packages/get_it)
- **Routing:** [GoRouter](https://pub.dev/packages/go_router)
- **Networking:** [Dio](https://pub.dev/packages/dio)
- **Error Handling:** [fpdart](https://pub.dev/packages/fpdart)
- **Data Modeling:** [Freezed](https://pub.dev/packages/freezed) & [Json Serializable](https://pub.dev/packages/json_serializable)
- **Local Storage:** [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) & [Shared Preferences](https://pub.dev/packages/shared_preferences)

## Getting Started

1. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

2. **Generate Code (Freezed & JSON):**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run the App (Choose Environment):**
   ```bash
   flutter run -t lib/main_dev.dart
   # or
   flutter run -t lib/main_staging.dart
   # or
   flutter run -t lib/main_prod.dart
   ```
