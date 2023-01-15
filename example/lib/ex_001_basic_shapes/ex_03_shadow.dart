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
            // Use box shadow to add a shadow
            Oval.circle(
              radius: 100,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 7,
                  blurRadius: 7,
                  offset: Offset(10, 10),
                )
              ],
            ),
            const Divider(),
            Oval.circle(
              radius: 100,
              swipeAngle: 4,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 7,
                  blurRadius: 7,
                )
              ],
            ),
            const Divider(),
            // You can use BoxShadowWithElevation to add shadow from elevation
            Oval.circle(
              radius: 100,
              swipeAngle: 4,
              boxShadow: BoxShadowWithElevation(12, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
