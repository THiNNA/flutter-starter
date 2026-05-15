import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/di/injection_container.dart';
import 'app.dart';

/// Bootstraps the application by initializing dependencies and running the root widget.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize GetIt Dependencies
  await initDI();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
