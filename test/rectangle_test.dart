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
        '2- Takes the width is specified',
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
        '3- Takes the height is specified',
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
        '4- Takes the both width and height are specified',
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
        '5- Takes the  child specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: const Text('Hi this is me')
                  .background(
                    color: ColorWithGradient(
                      const RadialGradient(colors: [Colors.red, Colors.blue]),
                    ),
                  )
                  .buildRect(),
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
        '6- the  child, width and height are specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: const Text('Hi this is me')
                  .background(
                    boxShadow: BoxShadowWithElevation(5, color: Colors.red),
                  )
                  .buildRect(
                    width: 100,
                    height: 100,
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
        '7- the  child, with Sized box',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: const Text('Hi this is me').background(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(4, 4),
                      spreadRadius: 5,
                      blurRadius: 3,
                    )
                  ],
                ).buildRect(),
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
        '8- with  child, with width double. infinity',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: const Text('Hi this is me')
                  .background(
                    alignment: Alignment.centerRight,
                  )
                  .buildRect(
                    width: double.infinity,
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
        '9- with  child, with height double. infinity',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
                child: const Text('Hi this is me')
                    .background(
                      alignment: Alignment.bottomCenter,
                    )
                    .buildRect(
                      height: double.infinity,
                    )),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_009');
        },
      );
      testGoldens(
        '10- with  child, with width and height = double. infinity',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: const Text('Hi this is me')
                  .background(
                    alignment: Alignment.bottomRight,
                  )
                  .buildRect(
                    width: double.infinity,
                    height: double.infinity,
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
                    .buildRect(
                      width: 200,
                      height: 200,
                    )),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_011');
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
                      .buildRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.center,
                        clipShrink: true,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.centerRight,
                        clipShrink: true,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.centerLeft,
                        clipBehavior: Clip.antiAlias,
                        clipShrink: false,
                      )
                      .buildRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.center,
                        clipShrink: false,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.centerRight,
                        clipShrink: false,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber)
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
                  Image.memory(
                    data,
                    fit: BoxFit.cover,
                  )
                      .background(
                        alignment: Alignment.topLeft,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildRect(
                        width: 100,
                        height: 50,
                      )
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
                          .buildRect(
                            width: 100,
                            height: 50,
                          )
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
                          .buildRect(
                            width: 100,
                            height: 50,
                          )
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
                          .buildRect(
                            width: 100,
                            height: 50,
                          )
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
                          .buildRect(
                            width: 100,
                            height: 50,
                          )
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
                          .buildRect(
                            width: 100,
                            height: 50,
                          )
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
                          .buildRect(
                            width: 100,
                            height: 50,
                          )
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
                          .buildRect(
                            width: 100,
                            height: 50,
                          )
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
                          .buildRect(
                            width: 100,
                            height: 50,
                          )
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
                          .buildRect(
                            width: 100,
                            height: 50,
                          )
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
                      .buildRect(
                        width: 100,
                        height: 80,
                      )
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
                            .buildRect(
                              width: 100,
                              height: 80,
                            )
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
                            .buildRect(
                              width: 100,
                              height: 80,
                            )
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
                            .buildRect(
                              width: 100,
                              height: 80,
                            )
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
                            .buildRect(
                              width: 100,
                              height: 80,
                            )
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
                            .buildRect(
                              width: 100,
                              height: 80,
                            )
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
                            .buildRect(
                              width: 100,
                              height: 80,
                            )
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
                            .buildRect(
                              width: 100,
                              height: 80,
                            )
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
                              .buildRect(
                                width: 100,
                                height: 80,
                              )),
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
                            .buildRect(
                              width: 100,
                              height: 80,
                            )
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
          await screenMatchesGolden(tester, 'rectangle/rectangle_014');
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
                .buildRect()
                .colorize(Colors.amber),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rectangle/rectangle_015');
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
                height: 400,
                child: Image.memory(
                  data,
                  fit: BoxFit.cover,
                )
                    .background(
                      clipBehavior: Clip.antiAlias,
                    )
                    .buildRect()
                    .colorize(Colors.amber),
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
                  .buildRect(
                    width: 400,
                  )
                  .colorize(Colors.amber),
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
                  .buildRect(
                    width: 400,
                  )
                  .colorize(Colors.amber),
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
                  .buildRect()
                  .colorize(Colors.amber),
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
                  .buildRect(
                    height: 400,
                  )
                  .colorize(Colors.amber),
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
              child: Image.memory(
                data,
                fit: BoxFit.cover,
              )
                  .background(
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                  )
                  .buildRect(
                    height: 40,
                  )
                  .colorize(Colors.amber),
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
                    child: Image.memory(
                      data,
                      fit: BoxFit.cover,
                    )
                        .background(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.center,
                        )
                        .buildRect()
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
                        .buildRect()
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
                        .buildRect()
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
                        .buildRect()
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
                        .buildRect()
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
                        .buildRect()
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
                        .buildRect(
                          width: 150,
                          height: 150,
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
                        .buildRect(
                          width: 150,
                          height: 150,
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
                        .buildRect(
                          width: 150,
                          height: 150,
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
          await screenMatchesGolden(tester, 'rectangle/rectangle_024');
        },
      );
    },
  );
}
