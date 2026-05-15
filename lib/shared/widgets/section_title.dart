import 'package:flutter/material.dart';
import '../../core/theme/app_typography.dart';

/// Reusable title header for sections within a page.
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTypography.heading1.copyWith(fontSize: 24),
    );
  }
}
