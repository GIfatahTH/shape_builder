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
        // shapes trie to size itself, in the following order:
        // * to honor the `width`, `height`,
        // * to be as big as possible if the parameter "shouldExpand" is set to true,
        // * to ba as small as it child if the latter is defined,
        // * to be as small as possible.
        //
        // TO TRY:
        // Use RRectangle or Oval instead of Rectangle and try different combination
        // of width, height, child and shouldExpand
        child: Rectangle(
          shouldExpand: true,
          // width: 200,
          // height: 200,
          // child: Text('Child'),
        ),
      ),
    );
  }
}
