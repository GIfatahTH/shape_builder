import 'package:flutter/material.dart';

import 'inherited_size.dart';
import 'scaffold_inherited_layout.dart';

class InheritedLayout extends StatelessWidget {
  const InheritedLayout({
    Key? key,
    required this.builder,
    this.inheritedWidth,
  }) : super(key: key);
  final Widget Function(BuildContext, InheritedSize) builder;
  final double? inheritedWidth;
  static double _scaleFactor = 1.0;
  static double get scaleFactor => _scaleFactor;
  static set scaleFactor(double v) {
    _scaleFactor = v;
  }

  static InheritedSize of(BuildContext context) {
    _InheritedLayoutWidget? r =
        context.dependOnInheritedWidgetOfExactType<_InheritedLayoutWidget>();
    if (r == null) {
      return ScaffoldInheritedLayout.of(context);
    }

    return InheritedSize(
      r.size.width,
      r.size.height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return _InheritedLayoutWidget(
          size: InheritedSize(
            inheritedWidth ?? constraints.maxWidth,
            constraints.maxHeight,
          ),
          context: context,
          child: Builder(
            builder: (context) {
              final size = of(context);
              return builder(context, size);
            },
          ),
        );
      },
    );
  }
}

class _InheritedLayoutWidget extends InheritedWidget {
  const _InheritedLayoutWidget({
    required super.child,
    required this.size,
    required this.context,
  }) : super();
  final InheritedSize size;
  final BuildContext context;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
