import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyFittedBox extends SingleChildRenderObjectWidget {
  const MyFittedBox({
    required this.width,
    required this.height,
    this.inheritedFraction = 1.0,
    required this.fitTheShortestSide,
    super.key,
    super.child,
  });
  final double? width, height;
  final double inheritedFraction;
  final bool fitTheShortestSide;
  @override
  MyRenderFittedBox createRenderObject(BuildContext context) {
    return MyRenderFittedBox(
      width: width,
      height: height,
      inheritedFraction: inheritedFraction,
      fitTheShortestSide: fitTheShortestSide,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, MyRenderFittedBox renderObject) {
    renderObject
      ..width = width
      ..height = height
      ..fitTheShortestSide = fitTheShortestSide
      ..inheritedFraction = inheritedFraction;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

class MyRenderFittedBox extends RenderProxyBox {
  MyRenderFittedBox({
    required double? width,
    required double? height,
    required bool fitTheShortestSide,
    required double inheritedFraction,
  })  : _width = width,
        _height = height,
        _fitTheShortestSide = fitTheShortestSide,
        _inheritedFraction = inheritedFraction;

  double? _width;
  set width(double? value) {
    if (value == _width) {
      return;
    }
    _width = value;
    // _transform = null;
    markNeedsLayout();
  }

  double? _height;
  set height(double? value) {
    if (value == _height) {
      return;
    }
    _height = value;

    markNeedsLayout();
  }

  double _inheritedFraction;
  set inheritedFraction(double value) {
    if (value == _width) {
      return;
    }
    _inheritedFraction = value;
    // _transform = null;
    markNeedsLayout();
  }

  bool _fitTheShortestSide;
  set fitTheShortestSide(bool value) {
    if (value == _fitTheShortestSide) {
      return;
    }
    _fitTheShortestSide = value;

    markNeedsLayout();
  }

  // TODO(ianh): The intrinsic dimensions of this box are wrong.

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    if (child != null) {
      final w = min(_width ?? double.infinity, constraints.maxWidth);
      final h = min(_height ?? double.infinity, constraints.maxHeight);
      constraints = BoxConstraints.tight(Size(w, h));

      final Size childSize = child!.getDryLayout(
        constraints.loosen(),
      );

      bool invalidChildSize = false;
      assert(() {
        if (RenderObject.debugCheckingIntrinsics &&
            childSize.width * childSize.height == 0.0) {
          invalidChildSize = true;
        }
        return true;
      }());
      if (invalidChildSize) {
        assert(debugCannotComputeDryLayout(
          reason: 'Child provided invalid size of $childSize.',
        ));
        return Size.zero;
      }
      return constraints
          .constrainSizeAndAttemptToPreserveAspectRatio(childSize);
    } else {
      return constraints.smallest;
    }
  }

  BoxConstraints? _constraints;
  @override
  BoxConstraints get constraints {
    if (_constraints != null) return _constraints!;
    _constraints = super.constraints;
    _width ??= double.infinity;
    _height ??= double.infinity;

    _boxFit = _fitTheShortestSide ? BoxFit.contain : BoxFit.fill;

    _boxFit = _width != double.infinity && _height != double.infinity
        ? _boxFit
        : _width != double.infinity
            ? BoxFit.fitWidth
            : _height != double.infinity
                ? BoxFit.fitHeight
                : _boxFit;
    final w = _constraints!.constrainWidth(_width!);
    final h = _constraints!.constrainHeight(_height!);

    final ss = _fitTheShortestSide &&
            _width != double.infinity &&
            _height != double.infinity
        ? _constraints!.constrainSizeAndAttemptToPreserveAspectRatio(
            Size(_width!, _height!),
          )
        : _constraints!.constrainSizeAndAttemptToPreserveAspectRatio(
            Size(w, h),
          );

    final RenderFlex? renderFlexParent =
        parent is RenderFlex ? (parent as RenderFlex) : null;

    _constraints = BoxConstraints(
      minWidth: _width!.isFinite && ss.width.isFinite ? ss.width : 0,
      minHeight: _height!.isFinite && ss.height.isFinite ? ss.height : 0,
      maxWidth: ss.width.isFinite ? ss.width : double.infinity,
      maxHeight: ss.height.isFinite ? ss.height : double.infinity,
    );

    // if (_renderParent == null &&
    //     renderFlexParent != null &&
    //     renderFlexParent.parent is! RenderSliver) {
    //   _renderParent = renderFlexParent.parent as RenderBox;
    //   if (_renderParent!.hasSize) {
    //     final axis = renderFlexParent.direction;
    //     if (axis == Axis.vertical &&
    //         _constraints!.maxHeight == double.infinity) {
    //       _constraints =
    //           _constraints!.copyWith(maxHeight: _renderParent!.size.height);
    //     }
    //     if (axis == Axis.horizontal &&
    //         _constraints!.maxWidth == double.infinity) {
    //       _constraints =
    //           _constraints!.copyWith(maxWidth: _renderParent!.size.width);
    //     }
    //   }
    // }
    return _constraints!;
  }

  Size? _applyLayout(BoxConstraints c) {
    try {
      child!.layout(c, parentUsesSize: true);
    } catch (e) {
      print(child!.size);
    }
    final childSize = child!.size;
    final constrainedSize = childSize.isFinite && !childSize.isEmpty
        ? constraints.constrainSizeAndAttemptToPreserveAspectRatio(childSize)
        : null;
    return constrainedSize;
  }

  Size? constrainedSize;
  @override
  void performLayout() {
    _constraints = null;
    constrainedSize = null;
    if (child != null) {
      final maxWidth = super.constraints.maxWidth;
      final maxHeight = super.constraints.maxHeight;

      if (_inheritedFraction != 1) {
        final loosenConstraints = BoxConstraints(
          maxWidth: 500,
          maxHeight: maxHeight,
        );
        constrainedSize = _applyLayout(loosenConstraints);
        // print(child!.getMaxIntrinsicHeight(loosenConstraints.maxWidth));
        // print(child!.getMaxIntrinsicWidth(loosenConstraints.maxHeight));
        // print(child!.getDryLayout(BoxConstraints()));
        var childSize = child!.size;
        var widthRatio = (childSize.width) / constrainedSize!.width;
        var heightRatio = (childSize.height) / constrainedSize!.height;
        if (widthRatio == 1 || heightRatio == 1) {
          // final widthFactor =
          //     false && (widthRatio != 1 || constrainedSize!.width == 500)
          //         ? 1
          //         : _inheritedFraction;
          // final heightFactor = (heightRatio != 1 ||
          //         constrainedSize!.height == constraints.maxHeight)
          //     ? 1
          //     : _inheritedFraction;
          constrainedSize = constraints.constrain(
            Size(
              // constrainedSize!.width * widthFactor,
              // constrainedSize!.height * heightFactor,
              constrainedSize!.width * _inheritedFraction,
              constrainedSize!.height * _inheritedFraction,
            ),
          );

          // var widthRatio = (childSize.width) / constrainedSize!.width;
          // var heightRatio = (childSize.height) / constrainedSize!.height;
          _applyLayout(
            constraints.copyWith(
              maxWidth: constrainedSize!.width / _inheritedFraction,
              maxHeight: constrainedSize!.height / _inheritedFraction,
            ),
          );
          childSize = child!.size;
          _boxFit = BoxFit.contain;
        }
        // if (widthRatio == 1 && heightRatio != 1) {
        // } else if (heightRatio == 1 && widthRatio != 1) {
        //   _applyLayout(
        //     constraints.copyWith(
        //       maxHeight: constraints.maxHeight * widthRatio,
        //     ),
        //   );
        //   childSize = child!.size;
        //   _boxFit = BoxFit.contain;
        // } else if (widthRatio == 1 && heightRatio == 1) {

        // }

        size = constrainedSize!;
        _clearPaintData();
        return;
      }

      final loosenConstraints = BoxConstraints(
        maxWidth: maxWidth + 0.1,
        maxHeight: maxHeight + 0.1,
      );

      constrainedSize = _applyLayout(loosenConstraints);
      var childSize = child!.size;
      final childCanBeGreaterThenWidth =
          childSize.width > loosenConstraints.maxWidth - 0.1;
      final childCanBeGreaterThenHeight =
          childSize.height > loosenConstraints.maxHeight - 0.1;

      if (constrainedSize == null) {
        child!.layout(constraints, parentUsesSize: true);
        size = child!.size;
        constrainedSize = size;
        _clearPaintData();
        return;
      }

      if (_fitTheShortestSide) {
        _boxFit1 = BoxFit.contain;
      } else {
        _boxFit1 = BoxFit.fill;
      }
      if (_boxFit == BoxFit.fitHeight) {
        final heightRatio = childSize.height / constrainedSize!.height;
        // heightRation less than one means it will scale up the child
        // and
        // childSize.width greater the the ss.width time the heightRation it
        // means it will overflow

        if (heightRatio > 1) {
          //  TODO find use case
          // if (childCanBeGreaterThenHeight) {
          //   constrainedSize = _applyLayout(constraints);
          // }
          if (childCanBeGreaterThenWidth) {
            constrainedSize = _applyLayout(loosenConstraints.copyWith(
              maxWidth: constraints.maxWidth * heightRatio,
            ));
            _boxFit1 = BoxFit.fill;
          }
          childSize = child!.size;
        } else if (heightRatio < 1 &&
            childSize.width > constrainedSize!.width * heightRatio) {
          _applyLayout(
            loosenConstraints.copyWith(
              maxWidth: constrainedSize!.width * heightRatio,
            ),
          );
          childSize = child!.size;
          _boxFit1 = BoxFit.fitWidth;
        }
      } else if (_boxFit == BoxFit.fitWidth) {
        final widthRatio = childSize.width / constrainedSize!.width;
        if (widthRatio > 1 && childCanBeGreaterThenWidth) {
          constrainedSize = _applyLayout(constraints);
          childSize = child!.size;
        }
        // TODO find use CASE
        else if (widthRatio < 1 &&
            childSize.height > constrainedSize!.height * widthRatio) {
          // _applyLayout(
          //   loosenConstraints.copyWith(
          //     maxHeight: constraints.maxHeight * widthRatio,
          //   ),
          // );
          // child!.layout(
          //   loosenConstraints.copyWith(
          //       maxHeight: constraints.maxHeight * widthRatio),
          //   parentUsesSize: true,
          // );

          childSize = child!.size;
          _boxFit1 = BoxFit.contain;
        }
      }

      size = constrainedSize!;
      _clearPaintData();
    } else {
      size = constraints.smallest;
    }
  }

  bool? _hasVisualOverflow;
  Matrix4? _transform;
  BoxFit _boxFit = BoxFit.contain;
  BoxFit _boxFit1 = BoxFit.contain;

  void _clearPaintData() {
    _hasVisualOverflow = null;
    _transform = null;
  }

  void _updatePaintData() {
    if (_transform != null) {
      return;
    }

    if (child == null) {
      _hasVisualOverflow = false;
      _transform = Matrix4.identity();
    } else {
      final Size childSize = child!.size;
      final FittedSizes sizes =
          applyBoxFit(_boxFit1, childSize, constrainedSize!);
      final double scaleX = sizes.destination.width / sizes.source.width;
      final double scaleY = sizes.destination.height / sizes.source.height;

      final Rect sourceRect =
          Alignment.center.inscribe(sizes.source, Offset.zero & childSize);
      final Rect destinationRect =
          Alignment.center.inscribe(sizes.destination, Offset.zero & size);
      _hasVisualOverflow = sourceRect.width.toInt() < childSize.width.toInt() ||
          sourceRect.height.toInt() < childSize.height.toInt();
      // assert(!_hasVisualOverflow);
      // // if (_hasVisualOverflow!) {
      // //   print("_hasVisualOverflow");
      // // }

      _transform = Matrix4.translationValues(
          destinationRect.left, destinationRect.top, 0.0)
        ..scale(scaleX, scaleY, 1.0)
        ..translate(-sourceRect.left, -sourceRect.top);
      assert(_transform!.storage.every((double value) => value.isFinite));
    }
  }

  TransformLayer? _paintChildWithTransform(
      PaintingContext context, Offset offset) {
    final Offset? childOffset = MatrixUtils.getAsTranslation(_transform!);
    if (childOffset == null) {
      return context.pushTransform(
        needsCompositing,
        offset,
        _transform!,
        super.paint,
        oldLayer: layer is TransformLayer ? layer! as TransformLayer : null,
      );
    } else {
      super.paint(context, offset + childOffset);
    }
    return null;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null || size.isEmpty || child!.size.isEmpty) {
      return;
    }
    _updatePaintData();
    assert(child != null);
    if (_hasVisualOverflow!) {
      // throw Exception('******* has visual over flow *****');
      layer = context.pushClipRect(
        needsCompositing,
        offset,
        Offset.zero & size,
        _paintChildWithTransform,
        oldLayer: layer is ClipRectLayer ? layer! as ClipRectLayer : null,
        clipBehavior: Clip.antiAlias,
      );
    } else {
      layer = _paintChildWithTransform(context, offset);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    if (size.isEmpty || (child?.size.isEmpty ?? false)) {
      return false;
    }
    _updatePaintData();
    return result.addWithPaintTransform(
      transform: _transform,
      position: position,
      hitTest: (BoxHitTestResult result, Offset position) {
        return super.hitTestChildren(result, position: position);
      },
    );
  }

  @override
  bool paintsChild(RenderBox child) {
    assert(child.parent == this);
    return !size.isEmpty && !child.size.isEmpty;
  }

  @override
  void applyPaintTransform(RenderBox child, Matrix4 transform) {
    if (!paintsChild(child)) {
      transform.setZero();
    } else {
      _updatePaintData();
      transform.multiply(_transform!);
    }
  }
}
