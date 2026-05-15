import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_starter/core/widgets/app_button.dart';

void main() {
  group('AppButton Golden Tests', () {
    testGoldens('AppButton renders correctly', (tester) async {
      final builder = GoldenBuilder.column()
        ..addScenario(
          'Primary Button',
          AppButton(
            text: 'Primary',
            onPressed: () {},
          ),
        )
        ..addScenario(
          'Disabled Button',
          const AppButton(
            text: 'Disabled',
            onPressed: null,
          ),
        )
        ..addScenario(
          'Loading Button',
          AppButton(
            text: 'Loading',
            isLoading: true,
            onPressed: () {},
          ),
        );

      await tester.pumpWidgetBuilder(builder.build());
      await screenMatchesGolden(tester, 'app_button_states');
    });
  });
}
