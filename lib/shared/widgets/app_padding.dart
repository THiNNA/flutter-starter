import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';

/// Reusable padding wrapper enforcing standard design system spacing.
class AppPadding extends StatelessWidget {
  final Widget child;
  final double padding;

  const AppPadding({
    super.key,
    required this.child,
    this.padding = AppSpacing.md,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }
}
