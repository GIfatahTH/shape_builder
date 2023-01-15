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
        child: Column(
          children: <Widget>[
            // FIRST CASE: Child is grater than Shape dimension
            //
            // Default alignment is Alignment.center
            Rectangle.square(
              child: const Text('This is a ME'),
            ),
            const Divider(),
            //
            // Because child size is greater than shape size the shape is aligned
            // to the child
            Rectangle.square(
              alignment: Alignment.topLeft,
              child: const Text('This is a ME'),
            ),
            const Divider(),
            Rectangle.square(
              side: 50,
              alignment: Alignment.centerRight,
              child: const Text('This is a ME'),
            ),
            const Divider(),
            // Second CASE: Shape size is greater than child size
            //
            // Default alignment is Alignment.center
            Rectangle.square(
              side: 150,
              child: const Text('This is a ME'),
            ),
            const Divider(),
            // Because of the shape size is greater than child size the child is aligned
            // to the shape
            Rectangle.square(
              side: 150,
              alignment: Alignment.topLeft,
              child: const Text('This is a ME'),
            ),
            const Divider(),
            Rectangle.square(
              side: 150,
              alignment: Alignment.bottomRight,
              child: const Text('This is a ME'),
            ),
          ],
        ),
      ),
    );
  }
}
