import 'dart:async';
import 'package:golden_toolkit/golden_toolkit.dart';

/// This file is automatically executed by Flutter Test before running tests.
/// We use it to ensure fonts and assets are loaded before taking Golden snapshots.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await loadAppFonts();
  return testMain();
}
