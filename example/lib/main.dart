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
    return SizedBox(
      width: double.infinity,
      child: FittedBox(
        child: Stack(
          children: [
            Column(
              children: [
                const Icon(
                  Icons.add,
                  size: 162,
                ).paddingInsets.all(16),
                const Icon(
                  Icons.add,
                  size: 262,
                ).paddingInsets.all(16),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.edit,
                  size: 162,
                ).paddingInsets.all(16),
                const Icon(
                  Icons.edit,
                  size: 262,
                ).paddingInsets.all(16)
              ],
            )
          ],
        )
            .foreground(
              color: Colors.amber.withOpacity(.5),
              // shouldExpand: true,
              clipBehavior: Clip.antiAlias,
              // alignment: Alignment.topCenter,
              // fit: BoxFit.fitHeight,
            )
            .buildRRect(
              // height: 300,
              width: 160,
            ),
      ),
    );
  }
}
