import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

/// Parent data for use with [RenderStack].
class _StackParentData extends ContainerBoxParentData<RenderBox> {
  bool isPositioned = false;
}

class _RenderStack extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _StackParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _StackParentData> {
  _RenderStack(
      {AlignmentGeometry? alignment,
      required this.isLastPositioned,
      required this.buildContext})
      : _alignment = alignment;

  final bool isLastPositioned;
  final BuildContext buildContext;
  AlignmentGeometry? _alignment;

  set alignment(AlignmentGeometry? value) {
    if (value == _alignment) {
      return;
    }
    _alignment = value;
    _resolvedAlignment = null;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _StackParentData) {
      child.parentData = _StackParentData();
    }
  }

  static double getIntrinsicDimension(RenderBox? firstChild,
      double Function(RenderBox child) mainChildSizeGetter) {
    double extent = 0.0;
    RenderBox? child = firstChild;
    while (child != null) {
      final _StackParentData childParentData =
          child.parentData! as _StackParentData;
      extent = math.max(extent, mainChildSizeGetter(child));
      assert(child.parentData == childParentData);
      child = childParentData.nextSibling;
    }
    return extent;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    return getIntrinsicDimension(
        firstChild, (RenderBox child) => child.getMinIntrinsicWidth(height));
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return getIntrinsicDimension(
        firstChild, (RenderBox child) => child.getMaxIntrinsicWidth(height));
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return getIntrinsicDimension(
      firstChild,
      (RenderBox child) => child.getMinIntrinsicHeight(width),
    );
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return getIntrinsicDimension(
        firstChild, (RenderBox child) => child.getMaxIntrinsicHeight(width));
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToHighestActualBaseline(baseline);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    firstChild!.layout(
      constraints,
      parentUsesSize: false,
    );
    if (isLastPositioned) return firstChild!.size;
    lastChild!.layout(
      constraints,
      parentUsesSize: false,
    );
    return Size(
      math.max(firstChild!.size.width, lastChild!.size.width),
      math.max(firstChild!.size.height, lastChild!.size.height),
    );
  }

  @override
  void performLayout() {
    assert(childCount == 2);
    firstChild!.layout(
      constraints,
      parentUsesSize: true,
    );
    if (isLastPositioned) {
      size = firstChild!.size;
      lastChild!.layout(
        constraints.tighten(width: size.width, height: size.height),
        parentUsesSize: true,
      );
    } else {
      lastChild!.layout(
        constraints.loosen(),
        parentUsesSize: true,
      );

      size = Size(
        math.max(firstChild!.size.width, lastChild!.size.width),
        math.max(firstChild!.size.height, lastChild!.size.height),
      );

      _resolve();
      final rect1 = _resolvedAlignment!.inscribe(
        firstChild!.size,
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
      (firstChild!.parentData as _StackParentData).offset = rect1.topLeft;
      final rect2 = _resolvedAlignment!.inscribe(
        lastChild!.size,
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
      (lastChild!.parentData as _StackParentData).offset = rect2.topLeft;
    }
  }

  Alignment? _resolvedAlignment;

  void _resolve() {
    if (_resolvedAlignment != null) {
      return;
    }
    _resolvedAlignment =
        _alignment?.resolve(Directionality.maybeOf(buildContext));
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    RenderBox? child = lastChild;
    bool isHit = false;
    while (child != null) {
      final childParentData = child.parentData! as _StackParentData;
      isHit = result.addWithPaintOffset(
        offset: childParentData.offset,
        position: position,
        hitTest: (BoxHitTestResult result, Offset transformed) {
          assert(transformed == position - childParentData.offset);
          return child!.hitTest(result, position: transformed);
        },
      );
      child = childParentData.previousSibling;
    }
    return isHit;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(firstChild!,
        offset + (firstChild!.parentData as _StackParentData).offset);
    context.paintChild(lastChild!,
        offset + (lastChild!.parentData as _StackParentData).offset);
  }
}

class MyStack extends MultiChildRenderObjectWidget {
  MyStack({
    super.key,
    super.children,
    this.alignment,
    this.isLastPositioned = true,
  });
  final AlignmentGeometry? alignment;
  final bool isLastPositioned;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderStack(
      alignment: alignment,
      isLastPositioned: isLastPositioned,
      buildContext: context,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderStack renderObject) {
    renderObject.alignment = alignment;
  }
}

// class MyPositioned extends ParentDataWidget<_StackParentData> {
//   const MyPositioned({super.key, required super.child});

//   @override
//   void applyParentData(RenderObject renderObject) {
//     final data = renderObject.parentData as _StackParentData;
//     data.isPositioned = true;
//   }

//   @override
//   Type get debugTypicalAncestorWidgetClass => MyStack;
// }
