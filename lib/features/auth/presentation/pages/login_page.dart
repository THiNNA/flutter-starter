import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../widgets/login_form.dart';

/// The main Login Screen.
/// 
/// Notice how clean this page is. It doesn't contain any business logic
/// or text controllers. It simply listens to the state and displays the form.
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for errors and show a snackbar
    // We use ref.listen instead of ref.watch because showing a dialog/snackbar
    // is a one-time "side effect", not a continuous state build.
    ref.listen(authProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
            backgroundColor: Colors.red,
          ),
        );
      } else if (next.hasValue && next.value != null) {
        // Success! User is logged in.
        // In a real app with go_router, you might redirect them to the Home page here,
        // or go_router's redirect logic will handle it automatically based on state.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Welcome, ${next.value!.name}!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.lock_outline, size: 80, color: Colors.blue),
              SizedBox(height: 32),
              // The extracted form widget
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
