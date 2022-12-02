import 'package:flutter/material.dart';
import 'shape_builder.dart';

class FlexSpacer extends StatelessWidget {
  const FlexSpacer._(this.space, num multiplier, bool shouldExpand)
      : _multiplier = multiplier,
        _shouldExpand = shouldExpand;
  const FlexSpacer([this.space = 8.0])
      : _multiplier = 1.0,
        _shouldExpand = false;

  const FlexSpacer.expand([this.space = 8])
      : _multiplier = 1.0,
        _shouldExpand = true;
  final bool _shouldExpand;
  final double space;
  final num _multiplier;
  int get f => _multiplier * space ~/ 8;

  static bool _debugSpacer = false;
  static set debugSpacer(bool value) {
    assert(() {
      _debugSpacer = value;
      return true;
    }());
  }

  @override
  Widget build(BuildContext context) {
    Widget child = const SizedBox();
    if (_debugSpacer) {
      child = const SizedBox(
        child: Placeholder(),
      ).colorize(Colors.blueGrey.withOpacity(0.4));
    }
    return Resize(
      child: child,
      fitTheShortestSide: false,
      flex: f + 1,
      shouldExpand: _shouldExpand,
    ).fixed(
      height: _multiplier * space,
      width: _multiplier * space,
    );
  }

  FlexSpacer operator *(num operand) =>
      FlexSpacer._(space, _multiplier * operand, _shouldExpand);
}
