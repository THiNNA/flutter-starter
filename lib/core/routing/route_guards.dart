import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import 'route_names.dart';

/// Handles auth-based redirection.
String? authGuard(BuildContext context, GoRouterState state, Ref ref) {
  final authState = ref.read(authProvider);
  
  final isLoggingIn = state.matchedLocation == RouteNames.login;
  
  // NOTE: In a real app, you should check a synchronous token or initialization state 
  // rather than a loading AsyncValue to prevent flashing.
  if (authState.value == null && !isLoggingIn) {
    return RouteNames.login;
  }
  
  if (authState.value != null && isLoggingIn) {
    return RouteNames.home;
  }
  
  return null;
}
