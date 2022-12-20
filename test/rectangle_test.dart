import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:shape_builder/shape_builder.dart';
import 'package:path/path.dart' as path;

void main() {
  group(
    'rectangle',
    () {
      testGoldens(
        'Expands to take the max available space if both height and width'
        'are not specified and the child is null',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(child: Rectangle()),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_001');
        },
      );
      testGoldens(
        'Takes the width is specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                width: 100,
                color: Colors.red,
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_002');
        },
      );

      testGoldens(
        'Takes the height is specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                height: 100,
                color: ColorWithGradient(
                    const LinearGradient(colors: [Colors.red, Colors.blue])),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_003');
        },
      );
      testGoldens(
        'Takes the both width and height are specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                height: 100,
                width: 100,
                color: ColorWithGradient(
                    const RadialGradient(colors: [Colors.red, Colors.blue])),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_004');
        },
      );

      testGoldens(
        'Takes the  child specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                color: ColorWithGradient(
                    const RadialGradient(colors: [Colors.red, Colors.blue])),
                child: const Text('Hi this is me'),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_005');
        },
      );

      testGoldens(
        'the  child, width and height are specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                width: 100,
                height: 100,
                boxShadow: BoxShadowWithElevation(5, color: Colors.red),
                child: const Text('Hi this is me'),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_006');
        },
      );

      testGoldens(
        'the  child, with Sized box',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Rectangle(
                  child: const Text('Hi this is me'),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(4, 4),
                      spreadRadius: 5,
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_007');
        },
      );

      testGoldens(
        'with  child, with width double. infinity',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: const Text('Hi this is me'),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_008');
        },
      );
      testGoldens(
        'with  child, with height double. infinity',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                height: double.infinity,
                alignment: Alignment.bottomCenter,
                child: const Text('Hi this is me'),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_009');
        },
      );
      testGoldens(
        'with  child, with width and height = double. infinity',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.bottomRight,
                child: const Text('Hi this is me'),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_010');
        },
      );

      testGoldens(
        ' with paintStyle',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                width: 200,
                height: 200,
                paintStyle: PaintStyle(
                  style: PaintingStyle.stroke,
                  strokeWidth: 10,
                  strokeJoin: StrokeJoin.round,
                  strokeCap: StrokeCap.square,
                  strokeMiterLimit: 20,
                ),
                child: const Text('Hi this is me'),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_011');
        },
      );

      testGoldens(
        ' with clipBehavior',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Column(
                children: [
                  const Text('1 12 123 1234'),
                  Rectangle(
                    width: 100,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    clipBehavior: Clip.antiAlias,
                    child: const Text('1 12 123 1234'),
                  ).colorize(Colors.amber),
                  Rectangle(
                    width: 100,
                    height: 50,
                    alignment: Alignment.center,
                    clipShrink: true,
                    clipBehavior: Clip.antiAlias,
                    child: const Text('1 12 123 1234'),
                  ).colorize(Colors.amber),
                  Rectangle(
                    width: 100,
                    height: 50,
                    alignment: Alignment.centerRight,
                    clipShrink: true,
                    clipBehavior: Clip.antiAlias,
                    child: const Text('1 12 123 1234'),
                  ).colorize(Colors.amber),
                  Rectangle(
                    width: 100,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    clipBehavior: Clip.antiAlias,
                    clipShrink: false,
                    child: const Text('1 12 123 1234'),
                  ).colorize(Colors.amber),
                  Rectangle(
                    width: 100,
                    height: 50,
                    alignment: Alignment.center,
                    clipShrink: false,
                    clipBehavior: Clip.antiAlias,
                    child: const Text('1 12 123 1234'),
                  ).colorize(Colors.amber),
                  Rectangle(
                    width: 100,
                    height: 50,
                    alignment: Alignment.centerRight,
                    clipShrink: false,
                    clipBehavior: Clip.antiAlias,
                    child: const Text('1 12 123 1234'),
                  ).colorize(Colors.amber),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_012');
        },
      );
      testGoldens(
        '13- with clipBehavior and image',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Column(
                children: [
                  Image.memory(
                    data,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 100,
                  ),
                  const SizedBox(height: 8),
                  Rectangle(
                    width: 100,
                    height: 50,
                    alignment: Alignment.topLeft,
                    clipBehavior: Clip.antiAlias,
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                    ),
                  ).colorize(Colors.amber),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Rectangle(
                        width: 100,
                        height: 50,
                        alignment: Alignment.topLeft,
                        clipBehavior: Clip.antiAlias,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        ),
                      ).colorize(Colors.amber),
                      Rectangle(
                        width: 100,
                        height: 50,
                        alignment: Alignment.topCenter,
                        clipBehavior: Clip.hardEdge,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        ),
                      ).colorize(Colors.amber),
                      Rectangle(
                        width: 100,
                        height: 50,
                        alignment: Alignment.topRight,
                        clipBehavior: Clip.hardEdge,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        ),
                      ).colorize(Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Rectangle(
                        width: 100,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        clipBehavior: Clip.antiAlias,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        ),
                      ).colorize(Colors.amber),
                      Rectangle(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        clipBehavior: Clip.hardEdge,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        ),
                      ).colorize(Colors.amber),
                      Rectangle(
                        width: 100,
                        height: 50,
                        alignment: Alignment.centerRight,
                        clipBehavior: Clip.hardEdge,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        ),
                      ).colorize(Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Rectangle(
                        width: 100,
                        height: 50,
                        alignment: Alignment.bottomLeft,
                        clipBehavior: Clip.antiAlias,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        ),
                      ).colorize(Colors.amber),
                      Rectangle(
                        width: 100,
                        height: 50,
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.hardEdge,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        ),
                      ).colorize(Colors.amber),
                      Rectangle(
                        width: 100,
                        height: 50,
                        alignment: Alignment.bottomRight,
                        clipBehavior: Clip.hardEdge,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        ),
                      ).colorize(Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_013');
        },
      );

      testGoldens(
        '14 - with clipBehavior and image with sized box',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Column(
                children: [
                  Image.memory(
                    data,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 100,
                  ),
                  const SizedBox(height: 8),
                  Rectangle(
                    width: 100,
                    height: 80,
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 100,
                    ),
                  ).colorize(Colors.amber),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: Rectangle(
                          width: 100,
                          height: 80,
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          child: Image.memory(
                            data,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 100,
                          ),
                        ).colorize(Colors.amber),
                      ),
                      SizedBox(
                        width: 150,
                        height: 90,
                        child: Rectangle(
                          width: 100,
                          height: 80,
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          child: Image.memory(
                            data,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 100,
                          ),
                        ).colorize(Colors.amber),
                      ),
                      SizedBox(
                        width: 100 * .8,
                        height: 80 * .8,
                        child: Rectangle(
                          width: 100,
                          height: 80,
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          child: Image.memory(
                            data,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 100,
                          ),
                        ).colorize(Colors.amber),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 200,
                          maxHeight: 100,
                        ),
                        child: Rectangle(
                          width: 100,
                          height: 80,
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          child: Image.memory(
                            data,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 100,
                          ),
                        ).colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 150,
                          maxHeight: 90,
                        ),
                        child: Rectangle(
                          width: 100,
                          height: 80,
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          child: Image.memory(
                            data,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 100,
                          ),
                        ).colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 100 * .8,
                          maxHeight: 80 * .8,
                        ),
                        child: Rectangle(
                          width: 100,
                          height: 80,
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          child: Image.memory(
                            data,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 100,
                          ),
                        ).colorize(Colors.amber),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 200,
                          maxHeight: 100,
                        ),
                        child: Rectangle(
                          width: 100,
                          height: 80,
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          child: Image.memory(
                            data,
                            fit: BoxFit.cover,
                          ),
                        ).colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 150,
                          maxHeight: 90,
                        ),
                        child: Rectangle(
                          width: 100,
                          height: 80,
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          child: Image.memory(
                            data,
                            fit: BoxFit.cover,
                          ),
                        ).colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 100 * .8,
                          maxHeight: 80 * .8,
                        ),
                        child: Rectangle(
                          width: 100,
                          height: 80,
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          child: Image.memory(
                            data,
                            fit: BoxFit.cover,
                          ),
                        ).colorize(Colors.amber),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_014');
        },
      );

      testGoldens(
        ' with clipBehavior and image with both image w and h  and rect w and h are null',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Rectangle(
              clipBehavior: Clip.antiAlias,
              child: Image.memory(
                data,
                fit: BoxFit.cover,
              ),
            ).colorize(Colors.amber),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_015');
        },
      );

      testGoldens(
        ' with clipBehavior and image with both image w and h  and rect w and h are null'
        'Case inside sized box',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: SizedBox(
                width: 400,
                height: 400,
                child: Rectangle(
                  clipBehavior: Clip.antiAlias,
                  child: Image.memory(
                    data,
                    fit: BoxFit.cover,
                  ),
                ).colorize(Colors.amber),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_016');
        },
      );

      testGoldens(
        ' with clipBehavior and image with both only rect w is given',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                width: 400,
                clipBehavior: Clip.antiAlias,
                child: Image.memory(
                  data,
                  fit: BoxFit.cover,
                ),
              ).colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_017');
        },
      );
      testGoldens(
        ' with clipBehavior and image with both only rect w is given'
        'With alignment to top left',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                width: 400,
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.topLeft,
                child: Image.memory(
                  data,
                  fit: BoxFit.cover,
                ),
              ).colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_018');
        },
      );

      testGoldens(
        ' with clipBehavior and image with both only image w is given',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                child: Image.memory(
                  data,
                  width: 400,
                  fit: BoxFit.cover,
                ),
              ).colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_019');
        },
      );

      testGoldens(
        ' with clipBehavior and image with both only rect h is given',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                height: 400,
                clipBehavior: Clip.antiAlias,
                child: Image.memory(
                  data,
                  fit: BoxFit.cover,
                ),
              ).colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_020');
        },
      );

      testGoldens(
        '21- with clipBehavior and image with both only image h is given',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                child: Image.memory(
                  data,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ).colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_021');
        },
      );

      testGoldens(
        '22- with clipBehavior and image without any dimension and with different sized box',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 300,
                    ),
                    // width: 300,
                    // height: 300,
                    child: Rectangle(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                      ),
                    ).colorize(Colors.amber),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Rectangle(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                      ),
                    ).colorize(Colors.amber),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Rectangle(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                      ),
                    ).colorize(Colors.amber),
                  ),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_022');
        },
      );

      testGoldens(
        '23- with clipBehavior and image without img  dimension and with different sized box',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 300,
                    ),
                    // width: 300,
                    // height: 300,
                    child: Rectangle(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      child: Image.memory(
                        data,
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ).colorize(Colors.amber),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Rectangle(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 250,
                        height: 250,
                      ),
                    ).colorize(Colors.amber),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Rectangle(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 250,
                        height: 250,
                      ),
                    ).colorize(Colors.amber),
                  ),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_023');
        },
      );

      testGoldens(
        '24- with clipBehavior and image without rect  dimension and with different sized box',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 300,
                    ),
                    child: Rectangle(
                      width: 150,
                      height: 150,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 300,
                        height: 300,
                      ),
                    ).colorize(Colors.amber),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 200,
                      maxHeight: 200,
                    ),
                    child: Rectangle(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      width: 150,
                      height: 150,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 300,
                        height: 300,
                      ),
                    ).colorize(Colors.amber),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 100,
                      maxHeight: 100,
                    ),
                    child: Rectangle(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      width: 150,
                      height: 150,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 300,
                        height: 300,
                      ),
                    ).colorize(Colors.amber),
                  ),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_024');
        },
      );
    },
  );
}

class _CustomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width / 2, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
