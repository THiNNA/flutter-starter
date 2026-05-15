import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';

/// The Notifier that manages the Authentication State.
final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() {
    return null; // Initial state: not logged in
  }

  /// Login triggered from UI
  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    
    // Resolve UseCase via GetIt
    final loginUseCase = sl<LoginUseCase>();
    
    final result = await loginUseCase.execute(email, password);
    
    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  /// Logout triggered from UI
  Future<void> logout() async {
    state = const AsyncValue.loading();
    
    final logoutUseCase = sl<LogoutUseCase>();
    await logoutUseCase.execute();
    
    state = const AsyncValue.data(null);
  }
}
