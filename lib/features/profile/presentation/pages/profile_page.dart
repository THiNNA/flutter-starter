import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(
        child: Text('Profile Settings & Info'),
        /// TODO: Implement Profile UI
        /// TODO: Add Logout Button connecting to AuthProvider
      ),
    );
  }
}
