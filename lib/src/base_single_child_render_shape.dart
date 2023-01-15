part of 'base_render_shape.dart';

bool shouldExpandImage(Widget? child, double? width, double? height) {
  if (child is! Image) return false;
  if (child.width == null && width == null ||
      child.height == null && height == null) {
    return false;
  }
  return child.width != null || child.height != null;
}

Widget _wrapWithImage(Image child, AlignmentGeometry alignment) => Image(
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
    );

// Widget _wrapWithInkWell(InkWell inkWell, Widget child, double? width,
//     double? height, AlignmentGeometry alignment) {
//   final ink = InkResponse(
//     containedInkWell: true,
//     highlightShape: BoxShape.rectangle,
//     key: inkWell.key,
//     onTap: inkWell.onTap,
//     onTapDown: inkWell.onTapDown,
//     onTapUp: inkWell.onTapUp,
//     onTapCancel: inkWell.onTapCancel,
//     onDoubleTap: inkWell.onDoubleTap,
//     onLongPress: inkWell.onLongPress,
//     onHighlightChanged: inkWell.onHighlightChanged,
//     onHover: inkWell.onHover,
//     mouseCursor: inkWell.mouseCursor,
//     radius: inkWell.radius,
//     borderRadius: inkWell.borderRadius,
//     customBorder: inkWell.customBorder,
//     focusColor: inkWell.focusColor,
//     hoverColor: inkWell.hoverColor,
//     highlightColor: inkWell.highlightColor,
//     overlayColor: inkWell.overlayColor,
//     splashColor: inkWell.splashColor,
//     splashFactory: inkWell.splashFactory,
//     enableFeedback: inkWell.enableFeedback,
//     excludeFromSemantics: inkWell.excludeFromSemantics,
//     focusNode: inkWell.focusNode,
//     canRequestFocus: inkWell.canRequestFocus,
//     onFocusChange: inkWell.onFocusChange,
//     autofocus: inkWell.autofocus,
//     statesController: inkWell.statesController,
//     child: child is Image
//         ? null
//         : Align(
//             widthFactor: 1,
//             heightFactor: 1,
//             alignment: alignment,
//             child: child,
//           ),
//   );
//   return Material(
//     type: MaterialType.transparency,
//     child: ConstrainedBox(
//       constraints: BoxConstraints(
//         minWidth: width ?? 0.0,
//         minHeight: height ?? 0.0,
//       ),
//       child: child is Image
//           ? Builder(
//               builder: (context) {
//                 return Ink.image(
//                   image: child.image,
//                   fit: child.fit,
//                   centerSlice: child.centerSlice,
//                   alignment: alignment,
//                   width: child.width,
//                   height: child.height,
//                   repeat: child.repeat,
//                   onImageError: child.errorBuilder != null
//                       ? (e, s) => child.errorBuilder!(context, e, s)
//                       : null,
//                   child: ink,
//                 );
//               },
//             )
//           : ink,
//     ),
//   );
// }

class _BaseSingleChildRenderObjectShape extends SingleChildRenderObjectWidget {
  final Color? color;
  final double? width, height, squareSide;
  final bool shouldExpand;

  final List<BoxShadow> shadow;
  final Clip clipBehavior;
  final bool shrinkToClippedSize;
  final bool childIsInTheForeground;
  final AlignmentGeometry alignment;
  final DecorationImage? decorationImage = null;
  final Size? imageSize;
  final PaintStyle? paintStyle;
  final bool isConstraintTransparent;
  final InkWell? inkWell;
  _BaseSingleChildRenderObjectShape({
    required this.color,
    required this.width,
    required this.height,
    required this.squareSide,
    required this.shouldExpand,
    required this.shadow,
    required this.childIsInTheForeground,
    required this.clipBehavior,
    required this.shrinkToClippedSize,
    required this.alignment,
    required this.paintStyle,
    required Widget? child,
    required this.isConstraintTransparent,
    required super.key,
    this.inkWell,
  })  : imageSize = child is Image && clipBehavior != Clip.none
            ? Size((child).width ?? -1, child.height ?? -1)
            : null,
        super(
          child: isConstraintTransparent
              ? child
              : child is Image
                  ? _wrapWithImage(child, alignment)
                  : child != null
                      ? Align(
                          widthFactor: 1,
                          heightFactor: 1,
                          alignment: alignment,
                          child: child,
                        )
                      : const SizedBox.shrink(),
        );

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    (renderObject as _BaseRenderShape)
      ..color = color
      ..width = width
      ..height = height
      ..shouldExpand = shouldExpand
      ..clipBehavior = clipBehavior
      ..shrinkToClippedSize = shrinkToClippedSize
      ..childIsInTheForeground = childIsInTheForeground
      ..boxShadow = shadow
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
    properties.add(
        DiagnosticsProperty<bool>('shrinkToClippedSize', shrinkToClippedSize));
    properties.add(DiagnosticsProperty<Clip>('clipBehavior', clipBehavior));
    properties
        .add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment));
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    throw UnimplementedError();
  }
}
