import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
        /// TODO: Implement initialization logic (e.g., check auth status, load config)
        /// TODO: Navigate to Next Page (Login or Home) after loading
      ),
    );
  }
}
