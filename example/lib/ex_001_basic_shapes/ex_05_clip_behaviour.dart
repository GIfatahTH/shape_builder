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
            children: <Widget>[
              // Text without clipping
              Rectangle(
                // Default to Clip.none
                clipBehavior: Clip.none,
                child: const Text('This is a TEXT'),
              ),
              const Divider(),
              // Text with clipping
              Rectangle(
                width: 50,
                shrinkToClippedSize: false,
                clipBehavior: Clip.antiAlias,
                child: const Text('This is a TEXT'),
              ),
              const Divider(),
              // By default the The shape size collapses to the clipped size
              Container(
                // We add a red container to see the size of the shape
                // and compare it to the size of the clipped zone
                color: Colors.red,
                padding: const EdgeInsets.all(4),
                child: Rectangle(
                  width: 50,
                  clipBehavior: Clip.antiAlias,
                  child: const Text('This is a TEXT'),
                ),
              ),
              const Divider(),
              Container(
                color: Colors.red,
                padding: const EdgeInsets.all(4),
                child: Rectangle(
                  width: 50,
                  clipBehavior: Clip.antiAlias,
                  // if we set shrinkToClippedSize is set to false,
                  // the size of the shape is equal to the size of the child
                  shrinkToClippedSize: false,
                  child: const Text('This is a TEXT'),
                ),
              ),
              const Divider(),
              // Clip an image inside a circle
              // TRY RESIZE THE WINDOW OF THE APP, and see the the image keeps
              // its aspect ration
              Oval.circle(
                radius: 100,
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  'https://placebear.com/1200/300',
                  fit: BoxFit.cover,
                ),
              ),
              const Divider(),
              // Clip an image inside an Oval and add Border using PaintStyle
              Oval(
                width: 200,
                height: 120,
                clipBehavior: Clip.antiAlias,
                paintStyle: PaintStyle(
                  style: PaintingStyle.stroke,
                  strokeWidth: 8,
                ),
                childIsInTheForeground: false,
                child: Image.network(
                  'https://placebear.com/1200/300',
                  fit: BoxFit.cover,
                ),
              ),
              const Divider(),
              // Clip an image inside a rounded rectangle.
              // Here we add a gradient from black to transparent.
              // This is a common use case where the image may have a white color
              // and we want to ensure texts are readable.
              RRectangle(
                width: 200,
                height: 120,
                clipBehavior: Clip.antiAlias,
                childIsInTheForeground: false,
                color: ColorWithGradient(
                  LinearGradient(
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Image.network(
                  'https://placebear.com/400/240',
                  fit: BoxFit.cover,
                  width: 400,
                  height: 240,
                ),
              )
                  .foreground(
                    alignment: const Alignment(0, .8),
                  )
                  .build(
                    const Text(
                      'Bear',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
