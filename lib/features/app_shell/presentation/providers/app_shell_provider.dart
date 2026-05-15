import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Manages the current bottom navigation tab index.
final appShellProvider = NotifierProvider<AppShellNotifier, int>(AppShellNotifier.new);

class AppShellNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setTab(int index) => state = index;
}
