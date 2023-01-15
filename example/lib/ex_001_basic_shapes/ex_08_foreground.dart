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
      home: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(8.0),
        child: _MyHomePage(),
      )),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  const _MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Oval.circle(color: Colors.amber, radius: 75)
            .foreground(color: Colors.blue)
            .buildCircle(radius: 55)
            .foreground(color: Colors.purple)
            .buildCircle(radius: 35),
        const Divider(),
        Rectangle.square(
          side: 150,
        )
            .foreground(color: Colors.black, alignment: Alignment.bottomRight)
            .buildSquare(100)
            .foreground(color: Colors.red)
            .buildSquare(50)
            .foreground(color: Colors.blue)
            .build(const Text('4')),
        const Divider(),
        const Icon(
          Icons.favorite,
          size: 48,
          color: Colors.white,
        )
            .background(
              boxShadow: BoxShadowWithElevation(
                8,
                color: const Color.fromARGB(122, 4, 4, 4),
              ),
              color: ColorWithGradient(
                LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blue.shade900],
                ),
              ),
            )
            .buildCircle(radius: 100)
            .foreground(alignment: const Alignment(1, 1) / 1.1)
            .build(
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  '5',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              )
                  .background(
                    color: Colors.blue.shade900,
                    boxShadow: BoxShadowWithElevation(
                      12,
                      color: Colors.white,
                    ),
                  )
                  .buildCircle(),
            ),
      ],
    );
  }
}
