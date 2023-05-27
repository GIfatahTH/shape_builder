part of 'base_render_shape.dart';

class _ShapeBuilderWithInkWell extends ShapeBuilder {
  _ShapeBuilderWithInkWell({
    required super.color,
    required super.alignment,
    required super.child,
    required super.shadow,
    required super.clipBehavior,
    required super.shrinkToClippedSize,
    required super.childIsInTheForeground,
    required super.shouldExpand,
    required super.paintStyle,
    required super.fit,
  });

  ShapeBuilder inkWell(InkWell inkWell) {
    _inkWell = inkWell;
    return this;
  }
}

class ShapeBuilder {
  final Color? color;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Widget child;
  final List<BoxShadow> shadow;
  final PaintStyle? paintStyle;
  final Clip clipBehavior;
  final bool shrinkToClippedSize;
  final bool shouldExpand;
  final bool childIsInTheForeground;
  ShapeBuilder({
    required this.color,
    required this.alignment,
    required this.child,
    required this.shadow,
    required this.clipBehavior,
    required this.shrinkToClippedSize,
    required this.childIsInTheForeground,
    required this.shouldExpand,
    required this.paintStyle,
    required this.fit,
  });

  InkWell? _inkWell;

  /// Build a Widget
  Widget build(Widget widget) {
    if (fit != BoxFit.none) {
      // TODO
    }
    var firstChild = childIsInTheForeground ? widget : child;
    var secondChild = !childIsInTheForeground ? widget : child;
    if (_inkWell != null) {
      if (childIsInTheForeground) {
        firstChild = MyStack(
          children: [
            firstChild,
            _wrapWithInkWell(_inkWell!),
          ],
        );
      } else {
        secondChild = MyStack(
          children: [
            secondChild,
            _wrapWithInkWell(_inkWell!),
          ],
        );
      }
    }
    return MyStack(
      alignment: alignment,
      isLastPositioned: false,
      children: [
        firstChild,
        secondChild,
      ],
    );
  }

  Widget buildRect({
    double? width,
    double? height,
  }) {
    return Rectangle(
      color: color,
      boxShadow: shadow,
      width: width,
      height: height,
      shouldExpand: shouldExpand,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      alignment: alignment,
      paintStyle: paintStyle,
      inkWell: _inkWell,
      fit: fit,
      child: child,
    );
  }

  Widget buildSquare([double? side]) {
    return Rectangle.square(
      side: side,
      shouldExpand: shouldExpand,
      alignment: alignment,
      boxShadow: shadow,
      color: color,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      paintStyle: paintStyle,
      inkWell: _inkWell,
      fit: fit,
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
      shouldExpand: shouldExpand,
      boxShadow: shadow,
      alignment: alignment,
      color: color,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      paintStyle: paintStyle,
      inkWell: _inkWell,
      fit: fit,
      child: child,
    );
  }

  Widget buildRSquare({
    BorderRadiusGeometry? borderRadius,
    double? side,
    BorderRadiusGeometry? outerHBorderRadius,
    BorderRadiusGeometry? outerVBorderRadius,
  }) {
    return RRectangle.square(
      borderRadius: borderRadius,
      outerHBorderRadius: outerHBorderRadius,
      outerVBorderRadius: outerVBorderRadius,
      side: side,
      shouldExpand: shouldExpand,
      boxShadow: shadow,
      alignment: alignment,
      color: color,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      paintStyle: paintStyle,
      inkWell: _inkWell,
      fit: fit,
      child: child,
    );
  }

  Widget buildCapsule({double? height, double? width}) {
    return RRectangle.capsule(
      height: height,
      width: width,
      shouldExpand: shouldExpand,
      alignment: alignment,
      boxShadow: shadow,
      color: color,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      paintStyle: paintStyle,
      inkWell: _inkWell,
      fit: fit,
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
      shouldExpand: shouldExpand,
      startAngle: startAngle,
      swipeAngle: swipeAngle,
      shouldClosePathToCenter: shouldClosePathToCenter,
      boxShadow: shadow,
      alignment: alignment,
      color: color,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      paintStyle: paintStyle,
      inkWell: _inkWell,
      fit: fit,
      child: child,
    );
  }

  Widget buildCircle({
    double? radius,
    double? startAngle,
    double? swipeAngle,
    bool? shouldClosePathToCenter,
  }) {
    return Oval.circle(
      radius: radius,
      shouldExpand: shouldExpand,
      startAngle: startAngle,
      swipeAngle: swipeAngle,
      shouldClosePathToCenter: shouldClosePathToCenter,
      boxShadow: shadow,
      alignment: alignment,
      color: color,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      childIsInTheForeground: childIsInTheForeground,
      paintStyle: paintStyle,
      inkWell: _inkWell,
      fit: fit,
      child: child,
    );
  }
}

extension ShapeBuilderX on Widget {
  /// Draw the shape in the background
  ///
  /// Alignment parameter align the foreground Widget with respect to
  /// the background widget
  _ShapeBuilderWithInkWell background({
    Color? color,
    AlignmentGeometry? alignment,
    List<BoxShadow> boxShadow = const [],
    Clip clipBehavior = Clip.none,
    bool shrinkToClippedSize = true,
    bool shouldExpand = false,
    PaintStyle? paintStyle,
    BoxFit fit = BoxFit.none,
  }) {
    return _ShapeBuilderWithInkWell(
      shadow: boxShadow,
      alignment: alignment ?? Alignment.center,
      color: color,
      child: this,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      shouldExpand: shouldExpand,
      paintStyle: paintStyle,
      childIsInTheForeground: true,
      fit: fit,
    );
  }

  /// Draw the shape on the foreground
  ///
  /// Alignment parameter align the foreground Widget with respect to
  /// the background widget
  _ShapeBuilderWithInkWell foreground({
    Color? color,
    AlignmentGeometry? alignment,
    double elevation = 0.0,
    List<BoxShadow> boxShadow = const [],
    Color? shadowColor,
    Clip clipBehavior = Clip.none,
    bool shrinkToClippedSize = true,
    bool shouldExpand = false,
    PaintStyle? paintStyle,
    BoxFit fit = BoxFit.none,
  }) {
    return _ShapeBuilderWithInkWell(
      shadow: boxShadow,
      alignment: alignment ?? Alignment.center,
      color: color,
      child: this,
      clipBehavior: clipBehavior,
      shrinkToClippedSize: shrinkToClippedSize,
      shouldExpand: shouldExpand,
      childIsInTheForeground: false,
      paintStyle: paintStyle,
      fit: fit,
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

  _Padding get paddingInsets => _Padding(child: this);
  _PaddingDirectional get paddingDirectional =>
      _PaddingDirectional(child: this);
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
