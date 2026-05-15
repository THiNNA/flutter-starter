import 'package:flutter/material.dart';

/// Centralized border radius definitions.
class AppRadius {
  static const double sm = 4.0;
  static const double md = 8.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double circular = 999.0;

  static const Radius rSm = Radius.circular(sm);
  static const Radius rMd = Radius.circular(md);
  static const Radius rLg = Radius.circular(lg);
  
  static final BorderRadius bSm = BorderRadius.circular(sm);
  static final BorderRadius bMd = BorderRadius.circular(md);
  static final BorderRadius bLg = BorderRadius.circular(lg);
  static final BorderRadius bCircular = BorderRadius.circular(circular);
}
