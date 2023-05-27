part of 'base_render_shape.dart';

class RRectangle extends _BaseSingleChildRenderObjectShape {
  RRectangle._({
    this.radius,
    this.outerVRadius,
    this.outerHRadius,
    //
    super.squareSide,
    super.color,
    super.width,
    super.height,
    required super.shouldExpand,
    super.child,
    super.shadow = const [],
    super.childIsInTheForeground = true,
    super.clipBehavior = Clip.none,
    required super.shrinkToClippedSize,
    super.alignment = Alignment.center,
    required super.paintStyle,
    super.isConstraintTransparent = false,
    required super.fit,
    super.key,
  });

  static Widget square({
    BorderRadiusGeometry? borderRadius,
    BorderRadiusGeometry? outerVBorderRadius,
    BorderRadiusGeometry? outerHBorderRadius,
    double? side,
    bool shouldExpand = false,
    Color? color,
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
    final expandImage = shouldExpandImage(child, side, side);

    final widget = RRectangle._(
      key: key,
      radius: borderRadius,
      outerVRadius: outerVBorderRadius,
      outerHRadius: outerHBorderRadius,
      color: color,
      shadow: boxShadow,
      width: side,
      height: side,
      squareSide: side ?? -1,
      shouldExpand: expandImage ? false : shouldExpand,
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
          RRectangle._(
            key: key,
            color: Colors.transparent,
            width: side,
            height: side,
            squareSide: side ?? -1,
            radius: borderRadius,
            outerVRadius: outerVBorderRadius,
            outerHRadius: outerHBorderRadius,
            shouldExpand: false,
            clipBehavior: Clip.antiAlias,
            shrinkToClippedSize: shrinkToClippedSize,
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

  static Widget capsule({
    double? width,
    double? height,
    bool shouldExpand = false,
    Color? color,
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

    final widget = RRectangle._(
      key: key,
      radius: _RadiusCapsule(),
      color: color,
      shadow: boxShadow,
      width: width,
      height: height,
      shouldExpand: expandImage ? false : shouldExpand,
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
          RRectangle._(
            key: key,
            color: Colors.transparent,
            width: width,
            height: height,
            radius: _RadiusCapsule(),
            shouldExpand: false,
            clipBehavior: Clip.antiAlias,
            shrinkToClippedSize: shrinkToClippedSize,
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

  factory RRectangle({
    Color? color,
    BorderRadiusGeometry? outerVBorderRadius,
    BorderRadiusGeometry? outerHBorderRadius,
    List<BoxShadow> boxShadow = const [],
    double? width,
    double? height,
    bool shouldExpand = false,
    BorderRadiusGeometry? borderRadius,
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

    final widget = RRectangle._(
      key: key,
      color: color,
      shadow: boxShadow,
      width: width,
      height: height,
      shouldExpand: expandImage ? false : shouldExpand,
      radius: borderRadius,
      outerVRadius: outerVBorderRadius,
      outerHRadius: outerHBorderRadius,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      alignment: alignment,
      paintStyle: paintStyle,
      fit: fit,
      child: child,
    );
    final c = expandImage
        ? RRectangle._(
            isConstraintTransparent: true,
            shouldExpand: false,
            shrinkToClippedSize: false,
            paintStyle: null,
            color: Colors.transparent,
            fit: BoxFit.none,
            child: SizedBox(
              width:
                  shouldExpand && expandImage ? (child as Image).width : null,
              child: FittedBox(
                // fit: fit,
                child: widget,
              ),
            ),
          )
        : widget;

    if (inkWell != null) {
      return RRectangle._(
        isConstraintTransparent: true,
        shouldExpand: false,
        shrinkToClippedSize: false,
        paintStyle: null,
        color: Colors.transparent,
        fit: BoxFit.none,
        child: MyStack(
          children: [
            c,
            Align(
              alignment: alignment,
              child: RRectangle._(
                key: key,
                color: Colors.transparent,
                width: width,
                height: height,
                radius: borderRadius,
                outerVRadius: outerVBorderRadius,
                outerHRadius: outerHBorderRadius,
                shouldExpand: false,
                clipBehavior: Clip.antiAlias,
                shrinkToClippedSize: shrinkToClippedSize,
                paintStyle: paintStyle,
                fit: BoxFit.none,
                child: _wrapWithInkWell(inkWell),
              ),
            ),
          ],
        ),
      );
    }
    return c;
  }

  final BorderRadiusGeometry? radius, outerVRadius, outerHRadius;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderRRectangle(
      color: color,
      boxShadow: shadow,
      width: width,
      height: height,
      squareSide: squareSide,
      shouldExpand: shouldExpand,
      buildContext: context,
      radius: radius,
      outerVRadius: outerVRadius,
      outerHRadius: outerHRadius,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
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
    (renderObject as _RenderRRectangle)
      ..radius = radius
      ..outerVRadius = outerVRadius
      ..outerHRadius = outerHRadius
      ..squareSide = squareSide;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<BorderRadiusGeometry?>('raduis', radius));
    properties.add(DiagnosticsProperty<BorderRadiusGeometry?>(
        'outerVRadius', outerVRadius));
    properties.add(DiagnosticsProperty<BorderRadiusGeometry?>(
        'outerHRadius', outerHRadius));
  }
}

class _RenderRRectangle extends _BaseRenderShape {
  _RenderRRectangle({
    required BorderRadiusGeometry? radius,
    required BorderRadiusGeometry? outerVRadius,
    required BorderRadiusGeometry? outerHRadius,
    required super.squareSide,
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
  })  : _radius = radius,
        _outerVRadius = outerVRadius,
        _outerHRadius = outerHRadius;

  BorderRadiusGeometry? _radius;
  set radius(BorderRadiusGeometry? value) {
    if (value == _radius) {
      return;
    }
    _radius = value;
    resetPainters();
    markNeedsPaint();
  }

  BorderRadiusGeometry? _outerVRadius;
  set outerVRadius(BorderRadiusGeometry? value) {
    if (value == _outerVRadius) {
      return;
    }
    _outerVRadius = value;
    resetPainters();
    markNeedsPaint();
  }

  BorderRadiusGeometry? _outerHRadius;
  set outerHRadius(BorderRadiusGeometry? value) {
    if (value == _outerHRadius) {
      return;
    }
    _outerHRadius = value;
    resetPainters();
    markNeedsPaint();
  }

  @override
  RRect? getRRectToPaint(Rect rect) {
    // final ratio = _width != null && _height != null ? _width! / _height! : 1.0;
    // if (ratio != 1) {
    //   rect = rect.width / rect.height >= 1
    //       ? Rect.fromCenter(
    //           center: rect.center,
    //           width: rect.height * ratio,
    //           height: rect.height)
    //       : Rect.fromCenter(
    //           center: rect.center,
    //           width: rect.width,
    //           height: rect.width * ratio);
    // }

    late RRect rRect;

    if (_radius is _RadiusCapsule) {
      rRect = RRect.fromRectAndRadius(
        rect,
        Radius.circular(rect.shortestSide / 2),
      );
    } else if (_radius != null) {
      rRect =
          _radius!.resolve(Directionality.maybeOf(buildContext)).toRRect(rect);
    } else if (_outerHRadius == null && _outerVRadius == null) {
      rRect = RRect.fromRectAndRadius(
        rect,
        Radius.circular(rect.shortestSide / 10),
      );
    } else {
      rRect = RRect.fromRectAndRadius(
        rect,
        const Radius.circular(0),
      );
    }

    return rRect.inflate(0.5);
  }

  @override
  Path? getPathToPaint(Rect rect, Offset offset, bool shouldClosePath) {
    if (_outerVRadius == null && _outerHRadius == null) return null;
    final outerVRadius =
        _outerVRadius?.resolve(Directionality.maybeOf(buildContext));
    final outerHRadius =
        _outerHRadius?.resolve(Directionality.maybeOf(buildContext));
    final innerRadius = _radius?.resolve(Directionality.maybeOf(buildContext));
    //

    Radius getRadius(BorderRadius borderRadius, double x, double y) {
      if (x == 0.0 && y == 0.0) {
        return borderRadius.topLeft;
      }
      if (x == 0.0 && y == 1.0) {
        return borderRadius.bottomLeft;
      }
      if (x == 1.0 && y == 0.0) {
        return borderRadius.topRight;
      }
      return borderRadius.bottomRight;
    }

    Path fn(Path path, double x, double y, [bool isV = true]) {
      final outerRadius = (isV ? outerVRadius : outerHRadius) as BorderRadius;
      final outerR = getRadius(outerRadius, x, y);
      if (outerR == Radius.zero) {
        return path;
      }
      final innerR = innerRadius == null ? null : getRadius(innerRadius, x, y);
      if (innerR != null && innerR != Radius.zero) {
        return path;
      }
      final outerRSymmetric = getRadius(outerRadius, x == 0 ? 1 : 0, y);
      final innerRSymmetric = innerRadius == null
          ? null
          : getRadius(innerRadius, x == 0 ? 1 : 0, y);

      final radiusWidth = 2.0 *
          min(outerR.x,
              rect.width - (outerRSymmetric.x + (innerRSymmetric?.x ?? 0)));

      final radiusHeight = 2.0 * min(outerR.y, rect.height);
      Offset lineToCenter = Offset.zero;
      double startAngle = 0.0;
      Rect cornerRect = Rect.zero;
      // isV = !isV;
      final isVSign = isV ? 1 : -1;
      if (x == 0 && y == 0) {
        lineToCenter = rect.topLeft + Offset(-isVSign * 0.5, isVSign * 0.5);
        startAngle = isVSign * pi / 2;
        cornerRect = Rect.fromLTWH(
          lineToCenter.dx - (isV ? 0 : radiusWidth),
          lineToCenter.dy - (isV ? radiusHeight : 0),
          radiusWidth,
          radiusHeight,
        );
      } else if (x == 1 && y == 0) {
        lineToCenter = rect.topRight + Offset(isVSign * 0.5, isVSign * 0.5);
        startAngle = (isV ? 0 : -1) * pi;
        cornerRect = Rect.fromLTWH(
          lineToCenter.dx - (isV ? radiusWidth : 0),
          lineToCenter.dy - (isV ? radiusHeight : 0),
          radiusWidth,
          radiusHeight,
        );
      } else if (x == 1 && y == 1) {
        lineToCenter = rect.bottomRight + Offset(isVSign * 0.5, -isVSign * 0.5);
        startAngle = -isVSign * pi / 2;
        cornerRect = Rect.fromLTWH(
          lineToCenter.dx - (isV ? radiusWidth : 0),
          lineToCenter.dy - (isV ? 0 : radiusHeight),
          radiusWidth,
          radiusHeight,
        );
      } else {
        lineToCenter = rect.bottomLeft + Offset(-isVSign * 0.5, -isVSign * 0.5);
        startAngle = (isV ? -1 : 0) * pi;
        cornerRect = Rect.fromLTWH(
          lineToCenter.dx - (isV ? 0.0 : radiusWidth),
          lineToCenter.dy - (isV ? 0 : radiusHeight),
          radiusWidth,
          radiusHeight,
        );
      }
      path.addArc(cornerRect, startAngle, pi / 2);
      path.lineTo(lineToCenter.dx, lineToCenter.dy);
      path.close();
      return path;
    }

    Path? path;

    if (outerVRadius != null) {
      path = Path();
      path = fn(path, 0, 0);
      path = fn(path, 1, 0);
      path = fn(path, 0, 1);
      path = fn(path, 1, 1);
    }
    if (outerHRadius != null) {
      path ??= Path();
      path = fn(path, 0, 0, false);
      path = fn(path, 1, 0, false);
      path = fn(path, 0, 1, false);
      path = fn(path, 1, 1, false);
    }

    return path;
  }

  @override
  Rect? getCircleToPaint(Object rect) {
    return null;
  }

  @override
  Rect? getRectToPain(Rect rect) {
    return null;
  }
}

class _RadiusCapsule extends BorderRadius {
  _RadiusCapsule() : super.circular(0);
}
