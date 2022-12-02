part of 'base_render_shape.dart';

class Rectangle extends _BaseSingleChildRenderObjectShape {
  Rectangle._({
    super.squareSide,
    super.color,
    super.width,
    super.height,
    super.child,
    super.shadow = const [],
    super.isOverlay = false,
    super.clipBehavior = Clip.none,
    super.alignment = Alignment.center,
    required super.paintStyle,
    super.key,
  });

  /// Similar to [Rectangle] but it draws a square of side equal to the give
  /// side parameter
  factory Rectangle.square({
    double? side,
    //
    Color? color,
    List<BoxShadow> boxShadow = const [],
    PaintStyle? paintStyle,
    //
    Widget? child,
    AlignmentGeometry alignment = Alignment.center,
    bool isOverlay = true,
    //
    Clip clipBehavior = Clip.none,
    Key? key,
  }) =>
      Rectangle._(
        key: key,
        color: color,
        shadow: boxShadow,
        width: side,
        height: side,
        squareSide: side ?? -1,
        clipBehavior: clipBehavior,
        isOverlay: !isOverlay,
        alignment: alignment,
        paintStyle: paintStyle,
        child: child,
      );

  /// A Rectangle shape.
  ///
  /// See: [Rectangle.square], [RRectangle] and [Oval]
  ///
  /// ## Size of the shape
  /// * If no child is provided, The shape tends to expand to fill the max
  /// constraints imposed by its parent widget (FILL PARENT).
  /// * If child is provided, the shape takes the size of the child
  /// (WRAP CHILD)
  /// * If width or height are provided, the shape fits the given width and
  /// height.
  ///
  /// You can set the width and/or height to double.infinity so that the
  /// shape takes all available space.
  ///
  /// ## Color, gradient and shadow of the Rectangle
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
  ///            boxShadow: BoxShadowWithElevation(3),
  ///      );
  ///   ```
  /// ## Painting Style
  /// You can define the style to use when drawing Shapes by defining the
  /// paintStyle parameter.
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
  /// Use the child parameter to define the Widget to be displayed inside the
  /// shape and align it using the alignment parameter.
  ///
  /// By default the the child is displayed if the foreground of the shape. But
  /// if you set isOverlay parameter to false, the child is displayed in the
  /// background
  ///
  /// ## Clip the chid
  /// Use clipBehavior parameter to clip the child to the shape.
  ///
  factory Rectangle({
    double? width,
    double? height,
    //
    Color? color,
    List<BoxShadow> boxShadow = const [],
    PaintStyle? paintStyle,
    //
    Widget? child,
    AlignmentGeometry alignment = Alignment.center,
    bool isOverlay = true,
    //
    Clip clipBehavior = Clip.none,
    Key? key,
  }) {
    return Rectangle._(
      key: key,
      color: color,
      shadow: boxShadow,
      width: width,
      height: height,
      clipBehavior: clipBehavior,
      isOverlay: !isOverlay,
      alignment: alignment,
      paintStyle: paintStyle,
      child: child,
    );
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderRectangle(
      color: color,
      boxShadow: shadow,
      width: width,
      height: height,
      squareSide: squareSide,
      buildContext: context,
      clipBehavior: clipBehavior,
      isOverlay: isOverlay,
      alignment: alignment,
      decorationImage: decorationImage,
      isTightConstraint: isTightConstraint,
      paintStyle: paintStyle,
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
    required super.color,
    required super.boxShadow,
    required super.clipBehavior,
    required super.buildContext,
    required super.isOverlay,
    required super.alignment,
    required super.decorationImage,
    required super.isTightConstraint,
    required super.paintStyle,
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
