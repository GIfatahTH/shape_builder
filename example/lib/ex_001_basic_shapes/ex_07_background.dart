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
        Oval.circle(
          color: Colors.purple,
          radius: 35,
        )
            .background(color: Colors.blue)
            .buildCircle(radius: 55)
            .background(
              color: Colors.amber,
              clipBehavior: Clip.antiAlias,
            )
            .buildCircle(radius: 75),
        const Divider(),
        const Text('4')
            .background(color: Colors.red)
            .buildSquare(50)
            .background(color: Colors.black, alignment: Alignment.topLeft)
            .buildSquare(100)
            .background(color: Colors.blue, alignment: Alignment.bottomRight)
            .buildSquare(150),
        const Divider(),
        const Icon(
          Icons.favorite,
          size: 48,
          color: Colors.white,
        )
            .background(
              clipBehavior: Clip.antiAlias,
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
            .background(
              alignment: const Alignment(1, 1) / 1.1,
            )
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
                    clipBehavior: Clip.antiAliasWithSaveLayer,
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
