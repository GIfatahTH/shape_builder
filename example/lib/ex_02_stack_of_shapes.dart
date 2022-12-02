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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Oval.circle(color: Colors.amber, radius: 75)
                .foreground()
                .buildCircle(radius: 55)
                .foreground(color: Colors.purple)
                .buildCircle(radius: 35),
            const SizedBox(height: 8),
            Oval.circle(color: Colors.purple, radius: 35)
                .background()
                .buildCircle(radius: 55)
                .background(color: Colors.amber)
                .buildCircle(radius: 75),
            const SizedBox(height: 8),
            const Text('4')
                .background(color: Colors.red)
                .buildSquare(50)
                .background(color: Colors.black, alignment: Alignment.topLeft)
                .buildSquare(100)
                .background(alignment: Alignment.bottomRight)
                .buildSquare(150),
            const SizedBox(height: 8),
            Rectangle.square(
              side: 150,
            )
                .foreground(
                    color: Colors.black, alignment: Alignment.bottomRight)
                .buildSquare(100)
                .foreground(color: Colors.red)
                .buildSquare(50)
                .foreground()
                .build(const Text('4')),
            const SizedBox(height: 8),
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
        ),
      ),
    );
  }
}
