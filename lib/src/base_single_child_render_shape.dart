part of 'base_render_shape.dart';

class _BaseSingleChildRenderObjectShape extends SingleChildRenderObjectWidget {
  final Color? color;
  final double? width, height, squareSide;

  final List<BoxShadow> shadow;
  final Clip clipBehavior;
  final bool isOverlay;
  final AlignmentGeometry alignment;
  final DecorationImage? decorationImage = null;
  final bool isTightConstraint;
  final PaintStyle? paintStyle;
  _BaseSingleChildRenderObjectShape({
    required this.color,
    required this.width,
    required this.height,
    required this.squareSide,
    required this.shadow,
    required this.isOverlay,
    required this.clipBehavior,
    required this.alignment,
    required this.paintStyle,
    required Widget? child,
    required super.key,
  })  : isTightConstraint = child is Image && clipBehavior != Clip.none,
        super(
          child: child is Image
              ? child
              : child != null
                  ? Align(
                      widthFactor: 1,
                      heightFactor: 1,
                      alignment: alignment,
                      child: child,
                    )
                  : null,
        );

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    (renderObject as _BaseRenderShape)
      ..color = color
      ..width = width
      ..height = height
      ..clipBehavior = clipBehavior
      ..isOverlay = isOverlay
      ..boxShadow = shadow
      ..decorationImage = decorationImage
      ..alignment = alignment
      ..isTightConstraint = isTightConstraint
      ..paintStyle = paintStyle;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Color>('color', color));
    properties.add(DiagnosticsProperty<double?>('width', width));
    properties.add(DiagnosticsProperty<double?>('height', height));
    properties.add(DiagnosticsProperty<List<BoxShadow>>('shadow', shadow));
    properties.add(DiagnosticsProperty<Clip>('clipBehavior', clipBehavior));
    properties
        .add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment));
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    throw UnimplementedError();
  }
}
