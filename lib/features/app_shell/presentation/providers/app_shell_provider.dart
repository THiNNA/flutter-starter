import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Manages the state of the App Shell (e.g., current bottom navigation tab)
/// If not relying completely on GoRouter's stateful shell.
final appShellProvider = StateProvider<int>((ref) => 0);
