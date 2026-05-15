import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Welcome to App! Swipe to learn more.'),
        /// TODO: Implement Onboarding Carousel/Slides
        /// TODO: Mark onboarding as complete in SharedPrefs
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// TODO: Navigate to Login Page
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
