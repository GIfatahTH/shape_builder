// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shape_builder/src/paint_style.dart';

import 'gradient_color.dart';

part 'base_single_child_render_shape.dart';
part 'oval.dart';
part 'rectangle.dart';
part 'rounded_rectangle.dart';

abstract class _BaseRenderShape extends RenderProxyBoxWithHitTestBehavior {
  _BaseRenderShape({
    required double? width,
    required double? height,
    required Color? color,
    required List<BoxShadow> boxShadow,
    required Clip clipBehavior,
    required this.buildContext,
    required bool isOverlay,
    required AlignmentGeometry alignment,
    required DecorationImage? decorationImage,
    required double? squareSide,
    required bool isTightConstraint,
    required PaintStyle? paintStyle,
  })  : _color = color,
        _width = width,
        _height = height,
        _boxShadow = boxShadow,
        _clipBehavior = clipBehavior,
        _isOverlay = isOverlay,
        _alignment = alignment,
        _decorationImage = decorationImage,
        _squareSide = squareSide,
        _isTightConstraint = isTightConstraint,
        _paintStyle = paintStyle,
        super(behavior: HitTestBehavior.opaque);

  final BuildContext buildContext;

  List<BoxShadow> _boxShadow;
  set boxShadow(List<BoxShadow> value) {
    if (_boxShadow is BoxShadowWithElevation &&
        value is BoxShadowWithElevation) {
      if (_boxShadow == value) return;
    } else if (_boxShadow is! BoxShadowWithElevation &&
        value is! BoxShadowWithElevation) {
      if (listEquals(value, _boxShadow)) {
        return;
      }
    }
    _boxShadow = value;
    resetPainters();
    markNeedsPaint();
  }

  Color? _color;
  set color(Color? value) {
    if (value == _color) {
      return;
    }
    _color = value;
    resetPainters();
    markNeedsPaint();
  }

  Clip _clipBehavior;
  set clipBehavior(Clip value) {
    if (value == _clipBehavior) {
      return;
    }
    _clipBehavior = value;
    resetPainters();
    markNeedsPaint();
  }

  double? _width;
  set width(double? value) {
    if (value == _width) {
      return;
    }
    _width = value;
    resetPainters();
    markNeedsPaint();
  }

  double? _height;
  set height(double? value) {
    if (value == _height) {
      return;
    }
    _height = value;
    resetPainters();
    markNeedsPaint();
  }

  bool _isOverlay;
  set isOverlay(bool value) {
    if (value == _isOverlay) {
      return;
    }
    _isOverlay = value;
    resetPainters();
    markNeedsPaint();
  }

  bool _isTightConstraint;
  set isTightConstraint(bool value) {
    if (value == _isTightConstraint) {
      return;
    }
    _isTightConstraint = value;
    resetPainters();
    markNeedsPaint();
  }

  AlignmentGeometry _alignment;
  set alignment(AlignmentGeometry value) {
    if (value == _alignment) {
      return;
    }
    _alignment = value;
    // resetPainters();
    // markNeedsPaint();
  }

  DecorationImage? _decorationImage;
  set decorationImage(DecorationImage? value) {
    if (value == _decorationImage) {
      return;
    }
    _decorationImage = value;

    resetPainters();
    markNeedsPaint();
  }

  double? _squareSide;
  set squareSide(double? value) {
    if (value == _squareSide) {
      return;
    }
    _squareSide = value;
    resetPainters();
    markNeedsPaint();
  }

  PaintStyle? _paintStyle;
  set paintStyle(PaintStyle? value) {
    if (value == _paintStyle) {
      return;
    }
    _paintStyle = value;
    resetPainters();
    markNeedsPaint();
  }

  double offsetX = 0.0;
  double offsetY = 0.0;

  _ShapePainter? _painter;

  void resetPainters() {
    if (_painter == null) return;
    _painter!.dispose();
    _painter = null;
  }

  @override
  void dispose() {
    resetPainters();
    super.dispose();
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    // return _painter?.hitTest(result, position: position) ?? false;
    if (_clipBehavior == Clip.none) {
      return super.hitTest(result, position: position);
    }
    if (_painter?.sizeContains(position) ?? false) {
      return hitTestChildren(result, position: position);

      // super.hitTest(result, position: position);
    }
    return false;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _computeLayout(constraints, parentUseSize: false);
  }

  Size _computeLayout(
    BoxConstraints c, {
    required bool parentUseSize,
  }) {
    _width = c.hasTightWidth ? c.minWidth : _width;
    _height = c.hasTightHeight ? c.minHeight : _height;

    var dd = _isTightConstraint
        ? c.constrainSizeAndAttemptToPreserveAspectRatio(
            Size(_width ?? double.infinity, _height ?? double.infinity),
          )
        : c.constrain(
            Size(_width ?? double.infinity, _height ?? double.infinity));

    if (_squareSide != null && !c.isTight) {
      dd = Size.square(
        c.hasTightWidth
            ? c.maxWidth
            : c.hasTightHeight
                ? c.maxHeight
                : dd.shortestSide,
      );
    }

    BoxConstraints constraints;
    if (child == null) {
      constraints = BoxConstraints.tight(dd);
    } else if (!_isTightConstraint) {
      constraints = BoxConstraints(
        maxWidth: c.maxWidth,
        maxHeight: c.maxHeight,
        minWidth: _width == null ? 0.0 : dd.width,
        minHeight: _height == null ? 0.0 : dd.height,
      );
    } else {
      constraints = c.tighten(
        width: dd.width,
        height: dd.height,
      );
    }

    Size? drySize;
    if (child != null) {
      if (parentUseSize) {
        child!.layout(constraints, parentUsesSize: true);
        drySize = child!.size;
      } else {
        drySize = child!.getDryLayout(c);
      }
    } else {
      drySize = Size(constraints.maxWidth, constraints.maxHeight);
    }

    sizeToPaint = drySize;

    if (_squareSide != null) {
      if (drySize.aspectRatio != 1) {
        sizeToPaint = Size.square(drySize.shortestSide);
      }
    }

    sizeToPaint = Size(
      min(sizeToPaint.width, _width ?? double.infinity),
      min(sizeToPaint.height, _height ?? double.infinity),
    );

    // return _clipBehavior == Clip.none
    //     ? drySize
    //     : Size(
    //         _width ?? drySize.width,
    //         _height ?? drySize.height,
    //       );
    return drySize;
  }

  Size sizeToPaint = Size.zero;

  @override
  void performLayout() {
    // return super.performLayout();
    size = _computeLayout(constraints, parentUseSize: true);
  }

  Rect? getRectToPain(Rect rect);
  RRect? getRRectToPaint(Rect rect);
  Rect? getCircleToPaint(Rect rect);
  Path? getPathToPaint(Rect rec, Offset offset, bool shouldClosePath);

  @override
  void paint(PaintingContext context, Offset offset) {
    if (size == Size.zero) return;
    final effectiveSize = getEffectiveRect(offset);
    bool recreate =
        _painter == null || effectiveSize != _painter!.effectiveRect;
    _painter = recreate
        ? _ShapePainter(
            offset: offset,
            onChanged: markNeedsPaint,
            effectiveRect: effectiveSize,
            renderShape: this,
            paintStyle: _paintStyle,
          )
        : _painter;
    _painter!.paint(context, offset);
  }

  Rect getEffectiveRect(Offset offset) {
    double width = sizeToPaint.width;
    double height = sizeToPaint.height;
    // print(child!.size);
    // final s = _clipBehavior == Clip.none ? size : (child?.size ?? size);
    final s = size;

    final alignment = _alignment.resolve(Directionality.maybeOf(buildContext));
    final x = alignment.x;
    offsetX = (s.width * x + s.width + -x.sign * width) / 2;
    final y = alignment.y;
    offsetY = (s.height * y + s.height - y.sign * height) / 2;

    return Rect.fromCenter(
      center: offset + Offset(offsetX, offsetY),
      width: width,
      height: height,
    );
  }
}

class _ShapePainter {
  _ShapePainter({
    required this.renderShape,
    required this.offset,
    required this.onChanged,
    required this.effectiveRect,
    required PaintStyle? paintStyle,
  }) {
    color = renderShape._color ??
        Theme.of(renderShape.buildContext).colorScheme.primary;
    _setRects(effectiveRect, paintStyle?.style != PaintingStyle.stroke);
    painter = Paint();

    if (color is ColorWithGradient) {
      final colorWithGradient = color as ColorWithGradient;
      if (colorWithGradient.blendMode != null) {
        painter.blendMode = colorWithGradient.blendMode!;
      }
      painter.shader =
          (color as ColorWithGradient).gradient.createShader(effectiveRect);
    } else {
      if (color is ColorWithBlendMode) {
        painter.blendMode = (color as ColorWithBlendMode).blendMode!;
      }
      painter.color = color;
      if (paintStyle?.style != null) {
        painter.style = paintStyle!.style!;
      }
      if (paintStyle?.strokeWidth != null) {
        painter.strokeWidth = paintStyle!.strokeWidth!;
      }

      if (paintStyle?.strokeCap != null) {
        painter.strokeCap = paintStyle!.strokeCap!;
      }

      if (paintStyle?.strokeMiterLimit != null) {
        painter.strokeMiterLimit = paintStyle!.strokeMiterLimit!;
      }
      if (paintStyle?.strokeJoin != null) {
        painter.strokeJoin = paintStyle!.strokeJoin!;
      }
    }
  }

  void _setRects(Rect effectiveRect, bool shouldClosePath) {
    rectToPaint = renderShape.getRectToPain(effectiveRect);
    rrectToPaint = renderShape.getRRectToPaint(effectiveRect);
    circleRectToPaint = renderShape.getCircleToPaint(effectiveRect);
    pathToPaint =
        renderShape.getPathToPaint(effectiveRect, offset, shouldClosePath);
  }

  late final Path pathForShade = () {
    if (rectToPaint != null) {
      return Path()..addRect(rectToPaint!);
    }
    if (rrectToPaint != null) {
      final path = Path()..addRRect(rrectToPaint!);
      if (pathToPaint != null) {
        path.addPath(pathToPaint!, Offset.zero);
      }
      return path;
    }
    if (circleRectToPaint != null) {
      return Path()..addOval(circleRectToPaint!);
    }
    return pathToPaint!;
  }();

  final VoidCallback onChanged;
  final _BaseRenderShape renderShape;

  final Offset offset;
  late final Color color;
  final Rect effectiveRect;
  late final Rect? rectToPaint;
  late final RRect? rrectToPaint;
  late final Rect? circleRectToPaint;
  Path? pathToPaint;
  late final Paint painter;

  bool sizeContains(Offset position) {
    position = position + offset;
    final t = pathForShade.contains(position);
    return t;
  }

  void _paintShadows(Canvas canvas) {
    final shadow = renderShape._boxShadow;
    if (shadow.isEmpty) {
      return;
    }

    if (shadow is BoxShadowWithElevation) {
      final elevation = shadow.elevation;
      final shadowColor = shadow.shadowColor ??
          Theme.of(renderShape.buildContext).colorScheme.shadow;

      if (elevation > 0) {
        canvas.drawRect(
          effectiveRect.inflate(20.0),
          Paint()..color = const Color(0x00000000),
        );
        canvas.drawShadow(
          pathForShade,
          shadowColor,
          elevation,
          color.alpha != 0xFF,
        );
      }
    } else {
      for (final BoxShadow boxShadow in shadow) {
        final Paint shadowPaint = boxShadow.toPaint();

        if (rectToPaint != null) {
          final Rect bounds = rectToPaint!
              .shift(boxShadow.offset)
              .inflate(boxShadow.spreadRadius);
          canvas.drawRect(bounds, shadowPaint);
        } else if (rrectToPaint != null) {
          final bounds = rrectToPaint!
              .shift(boxShadow.offset)
              .inflate(boxShadow.spreadRadius);
          canvas.drawRRect(bounds, shadowPaint);
          if (pathToPaint != null) {
            _shadePath(canvas, boxShadow, shadowPaint);
          }
        } else if (circleRectToPaint != null) {
          final bounds = circleRectToPaint!
              .shift(boxShadow.offset)
              .inflate(boxShadow.spreadRadius);
          canvas.drawOval(bounds, shadowPaint);
        } else {
          _shadePath(canvas, boxShadow, shadowPaint);
        }
      }
    }
  }

  void _shadePath(Canvas canvas, BoxShadow boxShadow, Paint paint) {
    var p = pathToPaint!.shift(boxShadow.offset);
    // TODO To optimize
    var p2 = p.shift(Offset(boxShadow.spreadRadius, 0));
    p = Path.combine(PathOperation.union, p, p2);
    p2 = p.shift(Offset(-boxShadow.spreadRadius, 0));
    p = Path.combine(PathOperation.union, p, p2);
    p2 = p.shift(Offset(0, boxShadow.spreadRadius));
    p = Path.combine(PathOperation.union, p, p2);
    p2 = p.shift(Offset(0, -boxShadow.spreadRadius));
    p = Path.combine(PathOperation.union, p, p2);
    canvas.drawPath(p, paint);
  }

  DecorationImagePainter? _imagePainter;
  void _paintBackgroundImageOrChild(PaintingContext context) {
    final image = renderShape._decorationImage;
    final child = renderShape.child;

    if (image == null) {
      if (child != null) {
        context.paintChild(child, offset);
      }
      return;
    }
    _imagePainter ??= image.createPainter(onChanged);
    _imagePainter!.paint(
      context.canvas,
      effectiveRect,
      pathToPaint,
      createLocalImageConfiguration(
        renderShape.buildContext,
        size: renderShape.size,
      ),
    );
  }

  void dispose() {
    _imagePainter?.dispose();
  }

  void _performPaint(PaintingContext context, Offset offset) {
    _paintShadows(context.canvas);
    if (renderShape._isOverlay) {
      _paintBackgroundImageOrChild(context);
    }

    if (rectToPaint != null) {
      context.canvas.drawRect(rectToPaint!, painter);
    } else if (rrectToPaint != null) {
      context.canvas.drawRRect(rrectToPaint!, painter);
      if (pathToPaint != null) {
        context.canvas.drawPath(pathToPaint!, painter);
      }
    } else if (circleRectToPaint != null) {
      context.canvas.drawOval(circleRectToPaint!, painter);
    } else {
      context.canvas.drawPath(pathToPaint!, painter);
    }

    if (!renderShape._isOverlay) {
      _paintBackgroundImageOrChild(context);
    }
  }

  void paint(PaintingContext context, Offset offset) {
    if (renderShape._clipBehavior == Clip.none) {
      _performPaint(context, offset);
    } else {
      if (rectToPaint != null) {
        context.clipRectAndPaint(
          rectToPaint!,
          renderShape._clipBehavior,
          effectiveRect,
          () => _performPaint(context, offset),
        );
      } else if (rrectToPaint != null) {
        context.clipRRectAndPaint(
          rrectToPaint!,
          renderShape._clipBehavior,
          effectiveRect,
          () => _performPaint(context, offset),
        );
      } else if (circleRectToPaint != null) {
        if (renderShape._squareSide != null) {
          context.clipRRectAndPaint(
            RRect.fromRectAndRadius(circleRectToPaint!,
                Radius.circular(circleRectToPaint!.width / 2)),
            renderShape._clipBehavior,
            effectiveRect,
            () => _performPaint(context, offset),
          );
        } else {
          context.clipPathAndPaint(
            pathForShade,
            renderShape._clipBehavior,
            effectiveRect,
            () => _performPaint(context, offset),
          );
        }
      } else {
        context.clipPathAndPaint(
          pathToPaint!,
          renderShape._clipBehavior,
          effectiveRect,
          () => _performPaint(context, offset),
        );
      }
    }
  }
}
