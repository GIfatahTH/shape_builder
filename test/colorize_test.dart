import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shape_builder/shape_builder.dart';

void main() {
  testGoldens(
    'test colorize',
    (WidgetTester tester) async {
      final builder = GoldenBuilder.column()
        ..addScenario('default', const Text('HI This is me').colorize())
        ..addScenario(
          'red',
          const Text('HI This is me').colorize(Colors.red),
        )
        ..addScenario(
          'amber',
          const Text('HI This is me').colorize(Colors.amber),
        );

      //
      await tester.pumpWidgetBuilder(
        builder.build(),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'colorize');
    },
  );
}
