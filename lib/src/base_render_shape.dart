// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shape_builder/shape_builder.dart';
import 'package:shape_builder/src/paint_style.dart';

import 'gradient_color.dart';
import 'stack_render_shape.dart';

part 'base_single_child_render_shape.dart';
part 'oval.dart';
part 'rectangle.dart';
part 'rounded_rectangle.dart';
part 'shape_builder.dart';
part 'colorize.dart';

abstract class _BaseRenderShape extends RenderAligningShiftedBox {
  _BaseRenderShape({
    required double? width,
    required double? height,
    required bool shouldExpand,
    required Color? color,
    required List<BoxShadow> boxShadow,
    required Clip clipBehavior,
    required bool shrinkToClippedSize,
    required this.buildContext,
    required bool childIsInTheForeground,
    required AlignmentGeometry alignment,
    required DecorationImage? decorationImage,
    required double? squareSide,
    required Size? imageSize,
    required PaintStyle? paintStyle,
    required this.isConstraintTransparent,
  })  : _color = color,
        _width = width,
        _height = height,
        _shouldExpand = shouldExpand,
        _boxShadow = boxShadow,
        _clipBehavior = clipBehavior,
        _shrinkToClippedSize = shrinkToClippedSize,
        _childIsInTheForeground = childIsInTheForeground,
        _alignment = alignment,
        _squareSide = squareSide,
        _imageSize = imageSize,
        _paintStyle = paintStyle,
        super(textDirection: TextDirection.ltr);

  final BuildContext buildContext;
  final bool isConstraintTransparent;

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

  bool _shrinkToClippedSize;
  set shrinkToClippedSize(bool value) {
    if (value == _shrinkToClippedSize) {
      return;
    }
    _shrinkToClippedSize = value;
    resetPainters();
    markNeedsLayout();
  }

  double? _width;
  set width(double? value) {
    if (value == _width) {
      return;
    }
    _width = value;
    resetPainters();
    markNeedsLayout();
  }

  double? _height;
  set height(double? value) {
    if (value == _height) {
      return;
    }
    _height = value;
    resetPainters();
    markNeedsLayout();
  }

  bool _shouldExpand;
  set shouldExpand(bool value) {
    if (value == _shouldExpand) {
      return;
    }
    _shouldExpand = value;
    resetPainters();
    markNeedsPaint();
  }

  bool _childIsInTheForeground;
  set childIsInTheForeground(bool value) {
    if (value == _childIsInTheForeground) {
      return;
    }
    _childIsInTheForeground = value;
    resetPainters();
    markNeedsPaint();
  }

  Size? _imageSize;
  set imageSize(Size? value) {
    if (value == _imageSize) {
      return;
    }
    _imageSize = value;
    resetPainters();
    markNeedsPaint();
  }

  AlignmentGeometry _alignment;
  @override
  set alignment(AlignmentGeometry value) {
    if (value == _alignment) {
      return;
    }
    _resolvedAlignment = null;
    _alignment = value;
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

  double centerX = 0.0;
  double centerY = 0.0;

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
    if (isConstraintTransparent) {
      assert(child != null);
      child!.layout(c, parentUsesSize: true);
      return child!.size;
    }
    _width ??= _shouldExpand ? double.infinity : _width;
    _height ??= _shouldExpand ? double.infinity : _height;
    _squareSide ??=
        _squareSide != null && _shouldExpand ? double.infinity : _squareSide;
    var width = c.hasTightWidth ? c.minWidth : _width;
    var height = c.hasTightHeight ? c.minHeight : _height;
    Size? drySize;
    if (_imageSize != null) {
      var dd = c.constrainSizeAndAttemptToPreserveAspectRatio(
        Size(
          _imageSize!.width != -1 ? _imageSize!.width : width ?? c.maxWidth,
          _imageSize!.height != -1 ? _imageSize!.height : height ?? c.maxHeight,
        ),
      );
      child!.layout(
        _imageSize == const Size(-1, -1)
            ? dd.isFinite
                ? BoxConstraints.tight(dd)
                : BoxConstraints.loose(dd) // Test me
            : BoxConstraints(
                maxWidth: _imageSize!.width != -1 ? dd.width : c.maxWidth,
                minWidth: width != null ? dd.width : c.minWidth,
                maxHeight: _imageSize!.height != -1 ? dd.height : c.maxHeight,
                minHeight: height != null ? dd.height : c.minHeight,
              ),
        parentUsesSize: true,
      );
      drySize = child!.size;
      if (_imageSize == const Size(-1, -1)) {
        sizeToPaint = drySize;
      } else {
        final widthFactor =
            _imageSize!.width == -1 ? 1 : drySize.width / _imageSize!.width;
        // final heightFactor =
        //     _imageSize!.height == -1 ? 1 : drySize.height / _imageSize!.height;
        sizeToPaint = Size(
          _width != null ? _width! * widthFactor : drySize.width,
          _height != null ? _height! * widthFactor : drySize.height,
          // (_width ?? drySize.width) * widthFactor,
          // (_height ?? drySize.height) * heightFactor,
        );
      }

      if (_squareSide != null &&
          (_imageSize?.width == -1 || _imageSize?.height == -1)) {
        if (drySize.aspectRatio != 1) {
          sizeToPaint = Size.square(drySize.shortestSide);
        }
      }
    } else {
      var dd = c.constrain(Size(width ?? 0.0, height ?? 0.0));

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
      } else {
        constraints = BoxConstraints(
          maxWidth: c.maxWidth,
          maxHeight: c.maxHeight,
          minWidth: width == null ? 0.0 : dd.width,
          minHeight: height == null ? 0.0 : dd.height,
        );
      }

      if (child != null) {
        if (parentUseSize) {
          child!.layout(constraints, parentUsesSize: true);
          drySize = child!.size;
          sizeToPaint = drySize;
        } else {
          drySize = child!.getDryLayout(constraints);
          sizeToPaint = drySize;
        }
      } else {
        drySize = Size(constraints.maxWidth, constraints.maxHeight);
        sizeToPaint = drySize;
      }
      if (_squareSide != null) {
        if (drySize.aspectRatio != 1) {
          sizeToPaint = Size.square(drySize.shortestSide);
        }
      }
    }

    sizeToPaint = Size(
      min(sizeToPaint.width, width ?? double.infinity),
      min(sizeToPaint.height, height ?? double.infinity),
    );
    this.drySize = drySize;

    return _clipBehavior == Clip.none || !_shrinkToClippedSize
        ? drySize
        : Size(
            c.hasTightWidth ? c.minWidth : sizeToPaint.width,
            c.hasTightHeight ? c.minHeight : sizeToPaint.height,
          );
  }

  Size drySize = Size.zero;
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
    if (isConstraintTransparent) {
      context.paintChild(child!, offset);
      return;
    }
    final effectiveRect = getEffectiveRect(offset);
    bool recreate =
        _painter == null || effectiveRect != _painter!.effectiveRect;
    _painter = recreate
        ? _ShapePainter(
            offset: offset,
            onChanged: markNeedsPaint,
            effectiveRect: effectiveRect,
            renderShape: this,
            paintStyle: _paintStyle,
          )
        : _painter;
    _painter!.paint(context, offset);
  }

  Alignment? _resolvedAlignment;

  @override
  void alignChild() {
    assert(child != null);
    assert(!child!.debugNeedsLayout);
    assert(child!.hasSize);
    assert(hasSize);
    assert(_resolvedAlignment != null);
    final BoxParentData childParentData = child!.parentData! as BoxParentData;
    childParentData.offset =
        _resolvedAlignment!.alongOffset((size - child!.size) as Offset);
  }

  Rect getEffectiveRect(Offset offset) {
    double width = sizeToPaint.width;
    double height = sizeToPaint.height;

    _resolvedAlignment =
        _alignment.resolve(Directionality.maybeOf(buildContext));

    if (child != null && _shrinkToClippedSize) {
      alignChild();
    }

    final rect = _resolvedAlignment!.inscribe(
      Size(width, height),
      Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height),
    );
    centerX = rect.center.dx - offset.dx;
    centerY = rect.center.dy - offset.dy;
    return rect;
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
    } else if (color is ColorWithBlendMode) {
      painter.color = (color as ColorWithBlendMode).blendColor;
      if ((color as ColorWithBlendMode).blendMode != null) {
        painter.blendMode = (color as ColorWithBlendMode).blendMode!;
      }
    } else {
      painter.color = color;
    }
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
    final child = renderShape.child;

    if (child == null) {
      return;
    }
    if (renderShape._shrinkToClippedSize) {
      final BoxParentData childParentData = child.parentData! as BoxParentData;
      context.paintChild(child, childParentData.offset + offset);
      return;
    }
    context.paintChild(child, offset);
  }

  void dispose() {
    _imagePainter?.dispose();
  }

  void _performPaint(
    PaintingContext context,
    Offset _, [
    bool paintShadow = false,
  ]) {
    if (paintShadow) {
      // TODO Test me
      _paintShadows(context.canvas);
    }
    if (!renderShape._childIsInTheForeground) {
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

    if (renderShape._childIsInTheForeground) {
      _paintBackgroundImageOrChild(context);
    }
  }

  void paint(PaintingContext context, Offset offset) {
    if (renderShape._clipBehavior == Clip.none) {
      _performPaint(context, offset, true);
    } else {
      _paintShadows(context.canvas);
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
