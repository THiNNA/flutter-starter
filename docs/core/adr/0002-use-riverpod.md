# ADR 0002: Use Riverpod for State Management and DI

**Date:** 2026-05-16
**Status:** Accepted

## Context
Flutter offers numerous state management solutions (Bloc, GetX, Provider, Riverpod). We needed a robust, compile-safe state management tool that also doubles as a lightweight Dependency Injection (DI) system for the Presentation layer, while allowing us to decouple UI from business logic.

## Decision
We chose **Riverpod**.
- We use `Provider` and `NotifierProvider` / `AsyncNotifierProvider` for robust state handling.
- We pair it with Freezed for immutable states.
- Global singletons (like Network Clients) are injected via `GetIt` in the `core/di/` layer, but Providers act as the bridge between UseCases and the UI.

## Consequences
- **Positive:** Compile-time safety for state reads. No `ProviderNotFoundException`. Easily testable by overriding providers in tests.
- **Negative:** Steeper learning curve than simple `Provider` or `GetX`. Requires passing `Ref` around.
