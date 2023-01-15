part of 'base_render_shape.dart';

/// {@macro rectangle}
class Rectangle extends _BaseSingleChildRenderObjectShape {
  Rectangle._({
    super.squareSide,
    super.color,
    super.width,
    super.height,
    required super.shouldExpand,
    super.child,
    super.shadow = const [],
    super.childIsInTheForeground = true,
    super.clipBehavior = Clip.none,
    super.shrinkToClippedSize = true,
    super.alignment = Alignment.center,
    required super.paintStyle,
    super.isConstraintTransparent = false,
    super.inkWell,
    super.key,
  });

  /// Similar to [Rectangle] but it draws a square of side equal to the give
  /// `side` parameter
  ///
  ///
  static Widget square({
    double? side,
    //
    bool shouldExpand = false,
    Color? color,
    List<BoxShadow> boxShadow = const [],
    PaintStyle? paintStyle,
    //
    Widget? child,
    AlignmentGeometry alignment = Alignment.center,
    bool childIsInTheForeground = true,
    //
    Clip clipBehavior = Clip.none,
    bool shrinkToClippedSize = true,
    InkWell? inkWell,
    Key? key,
  }) {
    final expandImage = shouldExpandImage(child, side, side);

    final widget = Rectangle._(
      key: key,
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
      // inkWell: inkWell,
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
          Rectangle._(
            key: key,
            color: Colors.transparent,
            width: side,
            height: side,
            squareSide: side ?? -1,
            shouldExpand: false,
            clipBehavior: Clip.antiAlias,
            paintStyle: paintStyle,
            child: _wrapWithInkWell(inkWell),
          )
        ],
      );
    }
    return c;
  }

  /// {@template rectangle}
  /// A Rectangle shape.
  ///
  /// See: [Rectangle.square], [RRectangle] and [Oval]

  /// ## Shape layout
  /// shapes trie to size itself, in the following order:
  /// * to honor the `width`, `height`,
  /// * to be as big as possible if the parameter `shouldExpand` is set to true,
  /// (FILL PARENT),
  /// * to ba as small as it child if the latter is defined (WRAP CHILD),
  /// * to be as small as possible.
  ///
  /// ## Color, gradient and shadow of the Shapes
  /// * The color defaults to Primary color.
  /// * To use gradient set the color property to [ColorWithGradient] .
  ///
  /// Example:
  ///   ```dart
  ///    return Rectangle(
  ///       color: ColorWithGradient(
  ///        const LinearGradient(
  ///           colors: [Colors.blue, Colors.red],
  ///         ),
  ///       ),
  ///      );
  ///   ```
  /// * To set A shadow use the boxShadow parameters which is similar to
  /// Flutter's [BoxShadow].
  ///
  /// Also you can use [BoxShadowWithElevation] to simply set a shadow defining
  /// its elevation and color .
  ///
  /// Example:
  ///   ```dart
  ///    return Rectangle(
  ///             width: 100,
  ///             height: 80,
  ///             boxShadow: BoxShadowWithElevation(3),
  ///      );
  ///   ```
  /// ## Painting Style
  /// You can define the style to use when drawing Shapes by defining the
  /// [paintStyle] parameter.
  ///
  /// Example:
  ///  ```
  ///   return Rectangle(
  ///     paintStyle: PaintStyle(
  ///       style: PaintingStyle.stroke,
  ///       strokeWidth: 4,
  ///     ),
  ///     width: 100,
  ///     height: 80,
  ///   );
  ///  ```
  /// ## child, alignment and overlay
  /// Use the [child] parameter to define the Widget to be displayed inside the
  /// shape and align it using the alignment parameter.
  ///
  /// By default the the child is displayed if the foreground of the shape. But
  /// if you set [childIsInTheForeground] parameter to false, the child is displayed in the
  /// background
  ///
  /// ## Clip the chid
  /// Use clipBehavior parameter to clip the child to the shape.
  ///
  /// {@endtemplate}
  factory Rectangle({
    double? width,
    double? height,
    //
    bool shouldExpand = false,
    Color? color,
    List<BoxShadow> boxShadow = const [],
    PaintStyle? paintStyle,
    //
    Widget? child,
    AlignmentGeometry alignment = Alignment.center,
    bool childIsInTheForeground = true,
    //
    Clip clipBehavior = Clip.none,
    bool shrinkToClippedSize = true,
    InkWell? inkWell,
    Key? key,
  }) {
    final expandImage = shouldExpandImage(child, width, height);

    final widget = Rectangle._(
      key: key,
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
      // inkWell: inkWell,
      child: child,
    );

    final c = expandImage
        ? Rectangle._(
            isConstraintTransparent: true,
            shouldExpand: false,
            shrinkToClippedSize: false,
            paintStyle: null,
            color: Colors.transparent,
            child: SizedBox(
              width: shouldExpand ? (child as Image).width : null,
              child: FittedBox(
                child: widget,
              ),
            ),
          )
        : widget;

    if (inkWell != null) {
      return Rectangle._(
        isConstraintTransparent: true,
        shouldExpand: false,
        shrinkToClippedSize: false,
        paintStyle: null,
        color: Colors.transparent,
        child: MyStack(
          children: [
            c,
            Rectangle._(
              key: key,
              color: Colors.transparent,
              width: width,
              height: height,
              shouldExpand: false,
              paintStyle: paintStyle,
              child: _wrapWithInkWell(inkWell),
            )
          ],
        ),
      );
    }
    return c;
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderRectangle(
      color: color,
      boxShadow: shadow,
      width: width,
      height: height,
      squareSide: squareSide,
      shouldExpand: shouldExpand,
      buildContext: context,
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
    (renderObject as _RenderRectangle).squareSide = squareSide;
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);

  // }
}

class _RenderRectangle extends _BaseRenderShape {
  _RenderRectangle({
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
  });

  // double? _squareSide;
  // set squareSide(double? value) {
  //   if (value == _squareSide) {
  //     return;
  //   }
  //   _squareSide = value;
  //   resetPainters();
  //   markNeedsPaint();
  // }

  @override
  Rect? getRectToPain(Rect rect) {
    return rect.inflate(0.5);
  }

  @override
  RRect? getRRectToPaint(Rect rect) {
    return null;
  }

  @override
  Path? getPathToPaint(Rect rec, Offset offset, bool shouldClosePath) {
    return null;
  }

  @override
  Rect? getCircleToPaint(Object rect) {
    return null;
  }
}
