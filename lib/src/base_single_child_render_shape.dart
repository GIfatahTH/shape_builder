part of 'base_render_shape.dart';

class _BaseSingleChildRenderObjectShape extends SingleChildRenderObjectWidget {
  final Color? color;
  final double? width, height, squareSide;

  final List<BoxShadow> shadow;
  final Clip clipBehavior;
  final bool clipShrink;
  final bool isOverlay;
  final AlignmentGeometry alignment;
  final DecorationImage? decorationImage = null;
  final Size? imageSize;
  final PaintStyle? paintStyle;
  _BaseSingleChildRenderObjectShape({
    required this.color,
    required this.width,
    required this.height,
    required this.squareSide,
    required this.shadow,
    required this.isOverlay,
    required this.clipBehavior,
    required this.clipShrink,
    required this.alignment,
    required this.paintStyle,
    required Widget? child,
    required super.key,
  })  : imageSize = child is Image && clipBehavior != Clip.none
            ? Size((child).width ?? -1, child.height ?? -1)
            : null,
        super(
          child: child is Image
              ? Image(
                  image: child.image,
                  alignment: alignment,
                  centerSlice: child.centerSlice,
                  color: child.color,
                  colorBlendMode: child.colorBlendMode,
                  errorBuilder: child.errorBuilder,
                  excludeFromSemantics: child.excludeFromSemantics,
                  filterQuality: child.filterQuality,
                  fit: child.fit,
                  frameBuilder: child.frameBuilder,
                  gaplessPlayback: child.gaplessPlayback,
                  height: child.height,
                  isAntiAlias: child.isAntiAlias,
                  key: child.key,
                  loadingBuilder: child.loadingBuilder,
                  matchTextDirection: child.matchTextDirection,
                  opacity: child.opacity,
                  repeat: child.repeat,
                  semanticLabel: child.semanticLabel,
                  width: child.width,
                )
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
      ..clipShrink = clipShrink
      ..isOverlay = isOverlay
      ..boxShadow = shadow
      ..decorationImage = decorationImage
      ..alignment = alignment
      ..imageSize = imageSize
      ..paintStyle = paintStyle;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Color>('color', color));
    properties.add(DiagnosticsProperty<double?>('width', width));
    properties.add(DiagnosticsProperty<double?>('height', height));
    properties.add(DiagnosticsProperty<List<BoxShadow>>('shadow', shadow));
    properties.add(DiagnosticsProperty<bool>('clipShrink', clipShrink));
    properties.add(DiagnosticsProperty<Clip>('clipBehavior', clipBehavior));
    properties
        .add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment));
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    throw UnimplementedError();
  }
}
