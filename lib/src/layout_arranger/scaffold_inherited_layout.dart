import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'inherited_layout.dart';
import 'inherited_size.dart';
import 'query.dart';

class ScaffoldInheritedLayout extends StatelessWidget {
  factory ScaffoldInheritedLayout.singleChildScrollView({
    Key? key,
    required Widget Function(BuildContext, InheritedSize) builder,

    /// Should be the same as [Scaffold.resizeToAvoidBottomInset].
    bool resizeToAvoidBottomInset = true,

    /// Should be the same as [SingleChildScrollView.physics].
    final ScrollPhysics? physics,
  }) {
    return ScaffoldInheritedLayout(
      builder: (context, size) => _SingleChildScrollViewHolder(
        mediaQuery: MediaQuery.of(context),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        physics: physics,
        child: builder(context, size),
      ),
      key: key,
    );
  }
  const ScaffoldInheritedLayout({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final Widget Function(BuildContext, InheritedSize) builder;

  static final List<Query> _query = [];
  static set query(List<Query> qs) {
    for (var i = 0; i < qs.length; i++) {
      final q = qs[i];
      if (i == 0) {
        _query.add(q);
      } else {
        final lastQ = _query[i - 1];
        _query.add(
          Query.internal(
            step: q.step,
            scale: q.scale,
            isLinear: q.isLinear,
            y0: lastQ.step,
            w0: lastQ.fn(lastQ.step, lastQ),
          ),
        );
      }

      if (i == qs.length - 1) {
        final q = _query[i];

        _query.add(
          Query.internal(
            step: double.infinity,
            scale: 1,
            y0: q.step,
            isLinear: true,
            w0: q.fn(q.step, q),
          ),
        );
      }
    }
  }

  static InheritedSize of(BuildContext context) {
    _ScaffoldInheritedLayoutWidget? r = context
        .dependOnInheritedWidgetOfExactType<_ScaffoldInheritedLayoutWidget>();

    assert(r != null);

    bool isLandscape = (Platform.isAndroid || Platform.isIOS) &&
        MediaQuery.of(context).orientation == Orientation.landscape;
    var width = isLandscape ? r!.size.height : r!.size.width;
    final height = isLandscape ? r.size.width : r.size.height;

    if (_query.isNotEmpty) {
      for (var i = 0; i < _query.length; i++) {
        final q = _query[i];

        if (width < q.step) {
          width = q.fn(width, q);
          break;
        }
      }
    }

    late double newWidth;

    newWidth = screenWidthResized?.call(width) ?? width;

    final size = InheritedSize(
      newWidth,
      screenHeightResized?.call(height) ?? height,
    );
    // final size = InheritedSize(
    //   screenWidthResized != null
    //       ? screenWidthResized!.call(width) ?? width
    //       : width,
    //   screenHeightResized != null
    //       ? screenHeightResized!.call(height) * height
    //       : height,
    // );

    return InheritedSize(
      size.width * InheritedLayout.scaleFactor,
      size.height * InheritedLayout.scaleFactor,
    );
  }

  static double Function(double width)? screenWidthResized;
  static double Function(double height)? screenHeightResized;
  static double adaptiveWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    // assert(Scaffold.maybeOf(context) == null,
    //     'ScaffoldInheritedLayout must be in top of Scaffold. Also consider to put SafeAria in top of it');
    return LayoutBuilder(
      builder: (context, constraints) {
        return _ScaffoldInheritedLayoutWidget(
          size: InheritedSize(
            constraints.maxWidth,
            constraints.maxHeight,
          ),
          context: context,
          child: Builder(
            builder: (context) {
              final size = of(context);
              adaptiveWidth = size.width;
              return builder(context, size);
            },
          ),
        );
      },
    );
  }
}

class _ScaffoldInheritedLayoutWidget extends InheritedWidget {
  const _ScaffoldInheritedLayoutWidget({
    required super.child,
    required this.size,
    required this.context,
  });
  final InheritedSize size;
  final BuildContext context;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class _SingleChildScrollViewHolder extends StatefulWidget {
  const _SingleChildScrollViewHolder({
    Key? key,
    required this.child,
    required this.mediaQuery,
    required this.resizeToAvoidBottomInset,
    this.physics,
  }) : super(key: key);
  final Widget child;
  final MediaQueryData mediaQuery;

  /// Should be the same as [Scaffold.resizeToAvoidBottomInset].
  final bool resizeToAvoidBottomInset;

  /// Should be the same as [SingleChildScrollView.physics].
  final ScrollPhysics? physics;
  @override
  State<_SingleChildScrollViewHolder> createState() =>
      _SingleChildScrollViewHolderState();
}

class _SingleChildScrollViewHolderState
    extends State<_SingleChildScrollViewHolder> {
  double? maxHeight;
  Size _screenSize = ui.window.physicalSize;

  @override
  void didUpdateWidget(covariant _SingleChildScrollViewHolder oldWidget) {
    if (_screenSize != ui.window.physicalSize) {
      _screenSize = ui.window.physicalSize;
      maxHeight = null;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        maxHeight ??= Platform.isAndroid || Platform.isIOS
            ? widget.mediaQuery.orientation == Orientation.portrait
                ? constraints.maxHeight +
                    // take the keyboard height into account
                    (widget.resizeToAvoidBottomInset
                        ? ui.window.viewInsets.bottom /
                            ui.window.devicePixelRatio
                        : 0)
                : constraints.maxWidth
            : constraints.maxHeight;
        return SingleChildScrollView(
          physics: widget.physics,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxHeight!,
            ),
            child: widget.child,
          ),
        );
      },
    );
    ;
  }
}
