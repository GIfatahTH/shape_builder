import 'package:flutter/widgets.dart';

class PaintStyle {
  /// Similar to [Paint.style]
  final PaintingStyle? style;

  /// Similar to [Paint.strokeWidth]
  final double? strokeWidth;

  /// Similar to [Paint.strokeCap]
  final StrokeCap? strokeCap;

  /// Similar to [Paint.strokeJoin]
  final StrokeJoin? strokeJoin;

  /// Similar to [Paint.strokeMiterLimit]
  final double? strokeMiterLimit;

  PaintStyle({
    this.style,
    this.strokeWidth,
    this.strokeCap,
    this.strokeJoin,
    this.strokeMiterLimit,
  });

  @override
  bool operator ==(covariant PaintStyle other) {
    if (identical(this, other)) return true;

    return other.style == style &&
        other.strokeWidth == strokeWidth &&
        other.strokeCap == strokeCap &&
        other.strokeJoin == strokeJoin &&
        other.strokeMiterLimit == strokeMiterLimit;
  }

  @override
  int get hashCode {
    return style.hashCode ^
        strokeWidth.hashCode ^
        strokeCap.hashCode ^
        strokeJoin.hashCode ^
        strokeMiterLimit.hashCode;
  }
}
