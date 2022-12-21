part of 'base_render_shape.dart';

class Oval extends _BaseSingleChildRenderObjectShape {
  Oval._({
    this.startAngle,
    this.swipeAngle,
    //
    super.color,
    super.width,
    super.height,
    super.squareSide,
    super.child,
    super.shadow = const [],
    super.isOverlay = true,
    super.clipBehavior = Clip.none,
    super.clipShrink = true,
    super.alignment = Alignment.center,
    required super.paintStyle,
    required this.shouldClosePath,
    super.key,
  });

  factory Oval({
    double? startAngle,
    double? swipeAngle,
    bool? shouldClosePathToCenter,
    //
    Color? color,
    double? width,
    double? height,
    List<BoxShadow> boxShadow = const [],
    Widget? child,
    AlignmentGeometry alignment = Alignment.center,
    Clip clipBehavior = Clip.none,
    bool clipShrink = true,
    bool isOverlay = true,
    PaintStyle? paintStyle,
    Key? key,
  }) {
    return Oval._(
      startAngle: startAngle,
      swipeAngle: swipeAngle,
      shouldClosePath: shouldClosePathToCenter,
      //
      key: key,
      color: color,

      width: width,
      height: height,

      shadow: boxShadow,
      clipBehavior: clipBehavior,
      clipShrink: clipShrink,
      isOverlay: !isOverlay,
      alignment: alignment, paintStyle: paintStyle,
      child: child,
    );
  }

  factory Oval.circle({
    Color? color,
    double? radius,
    double? startAngle,
    double? swipeAngle,
    bool? shouldClosePathToCenter,
    List<BoxShadow> boxShadow = const [],
    Widget? child,
    Clip clipBehavior = Clip.none,
    bool clipShrink = true,
    AlignmentGeometry alignment = Alignment.center,
    bool isOverlay = true,
    PaintStyle? paintStyle,
    Key? key,
  }) {
    return Oval._(
      key: key,
      color: color,
      width: radius != null ? radius * 2 : null,
      height: radius != null ? radius * 2 : null,
      squareSide: radius ?? -1,
      startAngle: startAngle,
      swipeAngle: swipeAngle,
      shouldClosePath: shouldClosePathToCenter,
      shadow: boxShadow,
      clipBehavior: clipBehavior,
      clipShrink: clipShrink,
      isOverlay: !isOverlay,
      alignment: alignment,
      paintStyle: paintStyle,
      child: child,
    );
  }

  final double? startAngle, swipeAngle;
  final bool? shouldClosePath;
  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderCircle(
      color: color,
      width: width,
      height: height,
      side: squareSide,
      startAngle: startAngle,
      swipeAngle: swipeAngle,
      boxShadow: shadow,
      buildContext: context,
      clipBehavior: clipBehavior,
      clipShrink: clipShrink,
      isOverlay: isOverlay,
      shouldClosePath: shouldClosePath,
      alignment: alignment,
      decorationImage: decorationImage,
      imageSize: imageSize,
      paintStyle: paintStyle,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    super.updateRenderObject(context, renderObject);
    (renderObject as _RenderCircle)
      ..startAngle = startAngle
      ..squareSide = squareSide
      ..swipeAngle = swipeAngle
      ..shouldClosePath = shouldClosePath;
    ;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<double?>('startAngle', startAngle));
    properties.add(DiagnosticsProperty<double?>('swipeAngle', swipeAngle));
  }
}

class _RenderCircle extends _BaseRenderShape {
  _RenderCircle({
    required double? side,
    required double? startAngle,
    required double? swipeAngle,
    required bool? shouldClosePath,
    required super.width,
    required super.height,
    required super.color,
    required super.boxShadow,
    required super.clipBehavior,
    required super.clipShrink,
    required super.buildContext,
    required super.isOverlay,
    required super.alignment,
    required super.decorationImage,
    required super.imageSize,
    required super.paintStyle,
  })  : _startAngle = startAngle,
        _swipeAngle = swipeAngle,
        _shouldClosePath = shouldClosePath,
        super(
          squareSide: side,
        );

  double? _startAngle;
  set startAngle(double? value) {
    if (value == _startAngle) {
      return;
    }
    _startAngle = value;
    resetPainters();
    markNeedsPaint();
  }

  double? _swipeAngle;
  set swipeAngle(double? value) {
    if (value == _swipeAngle) {
      return;
    }
    _swipeAngle = value;
    resetPainters();
    markNeedsPaint();
  }

  bool? _shouldClosePath = true;
  set shouldClosePath(bool? value) {
    if (value == _shouldClosePath) {
      return;
    }
    _shouldClosePath = value;
    resetPainters();
    markNeedsPaint();
  }

  @override
  Rect? getCircleToPaint(Rect rect) {
    final start = (_startAngle ?? 0) - pi / 2;
    final swipe = _swipeAngle ?? (2 * pi - (_startAngle ?? 0));
    if ((swipe - start) < 2 * pi) {
      return null;
    }
    if (_squareSide != null) {
      return Rect.fromCircle(
          center: rect.center, radius: rect.shortestSide / 2);
    }
    return rect;
  }

  @override
  Path? getPathToPaint(Rect rect, Offset offset, bool shouldClosePath) {
    final start = (_startAngle ?? 0) - pi / 2;
    final swipe = _swipeAngle ?? (2 * pi - (_startAngle ?? 0));
    if ((swipe - start) >= 2 * pi) {
      return null;
    }

    final path = Path();
    path.addArc(
      rect,
      start,
      swipe,
    );
    if (_shouldClosePath != null) {
      if (_shouldClosePath!) {
        path.lineTo(offset.dx + offsetX, offset.dy + offsetY);
        path.close();
      }
    } else if (shouldClosePath) {
      path.lineTo(offset.dx + offsetX, offset.dy + offsetY);
      path.close();
    }
    return path;
  }

  @override
  Rect? getRectToPain(Rect rect) {
    return null;
  }

  @override
  RRect? getRRectToPaint(Rect rect) {
    return null;
  }

  // @override
  // void paint(PaintingContext context, Offset offset) {
  //   if (size == Size.zero) return;
  //   final color = _color ?? Theme.of(buildContext).colorScheme.primary;
  //   final rect = getRect(offset, _radius);

  //   final path = Path();
  //   path.addArc(
  //     rect,
  //     _startAngle ?? -pi / 2,
  //     _swipeAngle ?? 2 * pi,
  //   );
  //   path.lineTo(offset.dx + offsetX, offset.dy + offsetX);
  //   path.close();

  //   if (_clipBehavior == Clip.none) {
  //     performPaint(
  //       context: context,
  //       offset: offset,
  //       path: path,
  //       rect: rect,
  //       color: color,
  //     );
  //   } else {
  //     context.clipPathAndPaint(
  //       path,
  //       _clipBehavior,
  //       rect,
  //       () => performPaint(
  //         context: context,
  //         offset: offset,
  //         path: path,
  //         rect: rect,
  //         color: color,
  //       ),
  //     );
  //   }
  // }
}
