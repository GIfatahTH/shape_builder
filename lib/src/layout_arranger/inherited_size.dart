import 'dart:math' as math;
import 'package:flutter/rendering.dart';

import 'inherited_layout.dart';

class InheritedSize extends Size {
  InheritedSize(super.width, super.height);
  double maxSide(
    double fraction, {
    double min = 0.0,
    double max = double.infinity,
  }) {
    return _clamp(math.max(width, height), fraction, min, max);
  }

  double minSide(
    double fraction, {
    double min = 0.0,
    double max = double.infinity,
  }) {
    return _clamp(math.min(width, height), fraction, min, max);
  }

  double widthFraction(
    double fraction, {
    double min = 0.0,
    double max = double.infinity,
  }) {
    return _clamp(width, fraction, min, max);
  }

  double heightFraction(
    double fraction, {
    double min = 0.0,
    double max = double.infinity,
  }) {
    return _clamp(height, fraction, min, max);
  }

  double _clamp(double value, double fraction, double min, double max) {
    // assert(fraction >= 0.0 && fraction <= 1.0);

    return (value * fraction).clamp(
        min * InheritedLayout.scaleFactor, max * InheritedLayout.scaleFactor);
  }

  InheritedSize copyWith({double? width, double? height}) {
    return InheritedSize(width ?? this.width, height ?? this.height);
  }
}
