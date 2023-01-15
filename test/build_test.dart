import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shape_builder/shape_builder.dart';
import 'package:path/path.dart' as path;

void main() {
  testGoldens('build with different size', (tester) async {
    await tester.pumpWidgetBuilder(
      Center(
        child: Column(
          children: [
            Row(
              children: [
                Rectangle.square(
                  side: 100,
                  color: Colors.blue.withOpacity(.5),
                ).background().build(
                      Rectangle.square(
                        color: Colors.red,
                        side: 10,
                      ),
                    ),
                Rectangle.square(
                  side: 100,
                  color: Colors.blue.withOpacity(.5),
                ).background(alignment: const Alignment(-1, -1)).build(
                      Rectangle.square(
                        color: Colors.red,
                        side: 10,
                      ),
                    ),
                Rectangle.square(
                  side: 100,
                  color: Colors.blue.withOpacity(.5),
                ).background(alignment: const Alignment(1, 1)).build(
                      Rectangle.square(
                        color: Colors.red,
                        side: 10,
                      ),
                    ),
                Rectangle.square(
                  side: 100,
                  color: Colors.blue.withOpacity(.5),
                ).background(alignment: const Alignment(.8, .8)).build(
                      Rectangle.square(
                        color: Colors.red,
                        side: 10,
                      ),
                    ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Rectangle.square(
                  side: 100,
                  color: Colors.blue,
                ).foreground().build(
                      Rectangle.square(
                        color: Colors.red,
                        side: 10,
                      ),
                    ),
                Rectangle.square(
                  side: 100,
                  color: Colors.blue,
                ).foreground(alignment: const Alignment(-1, -1)).build(
                      Rectangle.square(
                        color: Colors.red,
                        side: 10,
                      ),
                    ),
                Rectangle.square(
                  side: 100,
                  color: Colors.blue,
                ).foreground(alignment: const Alignment(1, 1)).build(
                      Rectangle.square(
                        color: Colors.red,
                        side: 10,
                      ),
                    ),
                Rectangle.square(
                  side: 100,
                  color: Colors.blue,
                ).foreground(alignment: const Alignment(.8, .8)).build(
                      Rectangle.square(
                        color: Colors.red,
                        side: 10,
                      ),
                    ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Rectangle(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                ).foreground().build(
                      Rectangle(
                        width: 50,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                Rectangle(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                ).foreground(alignment: const Alignment(-1, -1)).build(
                      Rectangle(
                        width: 50,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                Rectangle(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                ).foreground(alignment: const Alignment(1, 1)).build(
                      Rectangle(
                        width: 50,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                Rectangle(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                ).foreground(alignment: const Alignment(.8, .8)).build(
                      Rectangle(
                        width: 50,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Rectangle(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                ).background().build(
                      Rectangle(
                        width: 50,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                Rectangle(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                ).background(alignment: const Alignment(-1, -1)).build(
                      Rectangle(
                        width: 50,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                Rectangle(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                ).background(alignment: const Alignment(1, 1)).build(
                      Rectangle(
                        width: 50,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                Rectangle(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                ).background(alignment: const Alignment(.8, .8)).build(
                      Rectangle(
                        width: 50,
                        height: 100,
                        color: Colors.red,
                      ),
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
    await screenMatchesGolden(tester, 'build/build_001');
  });

  testGoldens(
    '2- with image without constraints 1',
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
              ).foreground().build(
                    Rectangle(
                      width: 100,
                      height: 100,
                    ),
                  ),
            ],
          ),
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'build/build_002');
    },
  );

  testGoldens(
    '3- with image without constraints 2',
    (tester) async {
      final file = File(
        path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
      );
      final data = file.readAsBytesSync();
      await tester.pumpWidgetBuilder(
        Center(
          child: Column(
            children: [
              Rectangle(
                width: 100,
                height: 100,
              ).background().build(
                    Image.memory(
                      data,
                      fit: BoxFit.cover,
                    ),
                  ),
            ],
          ),
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'build/build_003');
    },
  );

  testGoldens(
    '4- with image when rect is greater then image',
    (tester) async {
      final file = File(
        path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
      );
      final data = file.readAsBytesSync();
      await tester.pumpWidgetBuilder(
        Center(
          child: Column(
            children: [
              Rectangle(
                width: 100,
                height: 100,
              ).foreground().build(
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            ],
          ),
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'build/build_004');
    },
  );

  testGoldens(
    '5- with inkWell',
    (tester) async {
      final file = File(
        path.join(Directory.current.path, 'test', 'flutter_logo_image.png'),
      );
      final data = file.readAsBytesSync();
      await tester.pumpWidgetBuilder(
        Center(
          child: Column(
            children: [
              Rectangle(
                width: 100,
                height: 100,
              )
                  .foreground()
                  .inkWell(
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () {},
                    ),
                  )
                  .build(
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              Rectangle(
                width: 100,
                height: 100,
                color: Colors.blue.withOpacity(.5),
              )
                  .background()
                  .inkWell(
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () {},
                    ),
                  )
                  .build(
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.memory(
                        data,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            ],
          ),
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await tester.press(find.byType(Image).first);
      await tester.press(find.byType(Image).last);
      await screenMatchesGolden(tester, 'build/build_005');
    },
  );
}
