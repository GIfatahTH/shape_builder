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

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({super.key});

  @override
  State<_MyHomePage> createState() => __MyHomePageState();
}

class __MyHomePageState extends State<_MyHomePage> {
  double _alignmentX = 0.0;
  double _alignmentY = 0.0;
  bool _shrinkClippedZone = true;
  bool _shouldExpand = false;
  bool _expandToFullWidth = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._Sliders(),
        const Divider(),
        SizedBox(
          width: _expandToFullWidth ? double.infinity : null,
          child: Rectangle(
            width: 120,
            height: 100,
            clipBehavior: Clip.antiAlias,
            alignment: Alignment(_alignmentX, _alignmentY),
            shrinkToClippedSize: _shrinkClippedZone,
            shouldExpand: _shouldExpand,
            inkWell: InkWell(onTap: () {}),
            child: Image.network(
              'https://placebear.com/600/240',
              fit: BoxFit.cover,
              width: 600,
              height: 240,
            ),
          ).colorize(),
        ),
      ],
    );
  }

  List<Widget> _Sliders() {
    return [
      Row(
        children: [
          const Text('X alignment'),
          Expanded(
            child: Slider(
              min: -1.0,
              max: 1.0,
              value: _alignmentX,
              onChanged: (value) => setState(() {
                _alignmentX = value;
              }),
            ),
          ),
        ],
      ),
      Row(
        children: [
          const Text('Y alignment'),
          Expanded(
            child: Slider(
              min: -1.0,
              max: 1.0,
              value: _alignmentY,
              onChanged: (value) => setState(() {
                _alignmentY = value;
              }),
            ),
          ),
        ],
      ),
      Row(
        children: [
          const Text('Shrink clipped zone'),
          Checkbox(
            value: _shrinkClippedZone,
            onChanged: (value) => setState(
              () {
                _shrinkClippedZone = value!;
              },
            ),
          ),
          const Spacer(),
          const Text('Should Expand'),
          Checkbox(
            value: _shouldExpand,
            onChanged: (value) => setState(
              () {
                _shouldExpand = value!;
              },
            ),
          ),
          const Spacer(),
          const Text('Fill width'),
          Checkbox(
            value: _expandToFullWidth,
            onChanged: (value) => setState(
              () {
                _expandToFullWidth = value!;
              },
            ),
          )
        ],
      ),
    ];
  }
}
