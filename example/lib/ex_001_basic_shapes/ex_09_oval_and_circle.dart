import 'dart:math';

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
          padding: EdgeInsets.all(16.0),
          child: _MyHomePage(),
        ),
      ),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({super.key});

  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  double _value1 = 10;
  double _value2 = 10;
  double _value3 = 10;
  double _strokeWidth = 4.0;
  bool _shouldClosePathToCenter = true;
  bool _useStroke = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._sliders(),
        const Divider(),
        Expanded(
          child: Oval.circle(
            shouldClosePathToCenter: _shouldClosePathToCenter,
            radius: 100,
            startAngle: 0,
            swipeAngle: _getSwipeAngle(_value1),
            inkWell: InkWell(
              onTap: () {},
            ),
            paintStyle: _useStroke
                ? PaintStyle(
                    style: PaintingStyle.stroke,
                    strokeWidth: _strokeWidth,
                  )
                : null,
          )
              .foreground(
                color: Colors.amber,
                paintStyle: _useStroke
                    ? PaintStyle(
                        style: PaintingStyle.stroke,
                        strokeWidth: _strokeWidth,
                      )
                    : null,
              )
              .inkWell(
                InkWell(
                  onTap: () {},
                ),
              )
              .buildCircle(
                startAngle: _getSwipeAngle(_value1),
                swipeAngle: _getSwipeAngle(_value2),
                shouldClosePathToCenter: _shouldClosePathToCenter,
              )
              .foreground(
                color: Colors.green,
                paintStyle: _useStroke
                    ? PaintStyle(
                        style: PaintingStyle.stroke,
                        strokeWidth: _strokeWidth,
                      )
                    : null,
              )
              .buildCircle(
                startAngle: _getSwipeAngle(_value1) + _getSwipeAngle(_value2),
                swipeAngle: _getSwipeAngle(_value3),
                shouldClosePathToCenter: _shouldClosePathToCenter,
              ),
        ),
      ],
    );
  }

  double _getSwipeAngle(double value) {
    final total = _value1 + _value2 + _value3;
    if (total == 0) return 0;
    return 2 * pi * value / total;
  }

  List<Widget> _sliders() {
    return [
      Row(
        children: [
          const Text('value 1'),
          Expanded(
            child: Slider(
              min: 0,
              max: 100,
              value: _value1,
              onChanged: (value) => setState(() {
                _value1 = value;
              }),
            ),
          ),
        ],
      ),
      Row(
        children: [
          const Text('value 2'),
          Expanded(
            child: Slider(
              min: 0,
              max: 100,
              value: _value2,
              activeColor: Colors.amber,
              onChanged: (value) => setState(() {
                _value2 = value;
              }),
            ),
          ),
        ],
      ),
      Row(
        children: [
          const Text('value 3'),
          Expanded(
            child: Slider(
              min: 0,
              max: 100,
              value: _value3,
              activeColor: Colors.green,
              onChanged: (value) => setState(() {
                _value3 = value;
              }),
            ),
          ),
        ],
      ),
      Row(
        children: [
          const Text('Close Path To Center'),
          Checkbox(
            value: _shouldClosePathToCenter,
            onChanged: (v) => setState(
              () {
                _shouldClosePathToCenter = v!;
              },
            ),
          ),
          const Spacer(),
          const Text('Use stroke'),
          Checkbox(
            value: _useStroke,
            onChanged: (v) => setState(
              () {
                _useStroke = v!;
              },
            ),
          )
        ],
      ),
      if (_useStroke)
        Row(
          children: [
            const Text('Stroke width'),
            Expanded(
              child: Slider(
                min: 0,
                max: 100,
                value: _strokeWidth,
                onChanged: (value) => setState(() {
                  _strokeWidth = value;
                }),
              ),
            ),
          ],
        ),
    ];
  }
}
