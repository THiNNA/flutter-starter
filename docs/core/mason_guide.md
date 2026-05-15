# 🧱 Mason Feature Generator Guide

This project uses [Mason](https://pub.dev/packages/mason_cli) to automate the creation of Clean Architecture feature boilerplate. Instead of manually creating 9-12 folders and files every time you start a new feature, you can generate them instantly with a single command.

## 1. Prerequisites

First, you need to install the Mason CLI globally on your machine:

```bash
dart pub global activate mason_cli
```

## 2. Initialize Mason (If not done yet)

If this is your first time using Mason in this repository, initialize it and add the local brick:

```bash
# Initialize mason (creates mason.yaml at root if it doesn't exist)
mason init

# Add the local clean_feature brick to your mason.yaml
mason add clean_feature --path ./bricks/clean_feature

# Get all bricks
mason get
```

## 3. Generate a New Feature

To generate a new feature (e.g., `payment`, `dashboard`), simply run:

```bash
mason make clean_feature
```

The CLI will prompt you:
```text
? What is the name of the feature?
```
Type your feature name in lowercase (e.g., `payment`) and hit Enter.

### What gets generated?

If you type `payment`, Mason will instantly generate the following structure in `lib/features/payment/`:

```text
lib/features/payment/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── pages/
    │   └── payment_page.dart
    ├── providers/
    │   └── payment_provider.dart
    └── widgets/
```

The `payment_page.dart` and `payment_provider.dart` will be fully scaffolded with the correct naming conventions (`PaymentPage`, `paymentProvider`).

## 4. Next Steps

After generation, you should:
1. Add your feature's Route in `lib/core/routing/route_names.dart` and `app_router.dart`.
2. Connect your provider to the newly generated Page.
3. Build out your DataSources and UseCases as the feature grows!
