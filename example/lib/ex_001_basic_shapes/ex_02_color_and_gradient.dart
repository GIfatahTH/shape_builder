import 'package:flutter/material.dart';
import 'package:shape_builder/shape_builder.dart';

void main(List<String> args) {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  const _MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // color defaults to the primary color
              Rectangle(
                width: 200,
                height: 200,
              ),
              const Divider(),
              // to set the color use the color parameter
              RRectangle(
                color: Colors.amber,
                width: 200,
                height: 200,
              ),
              const Divider(),
              // ColorWithGradient class to set a gradient
              Oval(
                color: ColorWithGradient(
                  const LinearGradient(colors: [Colors.blue, Colors.amber]),
                ),
                width: 200,
                height: 200,
              ),
              const Divider(),
              Oval.circle(
                color: ColorWithGradient(
                  const RadialGradient(colors: [Colors.blue, Colors.amber]),
                ),
                radius: 200 / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
