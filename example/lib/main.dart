import 'package:flutter/material.dart';
import 'package:shape_builder/shape_builder.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple shapes')),
        body: const MyHomeBody(),
      ),
    );
  }
}

class MyHomeBody extends StatelessWidget {
  const MyHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Rectangle(
            child: const Text('This is A Rectangle').padding.all(),
          ),
          const SizedBox(height: 8),
          const Text('This is A Rounded Rectangle')
              .padding
              .all()
              .background()
              .buildRRect(),
          const SizedBox(height: 8),
          RRectangle.capsule(
            width: double.infinity,
            child: const Text('This is A Capsule').padding.all(),
          ),
          const SizedBox(height: 8),
          const Text('This is An Oval')
              .padding
              .all()
              .background()
              .buildOval(width: double.infinity),
          const SizedBox(height: 8),
          Rectangle.square(
            color: Colors.amber,
            side: 150,
            child: const Text('This is A Square').padding.all(),
          ),
          const SizedBox(height: 8),
          const Text('This is A Circle')
              .background(color: Colors.amber)
              .buildCircle(radius: 75, swipeAngle: 5),
          const SizedBox(height: 8),
          const Text('This is A Circle')
              .background(
                color: Colors.amber,
                paintStyle: PaintStyle(
                  style: PaintingStyle.stroke,
                  strokeWidth: 4,
                ),
              )
              .buildCircle(
                radius: 75,
                swipeAngle: 5,
                shouldClosePathToCenter: true,
              ),
          const SizedBox(height: 8),
          const Text('This is A Circle')
              .background(
                color: ColorWithGradient(
                  const RadialGradient(colors: [Colors.white, Colors.amber]),
                ),
              )
              .buildCircle(radius: 75),
          const SizedBox(height: 8),
          Oval.circle(
            radius: 75,
            boxShadow: const [BoxShadow(offset: Offset(4, 4), blurRadius: 6)],
            child: const Text('This is A Rectangle'),
          ),
          const SizedBox(height: 8),
          Oval.circle(
            radius: 75,
            boxShadow: BoxShadowWithElevation(7, color: Colors.amber),
            child: const Text('This is A Rectangle'),
          ),
        ],
      ).padding.all(),
    );
  }
}
