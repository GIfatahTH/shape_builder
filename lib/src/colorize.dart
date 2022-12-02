import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'gradient_color.dart';

class Colorize extends SingleChildRenderObjectWidget {
  /// Creates a widget that paints its area with the specified [Color].
  ///
  /// The [color] parameter must not be null.
  const Colorize({required this.color, super.child, super.key});

  /// The color to paint the background area with.
  final Color? color;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderColoredBox(color: color, buildContext: context);
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    (renderObject as _RenderColoredBox).color = color;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Color>('color', color));
  }
}

class _RenderColoredBox extends RenderProxyBoxWithHitTestBehavior {
  _RenderColoredBox({required Color? color, required this.buildContext})
      : _color = color,
        super(behavior: HitTestBehavior.opaque);
  final BuildContext buildContext;

  /// The fill color for this render object.
  ///
  /// This parameter must not be null.
  Color? get color => _color;
  Color? _color;
  set color(Color? value) {
    if (value == _color) {
      return;
    }
    _color = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final color = _color ?? Theme.of(buildContext).colorScheme.primary;
    if (size > Size.zero) {
      context.canvas.drawRect(
        offset & size,
        () {
          if (_color is ColorWithGradient) {
            return Paint()
              ..shader = (color as ColorWithGradient).gradient.createShader(
                    offset & size,
                  );
          }
          return Paint()..color = color;
        }(),
      );
    }
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
