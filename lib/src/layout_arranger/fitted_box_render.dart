import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shape_builder/shape_builder.dart';

class MyFittedBox extends SingleChildRenderObjectWidget {
  const MyFittedBox({
    required this.width,
    required this.height,
    this.inheritedFraction,
    required this.fitTheShortestSide,
    this.respectAspectRation = true,
    super.key,
    super.child,
  });
  final double? width, height, inheritedFraction;

  final bool fitTheShortestSide, respectAspectRation;
  @override
  MyRenderFittedBox createRenderObject(BuildContext context) {
    return MyRenderFittedBox(
      width: width,
      height: height,
      inheritedFraction: inheritedFraction,
      fitTheShortestSide: fitTheShortestSide,
      respectAspectRation: respectAspectRation,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, MyRenderFittedBox renderObject) {
    renderObject
      ..width = width
      ..height = height
      ..fitTheShortestSide = fitTheShortestSide
      ..inheritedFraction = inheritedFraction
      ..respectAspectRation = respectAspectRation;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

// class MyRenderFittedBox extends MyRenderFittedBoxBase {
//   MyRenderFittedBox({
//     required super.width,
//     required super.height,
//     required super.fitTheShortestSide,
//     required super.inheritedFraction,
//   });

//   @override
//   void performLayout() {
//     if (child != null) {
//       if (_inheritedFraction != 1) {
//         final loosenConstraints = BoxConstraints(
//           maxWidth: 500,
//           maxHeight: constraints.maxHeight,
//         );
//         late Size childSize;
//         if (cachedChildSize != null &&
//             cachedLoosenConstraints?.maxHeight == loosenConstraints.maxHeight) {
//           childSize = cachedChildSize!;
//         } else {
//           print('************CREATE LaYOUT*************');
//           _constraints = constraints;
//           cachedLoosenConstraints = loosenConstraints;

//           child!.layout(cachedLoosenConstraints!, parentUsesSize: true);
//           childSize = child!.size;
//           cachedChildSize = childSize;
//         }

//         constrainedSize = childSize.isFinite && !childSize.isEmpty
//             ? constraints
//                 .constrainSizeAndAttemptToPreserveAspectRatio(childSize)
//             : null;

//         if (childSize.width == 500) {
//           constrainedSize = constraints.constrain(
//             Size(
//               constraints.maxWidth,
//               constrainedSize!.height * _inheritedFraction * (_width ?? 1),
//             ),
//           );

//           final double scaleY = constrainedSize!.height / childSize.height;

//           child!.layout(
//             loosenConstraints.copyWith(
//               maxWidth: constrainedSize!.width / (scaleY > 0 ? scaleY : 1),
//             ),
//             parentUsesSize: true,
//           );

//           _boxFit1 = BoxFit.fill;

//           constrainedSize = constrainedSize!;
//         } else {
//           final constrainedSize1 = constraints.constrain(
//             Size(
//               constrainedSize!.width * _inheritedFraction * (_width ?? 1),
//               constrainedSize!.height * _inheritedFraction * (_width ?? 1),
//             ),
//           );

//           constrainedSize = constrainedSize1;
//           _boxFit1 = BoxFit.cover;
//         }
//       }

//       size = constrainedSize!;
//       _clearPaintData();
//     } else {
//       size = constraints.smallest;
//     }
//   }
// }

class MyRenderFittedBox extends MyRenderFittedBoxBase {
  MyRenderFittedBox({
    required super.width,
    required super.height,
    required super.fitTheShortestSide,
    required super.inheritedFraction,
    required bool respectAspectRation,
  }) : _respectAspectRation = respectAspectRation;

  bool _respectAspectRation;
  set respectAspectRation(bool value) {
    if (value == _respectAspectRation) {
      return;
    }
    _respectAspectRation = value;

    markNeedsLayout();
  }

  @override
  void performLayout() {
    assert(child != null);

    final maxWidth = _inheritedFraction != null
        ? Resize.adaptiveWidth
        : this.constraints.maxWidth;

    final loosenConstraints = BoxConstraints(
      maxWidth: maxWidth,
      maxHeight: this.constraints.maxHeight,
    );
    Size childSize;
    if (cachedChildSize != null &&
        cachedLoosenConstraints?.maxHeight == loosenConstraints.maxHeight) {
      print('****CachedChildSize****');
      childSize = cachedChildSize!;
    } else {
      print('************CREATE LaYOUT*************');

      cachedLoosenConstraints = loosenConstraints;

      child!.layout(cachedLoosenConstraints!, parentUsesSize: true);
      childSize = child!.size;
      cachedChildSize = childSize;
    }

    final constraints = this.constraints.loosen();
    constrainedSize = childSize.isFinite && !childSize.isEmpty
        ? constraints.constrainSizeAndAttemptToPreserveAspectRatio(childSize)
        : null;
    if (childSize.width == maxWidth) {
      constrainedSize = childSize.height == constraints.maxHeight
          ? childSize
          : !_respectAspectRation && childSize.width > constraints.maxWidth
              ? constraints.constrain(Size(
                  (_inheritedFraction ?? 1) * Resize.adaptiveWidth,
                  childSize.height * (_inheritedFraction ?? 1) * (_width ?? 1),
                ))
              : constraints.constrainSizeAndAttemptToPreserveAspectRatio(
                  Size(
                    constraints.maxWidth,
                    constrainedSize!.height *
                        (_inheritedFraction ?? 1) *
                        (_width ?? 1),
                  ),
                );

      constrainedSize = constraints.constrain(constrainedSize!);

      final double scaleY = constrainedSize!.height / childSize.height;

      child!.layout(
        loosenConstraints.copyWith(
          maxWidth: constrainedSize!.width / (scaleY > 0 ? scaleY : 1),
          maxHeight: constrainedSize!.height / (scaleY > 0 ? scaleY : 1),
        ),
        parentUsesSize: true,
      );
      childSize = child!.size;

      _boxFit1 = BoxFit.cover;

      constrainedSize = constrainedSize!;
    } else {
      constrainedSize =
          constraints.constrainSizeAndAttemptToPreserveAspectRatio(
        Size(
          constrainedSize!.width * (_inheritedFraction ?? 1) * (_width ?? 1),
          constrainedSize!.height * (_inheritedFraction ?? 1) * (_width ?? 1),
        ),
      );
      if (constrainedSize!.width == constraints.maxWidth) {
        if (childSize.width > constraints.maxWidth) {
          // child!.layout(
          //     cachedLoosenConstraints!.copyWith(maxWidth: constraints.maxWidth),
          //     parentUsesSize: true);
          // childSize = child!.size;
          // constrainedSize = constraints.constrain(childSize);
          cachedChildSize = null;
        } else {
          // child!.layout(
          //             cachedLoosenConstraints!.copyWith(maxWidth: constraints.maxWidth),
          //             parentUsesSize: true);
          //         childSize = child!.size;
          //         constrainedSize = constraints.constrain(childSize);

          cachedChildSize = null;
        }
      } else {
        cachedChildSize = null;
      }

      _boxFit1 = BoxFit.cover;
      // cachedChildSize = null;
    }

    size = constrainedSize!;
    _clearPaintData();
  }
}

class MyRenderFittedBoxBase extends RenderProxyBox {
  MyRenderFittedBoxBase({
    required double? width,
    required double? height,
    required bool fitTheShortestSide,
    required double? inheritedFraction,
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
    _constraints = null;
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

  double? _inheritedFraction;
  set inheritedFraction(double? value) {
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
    return super.constraints;
  }

  Size? constrainedSize;
  Size? cachedChildSize;
  BoxConstraints? cachedLoosenConstraints;

  @override
  set child(RenderBox? value) {
    cachedLoosenConstraints = null;
    super.child = value;
  }

  @override
  // TODO: implement isRepaintBoundary
  bool get isRepaintBoundary => super.isRepaintBoundary;

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

      // final double scaleX = constrainedSize!.width / childSize.width;
      // final double scaleY = constrainedSize!.height / childSize.height;

      final Rect sourceRect =
          Alignment.center.inscribe(childSize, Offset.zero & childSize);
      final Rect destinationRect =
          Alignment.center.inscribe(constrainedSize!, Offset.zero & size);
      _hasVisualOverflow = sourceRect.width.toInt() < childSize.width.toInt() ||
          sourceRect.height.toInt() < childSize.height.toInt();
      // assert(!_hasVisualOverflow);
      // // if (_hasVisualOverflow!) {
      // //   print("_hasVisualOverflow");
      // // }

      // _transform = Matrix4.translationValues(
      //     destinationRect.left, destinationRect.top, 0.0)
      //   ..scale(scaleX, scaleY, 1.0)
      //   // ..translate(-sourceRect.left, -sourceRect.top)
      //   ;

      _transform = Matrix4.identity()..scale(scaleX, scaleY, 1.0)
          // ..translate(-sourceRect.left, -sourceRect.top)
          ;
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
      throw Exception('******* has visual over flow *****');
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
