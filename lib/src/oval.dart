part of 'base_render_shape.dart';

Widget _wrapWithInkWell(InkWell inkWell, [Widget? child]) {
  final ink = InkResponse(
    containedInkWell: true,
    highlightShape: BoxShape.rectangle,
    key: inkWell.key,
    onTap: inkWell.onTap,
    onTapDown: inkWell.onTapDown,
    onTapUp: inkWell.onTapUp,
    onTapCancel: inkWell.onTapCancel,
    onDoubleTap: inkWell.onDoubleTap,
    onLongPress: inkWell.onLongPress,
    onHighlightChanged: inkWell.onHighlightChanged,
    onHover: inkWell.onHover,
    mouseCursor: inkWell.mouseCursor,
    radius: inkWell.radius,
    borderRadius: inkWell.borderRadius,
    customBorder: inkWell.customBorder,
    focusColor: inkWell.focusColor,
    hoverColor: inkWell.hoverColor,
    highlightColor: inkWell.highlightColor,
    overlayColor: inkWell.overlayColor,
    splashColor: inkWell.splashColor,
    splashFactory: inkWell.splashFactory,
    enableFeedback: inkWell.enableFeedback,
    excludeFromSemantics: inkWell.excludeFromSemantics,
    focusNode: inkWell.focusNode,
    canRequestFocus: inkWell.canRequestFocus,
    onFocusChange: inkWell.onFocusChange,
    autofocus: inkWell.autofocus,
    statesController: inkWell.statesController,
    child: child,
  );
  return Material(type: MaterialType.transparency, child: ink);
}

class Oval extends _BaseSingleChildRenderObjectShape {
  Oval._({
    this.startAngle,
    this.swipeAngle,
    //
    super.color,
    super.width,
    super.height,
    required super.shouldExpand,
    super.squareSide,
    super.child,
    super.shadow = const [],
    super.childIsInTheForeground = true,
    super.clipBehavior = Clip.none,
    super.shrinkToClippedSize = true,
    super.alignment = Alignment.center,
    required super.paintStyle,
    required this.shouldClosePath,
    super.isConstraintTransparent = false,
    required super.fit,
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
    bool shouldExpand = false,
    List<BoxShadow> boxShadow = const [],
    Widget? child,
    AlignmentGeometry alignment = Alignment.center,
    Clip clipBehavior = Clip.none,
    bool shrinkToClippedSize = true,
    bool childIsInTheForeground = true,
    PaintStyle? paintStyle,
    InkWell? inkWell,
    BoxFit fit = BoxFit.none,
    Key? key,
  }) {
    final expandImage = shouldExpandImage(child, width, height);

    final widget = Oval._(
      startAngle: startAngle,
      swipeAngle: swipeAngle,
      shouldClosePath: shouldClosePathToCenter,
      //
      key: key,
      color: color,

      width: width,
      height: height,
      shouldExpand: expandImage ? false : shouldExpand,
      shadow: boxShadow,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      alignment: alignment, paintStyle: paintStyle,
      fit: fit,
      child: child,
    );

    final c = expandImage
        ? Oval._(
            isConstraintTransparent: true,
            shouldExpand: false,
            shrinkToClippedSize: false,
            paintStyle: null,
            shouldClosePath: false,
            color: Colors.transparent,
            fit: BoxFit.none,
            child: SizedBox(
              width: shouldExpand ? (child as Image).width : null,
              child: FittedBox(
                child: widget,
              ),
            ),
          )
        : widget;

    // return c;
    if (inkWell != null) {
      return Oval._(
        isConstraintTransparent: true,
        shouldExpand: false,
        shrinkToClippedSize: false,
        paintStyle: null,
        shouldClosePath: false,
        color: Colors.transparent,
        fit: BoxFit.none,
        child: MyStack(
          children: [
            c,
            Oval._(
              key: key,
              color: Colors.transparent,
              width: width,
              height: height,
              shouldExpand: false,
              startAngle: startAngle,
              swipeAngle: swipeAngle,
              clipBehavior: Clip.antiAlias,
              shouldClosePath: shouldClosePathToCenter,
              paintStyle: paintStyle,
              fit: BoxFit.none,
              alignment: alignment,
              child: _wrapWithInkWell(inkWell),
            )
          ],
        ),
      );
    }
    return c;
  }

  static Widget circle({
    Color? color,
    double? radius,
    bool shouldExpand = false,
    double? startAngle,
    double? swipeAngle,
    bool? shouldClosePathToCenter,
    List<BoxShadow> boxShadow = const [],
    Widget? child,
    Clip clipBehavior = Clip.none,
    bool shrinkToClippedSize = true,
    AlignmentGeometry alignment = Alignment.center,
    bool childIsInTheForeground = true,
    PaintStyle? paintStyle,
    InkWell? inkWell,
    BoxFit fit = BoxFit.none,
    Key? key,
  }) {
    radius = radius != null ? radius * 2 : null;
    final expandImage = shouldExpandImage(child, radius, radius);

    final widget = Oval._(
      key: key,
      color: color,
      width: radius,
      height: radius,
      squareSide: radius ?? -1,
      shouldExpand: expandImage ? false : shouldExpand,
      startAngle: startAngle,
      swipeAngle: swipeAngle,
      shouldClosePath: shouldClosePathToCenter,
      shadow: boxShadow,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      alignment: alignment,
      paintStyle: paintStyle,
      fit: fit,
      child: child,
    );

    final c = expandImage
        ? SizedBox(
            width: shouldExpand ? (child as Image).width : null,
            child: FittedBox(
              child: widget,
            ),
          )
        : widget;
    if (inkWell != null) {
      return MyStack(
        children: [
          c,
          Oval._(
            key: key,
            color: Colors.transparent,
            width: radius != null ? radius * 2 : null,
            height: radius != null ? radius * 2 : null,
            squareSide: radius ?? -1,
            shouldExpand: false,
            startAngle: startAngle,
            swipeAngle: swipeAngle,
            clipBehavior: Clip.antiAlias,
            shouldClosePath: shouldClosePathToCenter,
            paintStyle: paintStyle,
            fit: BoxFit.none,
            alignment: alignment,
            child: _wrapWithInkWell(inkWell),
          )
        ],
      );
    }
    return c;
  }

  final double? startAngle, swipeAngle;
  final bool? shouldClosePath;
  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderOval(
      color: color,
      width: width,
      height: height,
      shouldExpand: shouldExpand,
      side: squareSide,
      startAngle: startAngle,
      swipeAngle: swipeAngle,
      boxShadow: shadow,
      buildContext: context,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      shouldClosePath: shouldClosePath,
      alignment: alignment,
      decorationImage: decorationImage,
      imageSize: imageSize,
      paintStyle: paintStyle,
      isConstraintTransparent: isConstraintTransparent,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    super.updateRenderObject(context, renderObject);
    (renderObject as _RenderOval)
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

class _RenderOval extends _BaseRenderShape {
  _RenderOval({
    required double? side,
    required double? startAngle,
    required double? swipeAngle,
    required bool? shouldClosePath,
    required super.width,
    required super.height,
    required super.shouldExpand,
    required super.color,
    required super.boxShadow,
    required super.clipBehavior,
    required super.shrinkToClippedSize,
    required super.buildContext,
    required super.childIsInTheForeground,
    required super.alignment,
    required super.decorationImage,
    required super.imageSize,
    required super.paintStyle,
    required super.isConstraintTransparent,
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
    final swipe = _swipeAngle ?? (2 * pi - (_startAngle ?? 0));
    if (swipe < 2 * pi) {
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
    if (swipe >= 2 * pi) {
      return null;
    }

    final path = Path();
    if (swipe == 0) {
      return path;
    }
    path.addArc(
      rect,
      start,
      swipe,
    );
    if (_shouldClosePath != null) {
      if (_shouldClosePath!) {
        path.lineTo(offset.dx + centerX, offset.dy + centerY);
        path.close();
      }
    } else if (shouldClosePath) {
      path.lineTo(offset.dx + centerX, offset.dy + centerY);
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
