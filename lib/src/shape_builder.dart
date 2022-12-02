// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shape_builder/shape_builder.dart';
import 'package:shape_builder/src/layout_arranger/scaffold_inherited_layout.dart';

import 'base_render_shape.dart';
import 'colorize.dart';
import 'gradient_color.dart';
import 'layout_arranger/fitted_box_render.dart';
import 'paint_style.dart';

class ShapeBuilder {
  final Color? color;
  final AlignmentGeometry alignment;
  final Widget child;
  final List<BoxShadow> shadow;
  final PaintStyle? paintStyle;

  final Clip clipBehavior;
  final bool isOverlay;
  ShapeBuilder({
    required this.color,
    required this.alignment,
    required this.child,
    required this.shadow,
    required this.clipBehavior,
    required this.isOverlay,
    required this.paintStyle,
  });

  /// Build a Widget
  Widget build(Widget widget) {
    if (widget is! Image) {
      widget = Align(alignment: alignment, child: widget);
    }
    if (!isOverlay) {
      return Stack(
        alignment: alignment,
        children: [
          child is Image ? SizedBox.expand(child: child) : child,
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: widget,
          ),
        ],
      );
    }
    return Stack(
      alignment: alignment,
      fit: StackFit.loose,
      children: [
        widget,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Align(
            widthFactor: 1,
            heightFactor: 1,
            alignment: alignment,
            child: widget,
          ),
        ),
      ],
    );
  }

  Rectangle buildRect({
    double? width,
    double? height,
  }) {
    return Rectangle(
      width: width,
      height: height,
      alignment: alignment,
      boxShadow: shadow,
      color: color,
      clipBehavior: clipBehavior,
      isOverlay: isOverlay,
      paintStyle: paintStyle,
      child: child,
    );
  }

  Rectangle buildSquare([double? side]) {
    return Rectangle.square(
      side: side,
      alignment: alignment,
      boxShadow: shadow,
      color: color,
      clipBehavior: clipBehavior,
      isOverlay: isOverlay,
      paintStyle: paintStyle,
      child: child,
    );
  }

  RRectangle buildRRect(
      {BorderRadiusGeometry? borderRadius,
      BorderRadiusGeometry? outerHBorderRadius,
      BorderRadiusGeometry? outerVBorderRadius,
      double? height,
      double? width}) {
    return RRectangle(
      borderRadius: borderRadius,
      outerHBorderRadius: outerHBorderRadius,
      outerVBorderRadius: outerVBorderRadius,
      height: height,
      width: width,
      boxShadow: shadow,
      alignment: alignment,
      color: color,
      clipBehavior: clipBehavior,
      isOverlay: isOverlay,
      paintStyle: paintStyle,
      child: child,
    );
  }

  RRectangle buildRSquare({BorderRadiusGeometry? borderRadius, double? side}) {
    return RRectangle.square(
      borderRadius: borderRadius,
      side: side,
      boxShadow: shadow,
      alignment: alignment,
      color: color,
      clipBehavior: clipBehavior,
      isOverlay: isOverlay,
      paintStyle: paintStyle,
      child: child,
    );
  }

  RRectangle buildCapsule({double? height, double? width}) {
    return RRectangle.capsule(
      height: height,
      width: width,
      alignment: alignment,
      boxShadow: shadow,
      color: color,
      clipBehavior: clipBehavior,
      isOverlay: isOverlay,
      paintStyle: paintStyle,
      child: child,
    );
  }

  Oval buildOval({
    double? height,
    double? width,
    double? startAngle,
    double? swipeAngle,
    bool? shouldClosePathToCenter,
  }) {
    return Oval(
      height: height,
      width: width,
      startAngle: startAngle,
      swipeAngle: swipeAngle,
      shouldClosePathToCenter: shouldClosePathToCenter,
      boxShadow: shadow,
      alignment: alignment,
      color: color,
      clipBehavior: clipBehavior,
      isOverlay: isOverlay,
      paintStyle: paintStyle,
      child: child,
    );
  }

  Oval buildCircle({
    double? radius,
    double? startAngle,
    double? swipeAngle,
    bool? shouldClosePathToCenter,
  }) {
    return Oval.circle(
      radius: radius,
      startAngle: startAngle,
      swipeAngle: swipeAngle,
      shouldClosePathToCenter: shouldClosePathToCenter,
      boxShadow: shadow,
      alignment: alignment,
      color: color,
      clipBehavior: clipBehavior,
      isOverlay: isOverlay,
      paintStyle: paintStyle,
      child: child,
    );
  }
}

extension ShapeBuilderX on Widget {
  /// Draw the shape in the background
  ///
  /// Alignment parameter align the foreground Widget with respect to
  /// the background widget
  ShapeBuilder background({
    Color? color,
    AlignmentGeometry? alignment,
    List<BoxShadow> boxShadow = const [],
    Clip clipBehavior = Clip.none,
    PaintStyle? paintStyle,
  }) {
    return ShapeBuilder(
      shadow: boxShadow,
      alignment: alignment ?? Alignment.center,
      color: color,
      child: this,
      clipBehavior: clipBehavior,
      paintStyle: paintStyle,
      isOverlay: true,
    );
  }

  /// Draw the shape on the foreground
  ///
  /// Alignment parameter align the foreground Widget with respect to
  /// the background widget
  ShapeBuilder foreground({
    Color? color,
    AlignmentGeometry? alignment,
    double elevation = 0.0,
    List<BoxShadow> shadow = const [],
    Color? shadowColor,
    Clip clipBehavior = Clip.none,
    PaintStyle? paintStyle,
  }) {
    return ShapeBuilder(
      shadow: shadow,
      alignment: alignment ?? Alignment.center,
      color: color,
      child: this,
      clipBehavior: clipBehavior,
      isOverlay: false,
      paintStyle: paintStyle,
    );
  }

  Widget colorize([Color? color]) => Colorize(
        color: color,
        child: this,
      );
  Widget colorizeRandom([int? seed]) => Colorize(
        color:
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.8),
        child: this,
      );

  // if it Flex widget  it is better to set fitTheShortestSide to false
  Resize resize({bool fitTheShortestSide = true}) =>
      Resize(child: this, fitTheShortestSide: fitTheShortestSide, flex: null);
  Widget resizeAdaptive([double? scale]) =>
      Resize(child: this, fitTheShortestSide: true, flex: null).adaptive(scale);

  Widget adaptiveResize(
          {bool fitTheShortestSide = true, double? width, double? height}) =>
      Resize(child: this, fitTheShortestSide: fitTheShortestSide, flex: null)
          .adaptiveTest1(width: width, height: height);

  Widget adaptiveFlexResize(
          {bool fitTheShortestSide = true,
          int flex = 1,
          double? width,
          double? height}) =>
      Resize(child: this, fitTheShortestSide: fitTheShortestSide, flex: flex)
          .adaptiveTest1(width: width, height: height);

  /// This should be the first child of a Flex widget (Column or Row)
  /// Text('').resizeWithFlex().fixed().padding is not allowed
  Resize resizeWithFlex({
    bool fitTheShortestSide = true,
    double flex = 1,
    bool shouldExpand = false,
  }) =>
      Resize(
        child: this,
        fitTheShortestSide: fitTheShortestSide,
        flex: (flex * 10).toInt(),
        shouldExpand: shouldExpand,
      );

  _Padding get padding => _Padding(child: this);
  _PaddingDirectional get paddingDirectional =>
      _PaddingDirectional(child: this);
}

class Resize {
  late final Widget _child;
  final bool _fitTheShortestSide, _shouldExpand;
  final int? _flex;

  static double ofAdaptive(BuildContext context) {
    final inheritedWidth = InheritedLayout.of(context).width / adaptiveWidth;
    return inheritedWidth;
  }

  Resize({
    required Widget child,
    required int? flex,
    required bool fitTheShortestSide,
    bool shouldExpand = false,
  })  : _flex = flex,
        _fitTheShortestSide = fitTheShortestSide,
        _shouldExpand = shouldExpand {
    // if (child is Flex) {
    //   _child = child
    //     ..children.add(
    //       child.direction == Axis.vertical
    //           ? const SizedBox(
    //               width: double.infinity,
    //             )
    //           : const SizedBox(height: double.infinity),
    //     );
    // } else {
    //   _child = child;
    // }
    _child = child;
  }

  static double adaptiveWidth = 500;
  Widget adaptiveTest1({double? width, double? height}) {
    final widget = Builder(builder: (context) {
      final inheritedWidth = InheritedLayout.of(context).width / adaptiveWidth;

      return MyFittedBox(
        width: width != null ? width * inheritedWidth : null,
        height: height != null ? height * inheritedWidth : null,
        fitTheShortestSide: _fitTheShortestSide,
        child: _child,
      );
    });
    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        fit: _shouldExpand ? FlexFit.tight : FlexFit.loose,
        child: widget,
      );
    }
    return widget;
  }

  Widget adaptive([double? scale]) {
    final widget = Builder(
      builder: (context) {
        final inheritedWidth =
            InheritedLayout.of(context).width / adaptiveWidth;

        return MyFittedBox(
          width: scale,
          height: scale,
          fitTheShortestSide: _fitTheShortestSide,
          inheritedFraction: inheritedWidth,
          child: _child,
        );
      },
    );
    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        fit: _shouldExpand ? FlexFit.tight : FlexFit.loose,
        child: widget,
      );
    }
    return widget;
  }

  Widget fixedTest({double? width, double? height}) {
    // if (_child is Flex) {
    //   return SizedBox(
    //     width: width,
    //     height: height,
    //     child: _child,
    //   );
    // }
    final widget = MyFittedBox(
      width: width,
      height: height,
      fitTheShortestSide: _fitTheShortestSide,
      child: _child,
      inheritedFraction: null,
    );
    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        fit: _shouldExpand ? FlexFit.tight : FlexFit.loose,
        child: widget,
      );
    }
    return widget;
  }

  Widget fixed({double? width, double? height}) {
    // if (_child is Flex) {
    //   return SizedBox(
    //     width: width,
    //     height: height,
    //     child: _child,
    //   );
    // }
    final widget = MyFittedBox(
      width: width,
      height: height,
      fitTheShortestSide: _fitTheShortestSide,
      child: _child,
    );
    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        fit: _shouldExpand ? FlexFit.tight : FlexFit.loose,
        child: widget,
      );
    }
    return widget;
  }
// Sizer climp(double? min, double?max){

//   return
// }
  Widget fromEffectiveWidth(double? widthFraction, double? heightFraction) {
    // assert(widthFraction == null || widthFraction >= 0 && widthFraction <= 1);
    // assert(
    //     heightFraction == null || heightFraction >= 0 && heightFraction <= 1);
    final widget = Builder(builder: (context) {
      final inheritedWidth = InheritedLayout.of(context).width;
      print('inheritedWidth: $inheritedWidth');
      return InheritedLayout(
        inheritedWidth: inheritedWidth * (widthFraction ?? 1),
        builder: (context, size) {
          return MyFittedBox(
            width:
                widthFraction != null ? inheritedWidth * widthFraction : null,
            height:
                heightFraction != null ? inheritedWidth * heightFraction : null,
            fitTheShortestSide: _fitTheShortestSide,
            child: _child,
          );
        },
      );
    });

    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        child: widget,
      );
    }
    return widget;
  }

  _FromDevice get fromDevice => _FromDevice(
        child: _child,
        flex: _flex,
        fitTheShortestSide: _fitTheShortestSide,
      );
  _FromParent get fromParent => _FromParent(
        child: _child,
        flex: _flex,
        fitTheShortestSide: _fitTheShortestSide,
      );
}

class _FromDevice {
  final Widget _child;
  final bool _fitTheShortestSide;
  final int? _flex;
  const _FromDevice({
    required Widget child,
    required int? flex,
    required bool fitTheShortestSide,
  })  : _flex = flex,
        _child = child,
        _fitTheShortestSide = fitTheShortestSide;

  Widget width({double? width, double? height}) {
    assert(width == null || width >= 0 && width <= 1);
    assert(height == null || height >= 0 && height <= 1);
    final widget = Builder(builder: (context) {
      final deviceWidth = MediaQuery.of(context).size.width;
      return MyFittedBox(
        width: width != null ? deviceWidth * width : null,
        height: height != null ? deviceWidth * height : null,
        fitTheShortestSide: _fitTheShortestSide,
        child: _child,
      );
    });

    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        child: widget,
      );
    }
    return widget;
  }

  Widget height({double? width, double? height}) {
    assert(width == null || width >= 0 && width <= 1);
    assert(height == null || height >= 0 && height <= 1);
    final widget = Builder(builder: (context) {
      final deviceHeight = MediaQuery.of(context).size.height;
      return MyFittedBox(
        width: width != null ? deviceHeight * width : null,
        height: height != null ? deviceHeight * height : null,
        fitTheShortestSide: _fitTheShortestSide,
        child: _child,
      );
    });
    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        child: widget,
      );
    }
    return widget;
  }

  Widget widthAndHeight({double? width, double? height}) {
    assert(width == null || width >= 0 && width <= 1);
    assert(height == null || height >= 0 && height <= 1);
    final widget = Builder(builder: (context) {
      final deviceWidth = MediaQuery.of(context).size.width;
      final deviceHeight = MediaQuery.of(context).size.height;
      return MyFittedBox(
        width: width != null ? deviceWidth * width : null,
        height: height != null ? deviceHeight * height : null,
        fitTheShortestSide: _fitTheShortestSide,
        child: _child,
      );
    });
    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        child: widget,
      );
    }
    return widget;
  }
}

class _FromParent {
  final Widget _child;
  final bool _fitTheShortestSide;
  final int? _flex;
  const _FromParent({
    required Widget child,
    required int? flex,
    required bool fitTheShortestSide,
  })  : _flex = flex,
        _child = child,
        _fitTheShortestSide = fitTheShortestSide;
  Widget height({double? width, double? height}) {
    // assert(width == null || width >= 0 && width <= 1);
    // assert(height == null || height >= 0 && height <= 1);
    final widget = LayoutBuilder(builder: (context, constraints) {
      final parentHeight = constraints.maxHeight;
      return MyFittedBox(
        width: width != null ? parentHeight * width : null,
        height: height != null ? parentHeight * height : null,
        fitTheShortestSide: _fitTheShortestSide,
        child: _child,
      );
    });

    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        child: widget,
      );
    }
    return widget;
  }

  Widget width({double? width, double? height}) {
    // assert(width == null || width >= 0 && width <= 1);
    // assert(height == null || height >= 0 && height <= 1);
    final widget = LayoutBuilder(builder: (context, constraints) {
      final parentWidth = constraints.maxWidth;
      return MyFittedBox(
        width: width != null ? parentWidth * width : null,
        height: height != null ? parentWidth * height : null,
        fitTheShortestSide: _fitTheShortestSide,
        child: _child,
      );
    });

    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        child: widget,
      );
    }
    return widget;
  }
}

class _Padding {
  final Widget _child;
  // final bool _fitTheShortestSide, _shouldExpand;
  // final int? _flex;

  const _Padding({
    required Widget child,
    // required int? flex,
    // required bool fitTheShortestSide,
    // bool shouldExpand = false,
  }) :
        // _flex = flex,
        _child = child
  // _fitTheShortestSide = fitTheShortestSide,
  // _shouldExpand = shouldExpand
  ;
  Widget all([double value = 8.0]) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: _child,
    );
  }

  Widget horizontal([double value = 8.0]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: _child,
    );
  }

  Widget vertical([double value = 8.0]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: _child,
    );
  }

  Widget symmetric(double horizontal, double vertical) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: _child,
    );
  }

  Widget top([double value = 8.0]) {
    return Padding(
      padding: EdgeInsets.only(top: value),
      child: _child,
    );
  }

  Widget left([double value = 8.0]) {
    return Padding(
      padding: EdgeInsets.only(left: value),
      child: _child,
    );
  }

  Widget bottom([double value = 8.0]) {
    return Padding(
      padding: EdgeInsets.only(bottom: value),
      child: _child,
    );
  }

  Widget right([double value = 8.0]) {
    return Padding(
      padding: EdgeInsets.only(right: value),
      child: _child,
    );
  }

  Widget only(
      {double top = 0.0,
      double left = 0.0,
      double bottom = 0.0,
      double right = 0.0}) {
    return Padding(
      padding:
          EdgeInsets.only(right: right, top: top, left: left, bottom: bottom),
      child: _child,
    );
  }

  Widget fromLTRB(double left, double top, double bottom, double right) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: _child,
    );
  }
}

class _PaddingDirectional {
  final Widget _child;
  // final bool _fitTheShortestSide, _shouldExpand;
  // final int? _flex;

  const _PaddingDirectional({
    required Widget child,
    // required int? flex,
    // required bool fitTheShortestSide,
    // bool shouldExpand = false,
  }) :
        // _flex = flex,
        _child = child
  // _fitTheShortestSide = fitTheShortestSide,
  // _shouldExpand = shouldExpand
  ;
  Widget all([double value = 8.0]) {
    return Padding(
      padding: EdgeInsetsDirectional.all(value),
      child: _child,
    );
  }

  Widget top([double value = 8.0]) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: value),
      child: _child,
    );
  }

  Widget start([double value = 8.0]) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: value),
      child: _child,
    );
  }

  Widget bottom([double value = 8.0]) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: value),
      child: _child,
    );
  }

  Widget end([double value = 8.0]) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: value),
      child: _child,
    );
  }

  Widget only(
      {double top = 0.0,
      double end = 0.0,
      double bottom = 0.0,
      double start = 0.0}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: start, top: top, end: end, bottom: bottom),
      child: _child,
    );
  }

  Widget fromLTRB(double start, double top, double end, double bottom) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(start, top, end, bottom),
      child: _child,
    );
  }
}
