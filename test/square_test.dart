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
        '1- Expands to take the max available space if both height and width'
        'are not specified and the child is null',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(child: Rectangle.square()),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_001');
        },
      );
      testGoldens(
        '2- Takes the width is specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle.square(
                side: 100,
                color: Colors.red,
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_002');
        },
      );

      testGoldens(
        '3- Takes the height is specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle.square(
                side: 100,
                color: ColorWithGradient(
                    const LinearGradient(colors: [Colors.red, Colors.blue])),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_003');
        },
      );
      testGoldens(
        '4- Takes the both width and height are specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Rectangle.square(
                side: 100,
                color: ColorWithGradient(
                    const RadialGradient(colors: [Colors.red, Colors.blue])),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_004');
        },
      );
      testGoldens(
        '5- Takes the  child specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: const Text('Hi this is me').foreground().buildSquare(),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_005');
        },
      );

      testGoldens(
        '6- the  child,  the side is given',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: const Text('Hi this is me')
                  .background(
                    boxShadow: BoxShadowWithElevation(5, color: Colors.red),
                  )
                  .buildSquare(100),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_006');
        },
      );

      testGoldens(
        '7- the  child, with Sized box',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: SizedBox(
                width: 200,
                height: 100,
                child: const Text('Hi this is me').background(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(4, 4),
                      spreadRadius: 5,
                      blurRadius: 3,
                    )
                  ],
                ).buildSquare(),
              ).colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_007');
        },
      );

      testGoldens(
        '8- with  child, with side set to double. infinity',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: const Text('Hi this is me')
                  .background(
                    alignment: Alignment.centerRight,
                  )
                  .buildSquare(
                    double.infinity,
                  ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_008');
        },
      );
      testGoldens(
        '9- with  child, side set to double. infinity',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
                child: const Text('Hi this is me')
                    .background(
                      alignment: Alignment.bottomCenter,
                    )
                    .buildSquare(
                      double.infinity,
                    )),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_009');
        },
      );

      testGoldens(
        '11- with paintStyle',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
                child: const Text('Hi this is me')
                    .background(
                      paintStyle: PaintStyle(
                        style: PaintingStyle.stroke,
                        strokeWidth: 10,
                        strokeJoin: StrokeJoin.round,
                        strokeCap: StrokeCap.square,
                        strokeMiterLimit: 20,
                      ),
                    )
                    .buildSquare(
                      200,
                    )),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_011');
        },
      );

      testGoldens(
        '12- with clipBehavior',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: Column(
                children: [
                  const Text('1 12 123 1234'),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.centerLeft,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildSquare(80)
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.center,
                        clipShrink: true,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildSquare(80)
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.centerRight,
                        clipShrink: true,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildSquare(80)
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.centerLeft,
                        clipBehavior: Clip.antiAlias,
                        clipShrink: false,
                      )
                      .buildSquare(80)
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.center,
                        clipShrink: false,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildSquare(80)
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.centerRight,
                        clipShrink: false,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildSquare(80)
                      .colorize(Colors.amber)
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_012');
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
                  Image.memory(
                    data,
                    fit: BoxFit.cover,
                  )
                      .background(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildSquare(80)
                      .colorize(Colors.amber),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 100,
                      )
                          .background(
                            alignment: Alignment.topLeft,
                            clipBehavior: Clip.antiAlias,
                          )
                          .buildSquare(100)
                          .colorize(Colors.amber),
                      Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 100,
                      )
                          .background(
                            alignment: Alignment.topCenter,
                            clipBehavior: Clip.hardEdge,
                          )
                          .buildSquare(100)
                          .colorize(Colors.amber),
                      Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 100,
                      )
                          .background(
                            alignment: Alignment.topRight,
                            clipBehavior: Clip.hardEdge,
                          )
                          .buildSquare(100)
                          .colorize(Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 100,
                      )
                          .background(
                            alignment: Alignment.centerLeft,
                            clipBehavior: Clip.antiAlias,
                          )
                          .buildSquare(100)
                          .colorize(Colors.amber),
                      Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 100,
                      )
                          .background(
                            alignment: Alignment.center,
                            clipBehavior: Clip.hardEdge,
                          )
                          .buildSquare(100)
                          .colorize(Colors.amber),
                      Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 100,
                      )
                          .background(
                            alignment: Alignment.centerRight,
                            clipBehavior: Clip.hardEdge,
                          )
                          .buildSquare(100)
                          .colorize(Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 100,
                      )
                          .background(
                            alignment: Alignment.bottomLeft,
                            clipBehavior: Clip.antiAlias,
                          )
                          .buildSquare(100)
                          .colorize(Colors.amber),
                      Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 100,
                      )
                          .background(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.hardEdge,
                          )
                          .buildSquare(100)
                          .colorize(Colors.amber),
                      Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 100,
                      )
                          .background(
                            alignment: Alignment.bottomRight,
                            clipBehavior: Clip.hardEdge,
                          )
                          .buildSquare(100)
                          .colorize(Colors.amber),
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
          await screenMatchesGolden(tester, 'square/square_013');
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
                  Image.memory(
                    data,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 100,
                  )
                      .background(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildSquare(80)
                      .colorize(Colors.amber),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildSquare(80)
                            .colorize(Colors.amber),
                      ),
                      SizedBox(
                        width: 150,
                        height: 90,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildSquare(80)
                            .colorize(Colors.amber),
                      ),
                      SizedBox(
                        width: 100 * .8,
                        height: 80 * .8,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildSquare(80)
                            .colorize(Colors.amber),
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
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildSquare(80)
                            .colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 150,
                          maxHeight: 90,
                        ),
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildSquare(80)
                            .colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 100 * .8,
                          maxHeight: 80 * .8,
                        ),
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildSquare(80)
                            .colorize(Colors.amber),
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
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildSquare(80)
                            .colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 150,
                          maxHeight: 90,
                        ),
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildSquare(80),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 100 * .8,
                          maxHeight: 80 * .8,
                        ),
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildSquare(80)
                            .colorize(Colors.amber),
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
          await screenMatchesGolden(tester, 'square/square_014');
        },
      );

      testGoldens(
        '15- with clipBehavior and image with both image w and h  and rect w and h are null',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Image.memory(
              data,
              fit: BoxFit.cover,
            )
                .background(
                  clipBehavior: Clip.antiAlias,
                )
                .buildSquare()
                .colorize(Colors.amber),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_015');
        },
      );

      testGoldens(
        '16- with clipBehavior and image with both image w and h  and rect w and h are null'
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
                height: 200,
                child: Image.memory(
                  data,
                  fit: BoxFit.cover,
                )
                    .background(
                      clipBehavior: Clip.antiAlias,
                    )
                    .buildSquare()
                    .colorize(Colors.amber),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_016');
        },
      );

      testGoldens(
        '17- with clipBehavior and image with both only rect w is given',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Image.memory(
                data,
                fit: BoxFit.cover,
              )
                  .background(
                    clipBehavior: Clip.antiAlias,
                  )
                  .buildSquare(400)
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_017');
        },
      );
      testGoldens(
        '18 - with clipBehavior and image with both only rect w is given'
        'With alignment to top left',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Image.memory(
                data,
                fit: BoxFit.cover,
              )
                  .background(
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.topLeft,
                  )
                  .buildSquare(40)
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_018');
        },
      );

      testGoldens(
        '19- with clipBehavior and image with both only image w is given',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Image.memory(
                data,
                fit: BoxFit.cover,
                width: 400,
              )
                  .background(
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                  )
                  .buildSquare()
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_019');
        },
      );

      testGoldens(
        '20- with clipBehavior and image with both only rect h is given',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Image.memory(
                data,
                fit: BoxFit.cover,
              )
                  .background(
                    clipBehavior: Clip.antiAlias,
                  )
                  .buildSquare(
                    400,
                  )
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_020');
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
              child: Image.memory(
                data,
                fit: BoxFit.cover,
              )
                  .background(
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                  )
                  .buildSquare(40)
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_021');
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
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                    )
                        .background(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                        )
                        .buildSquare()
                        .colorize(Colors.amber),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                    )
                        .background(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                        )
                        .buildSquare()
                        .colorize(Colors.amber),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                    )
                        .background(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                        )
                        .buildSquare()
                        .colorize(Colors.amber),
                  ),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_022');
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
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                      width: 250,
                      height: 250,
                    )
                        .background(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                        )
                        .buildSquare()
                        .colorize(Colors.amber),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                      width: 250,
                      height: 250,
                    )
                        .background(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                        )
                        .buildSquare()
                        .colorize(Colors.amber),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                      width: 250,
                      height: 250,
                    )
                        .background(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                        )
                        .buildSquare()
                        .colorize(Colors.amber),
                  ),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_023');
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
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                      width: 300,
                      height: 300,
                    )
                        .background(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                        )
                        .buildSquare(
                          150,
                        )
                        .colorize(Colors.amber),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 200,
                      maxHeight: 200,
                    ),
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                      width: 300,
                      height: 300,
                    )
                        .background(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                        )
                        .buildSquare(
                          150,
                        )
                        .colorize(Colors.amber),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 100,
                      maxHeight: 100,
                    ),
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                      width: 300,
                      height: 300,
                    )
                        .background(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                        )
                        .buildSquare(
                          150,
                        )
                        .colorize(Colors.amber),
                  ),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'square/square_024');
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
