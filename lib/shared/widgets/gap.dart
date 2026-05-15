import 'package:flutter/material.dart';

/// A simple, reusable widget to add horizontal or vertical spacing.
class Gap extends StatelessWidget {
  final double size;

  const Gap(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size, height: size);
  }
}
