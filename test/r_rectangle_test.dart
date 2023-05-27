import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:shape_builder/shape_builder.dart';
import 'package:path/path.dart' as path;

void main() {
  group(
    'rrectangle',
    () {
      testGoldens(
        '1- Shrink to take the min available space if both height and width'
        'are not specified and the child is null',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
                child: RRectangle(
              shouldExpand: true,
            )),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_0001');
        },
      );
      testGoldens(
        '1- Expands to take the max available space if both height and width'
        'are not specified and the child is null',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
                child: RRectangle(
              shouldExpand: true,
            )),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_001');
        },
      );
      testGoldens(
        '2- Takes the width is specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: RRectangle(
                width: 100,
                shouldExpand: true,
                color: Colors.red,
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_002');
        },
      );

      testGoldens(
        '3- Takes the height is specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: RRectangle(
                height: 100,
                shouldExpand: true,
                color: ColorWithGradient(
                    const LinearGradient(colors: [Colors.red, Colors.blue])),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_003');
        },
      );
      testGoldens(
        '4- Takes the both width and height are specified',
        (tester) async {
          await tester.pumpWidgetBuilder(
            Center(
              child: RRectangle(
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
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_004');
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
                  .buildRRect(),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_005');
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
                  .buildRRect(
                    width: 100,
                    height: 100,
                  ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_006');
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
                ).buildRRect(),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_007');
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
                  .buildRRect(
                    width: double.infinity,
                  ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_008');
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
                    .buildRRect(
                      height: double.infinity,
                    )),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_009');
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
                  .buildRRect(
                    width: double.infinity,
                    height: double.infinity,
                  ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_010');
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
                    .buildRRect(
                      width: 200,
                      height: 200,
                    )),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_011');
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
                      .buildRRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.center,
                        shrinkToClippedSize: true,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildRRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.centerRight,
                        shrinkToClippedSize: true,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildRRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.centerLeft,
                        clipBehavior: Clip.antiAlias,
                        shrinkToClippedSize: false,
                      )
                      .buildRRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.center,
                        shrinkToClippedSize: false,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildRRect(
                        width: 100,
                        height: 50,
                      )
                      .colorize(Colors.amber),
                  const Text('1 12 123 1234')
                      .background(
                        alignment: Alignment.centerRight,
                        shrinkToClippedSize: false,
                        clipBehavior: Clip.antiAlias,
                      )
                      .buildRRect(
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
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_012');
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
                      .buildRRect(
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
                          .buildRRect(
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
                          .buildRRect(
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
                          .buildRRect(
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
                          .buildRRect(
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
                          .buildRRect(
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
                          .buildRRect(
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
                          .buildRRect(
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
                          .buildRRect(
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
                          .buildRRect(
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
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_013');
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 100,
                      ),
                      const SizedBox(width: 8),
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
                          .buildRRect(
                            width: 100,
                            height: 80,
                          )
                          .colorize(Colors.amber),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 150,
                        // height: 200,
                        child: RRectangle(
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
                        // height: 200,
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
                            .buildRRect(
                              width: 100,
                              height: 80,
                            )
                            .colorize(Colors.amber),
                      ),
                      SizedBox(
                        width: 80,
                        // height: 200,
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
                            .buildRRect(
                              width: 100,
                              height: 80,
                            )
                            .colorize(Colors.amber),
                      ),
                      SizedBox(
                        width: 50,
                        // height: 80 * .8,
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
                            .buildRRect(
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
                          maxWidth: 300,
                          // maxHeight: 200,
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
                            .buildRRect(
                              width: 100,
                              height: 80,
                            )
                            .colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 80,
                          // maxHeight: 50,
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
                            .buildRRect(
                              width: 100,
                              height: 80,
                            )
                            .colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 50,
                          // maxHeight: 25,
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
                            .buildRRect(
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
                          maxWidth: 300,
                          // maxHeight: 200,
                        ),
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        )
                            .background(
                              shouldExpand: true,
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildRRect(
                              width: 100,
                              height: 80,
                            )
                            .colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 80,
                          // maxHeight: 50,
                        ),
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        )
                            .background(
                              shouldExpand: true,
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildRRect(
                              width: 100,
                              height: 80,
                            )
                            .colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 50,
                          // maxHeight: 25,
                        ),
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 100,
                        )
                            .background(
                              shouldExpand: true,
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildRRect(
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
                          maxWidth: 300,
                          maxHeight: 200,
                        ),
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildRRect(
                              width: 100,
                              height: 80,
                            )
                            .colorize(Colors.amber),
                      ),
                      ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 100,
                            maxHeight: 50,
                          ),
                          child: Image.memory(
                            data,
                            fit: BoxFit.cover,
                          )
                              .background(
                                alignment: Alignment.center,
                                clipBehavior: Clip.antiAlias,
                              )
                              .buildRRect(
                                width: 100,
                                height: 80,
                              )),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 50,
                          maxHeight: 25,
                        ),
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                        )
                            .background(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                            )
                            .buildRRect(
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
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_014');
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
                .buildRRect()
                .colorize(Colors.amber),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_015');
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
                    .buildRRect()
                    .colorize(Colors.amber),
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_016');
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
                  .buildRRect(
                    width: 400,
                  )
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_017');
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
                  .buildRRect(
                    width: 400,
                  )
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_018');
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
                  .buildRRect()
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_019');
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
                  .buildRRect(
                    height: 400,
                  )
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_020');
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
                  .buildRRect(
                    height: 40,
                  )
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_021');
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
                        .buildRRect()
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
                        .buildRRect()
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
                        .buildRRect()
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
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_022');
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
                        .buildRRect()
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
                        .buildRRect()
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
                        .buildRRect()
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
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_023');
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
                        .buildRRect(
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
                        .buildRRect(
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
                        .buildRRect(
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
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_024');
        },
      );

      testGoldens(
        '25- change border radius',
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
                    width: 300,
                    height: 300,
                  )
                      .background(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                      )
                      .buildRRect(
                        width: 150,
                        height: 150,
                      )
                      .colorize(Colors.amber),
                  Image.memory(
                    data,
                    fit: BoxFit.cover,
                    width: 300,
                    height: 300,
                  )
                      .background(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                      )
                      .buildRRect(
                          width: 150,
                          height: 150,
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.elliptical(20, 40),
                              right: Radius.circular(50)))
                      .colorize(Colors.amber),
                  Image.memory(
                    data,
                    fit: BoxFit.cover,
                    width: 300,
                    height: 300,
                  )
                      .background(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                      )
                      .buildRRect(
                          width: 150,
                          height: 150,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.elliptical(20, 40),
                              bottom: Radius.circular(50)))
                      .colorize(Colors.amber),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_025');
        },
      );

      testGoldens(
        '26- change outerVBorderRadius',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: RRectangle(
                        borderRadius: BorderRadius.circular(30),
                        outerVBorderRadius: const BorderRadius.all(
                          Radius.elliptical(20, 40),
                        ),
                        child: const FlutterLogo(
                          size: 100,
                        ),
                      ).colorize(Colors.amber),
                    ),
                  ).colorize(Colors.green),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: const FlutterLogo(
                        size: 100,
                      )
                          .background()
                          .buildRRect(
                            outerVBorderRadius: const BorderRadius.all(
                              Radius.elliptical(20, 40),
                            ),
                          )
                          .colorize(Colors.amber),
                    ),
                  ).colorize(Colors.green),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      )
                          .background(clipBehavior: Clip.antiAlias)
                          .buildRRect(
                            width: 70,
                            height: 70,
                            outerVBorderRadius: const BorderRadius.all(
                              Radius.elliptical(20, 40),
                            ),
                          )
                          .colorize(Colors.amber),
                    ),
                  ).colorize(Colors.green),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_026');
        },
      );

      testGoldens(
        '27- change outerHBorderRadius',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: RRectangle(
                        borderRadius: BorderRadius.circular(30),
                        outerHBorderRadius: const BorderRadius.all(
                          Radius.elliptical(20, 40),
                        ),
                        child: const FlutterLogo(
                          size: 100,
                        ),
                      ).colorize(Colors.amber),
                    ),
                  ).colorize(Colors.green),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: const FlutterLogo(
                        size: 100,
                      )
                          .background()
                          .buildRRect(
                            outerHBorderRadius: const BorderRadius.all(
                              Radius.elliptical(20, 40),
                            ),
                          )
                          .colorize(Colors.amber),
                    ),
                  ).colorize(Colors.green),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      )
                          .background(clipBehavior: Clip.antiAlias)
                          .buildRRect(
                            width: 70,
                            height: 70,
                            outerHBorderRadius: const BorderRadius.all(
                              Radius.elliptical(20, 40),
                            ),
                          )
                          .colorize(Colors.amber),
                    ),
                  ).colorize(Colors.green),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_027');
        },
      );

      testGoldens(
        '28- mix outerHBorderRadius and outerVBorderRadius',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: RRectangle(
                        borderRadius: BorderRadius.circular(30),
                        outerHBorderRadius: const BorderRadius.all(
                          Radius.elliptical(20, 40),
                        ),
                        outerVBorderRadius: const BorderRadius.all(
                          Radius.elliptical(20, 40),
                        ),
                        child: const FlutterLogo(
                          size: 100,
                        ),
                      ).colorize(Colors.amber),
                    ),
                  ).colorize(Colors.green),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: const FlutterLogo(
                        size: 100,
                      )
                          .background()
                          .buildRRect(
                            outerHBorderRadius: const BorderRadius.all(
                              Radius.elliptical(20, 40),
                            ),
                            outerVBorderRadius: const BorderRadius.all(
                              Radius.elliptical(20, 40),
                            ),
                          )
                          .colorize(Colors.amber),
                    ),
                  ).colorize(Colors.green),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      )
                          .background(clipBehavior: Clip.antiAlias)
                          .buildRRect(
                            width: 70,
                            height: 70,
                            outerHBorderRadius: const BorderRadius.all(
                              Radius.elliptical(20, 40),
                            ),
                            outerVBorderRadius: const BorderRadius.all(
                              Radius.elliptical(20, 40),
                            ),
                          )
                          .colorize(Colors.amber),
                    ),
                  ).colorize(Colors.green),
                ],
              ),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_028');
        },
      );

      testGoldens(
        '29- with clipBehavior with infinite sized width. case shouldExpand is true',
        (tester) async {
          final file = File(
            path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
          );
          final data = file.readAsBytesSync();
          await tester.pumpWidgetBuilder(
            Center(
                child: SizedBox(
              width: double.infinity,
              child: Image.memory(
                data,
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              )
                  .background(
                    shouldExpand: true,
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                  )
                  .buildRRect(
                    width: 100,
                    height: 80,
                  )
                  .colorize(Colors.amber),
            )),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_29');
        },
      );

      testGoldens(
        '30- with clipBehavior  case shouldExpand is true',
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
                width: 300,
                height: 300,
              )
                  .background(
                    shouldExpand: true,
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                  )
                  .buildRRect(
                    width: 100,
                    height: 80,
                  )
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_30');
        },
      );

      testGoldens(
        '32- with clipBehavior  case shouldExpand is true, shape width = null',
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
                width: 300,
                height: 300,
              )
                  .background(
                    shouldExpand: true,
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                  )
                  .buildRRect(
                    // width: 100,
                    height: 80,
                  )
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_31');
        },
      );

      testGoldens(
        '32- with clipBehavior  case shouldExpand is true, shape hight = null',
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
                width: 300,
                height: 300,
              )
                  .background(
                    shouldExpand: true,
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                  )
                  .buildRRect(
                    width: 100,
                    // height: 80,
                  )
                  .colorize(Colors.amber),
            ),
            wrapper: materialAppWrapper(
              theme: ThemeData.light(),
              platform: TargetPlatform.android,
            ),
          );
          await screenMatchesGolden(tester, 'rrectangle/rrectangle_32');
        },
      );
    },
  );

  testGoldens(
    '33- inkWell',
    (tester) async {
      dynamic message;
      await tester.pumpWidgetBuilder(
        Center(
          child: Column(
            children: [
              const Text('build background')
                  .background()
                  .inkWell(
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        message = 'onTap';
                      },
                    ),
                  )
                  .buildRRect(borderRadius: BorderRadius.circular(50)),
              const Text('build foreground')
                  .foreground()
                  .inkWell(
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        message = 'onTap';
                      },
                    ),
                  )
                  .buildRRect(borderRadius: BorderRadius.circular(50)),
            ],
          ),
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      expect(message, null);
      await tester.tap(find.text('build background'));
      await tester.pump();
      expect(message, 'onTap');
      message = null;
      await tester.press(find.text('build background'));
      await tester.press(find.text('build foreground'));

      await screenMatchesGolden(tester, 'rrectangle/rrectangle_33');
    },
  );
}
