import 'package:flutter/material.dart';

/// A reusable app bar for pages across different features.
class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SharedAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
