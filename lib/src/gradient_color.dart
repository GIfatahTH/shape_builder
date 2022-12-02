import 'dart:math';

import 'package:flutter/widgets.dart';

/// A class used to set A 2D gradient.
///
class ColorWithGradient extends Color {
  ColorWithGradient(this.gradient, {this.blendMode})
      : super(gradient.colors.first.value);

  /// A 2D gradient.
  ///
  /// This is an interface that allows [LinearGradient], [RadialGradient], and
  /// [SweepGradient] classes.
  final Gradient gradient;

  /// Algorithms to use when painting on the canvas.
  /// See [BlendMode]
  final BlendMode? blendMode;

  @override
  bool operator ==(covariant Color other) {
    if (identical(this, other)) return true;
    if (other is ColorWithGradient) {
      return other.gradient == gradient && other.blendMode == blendMode;
    }
    return false;
  }

  @override
  int get hashCode => gradient.hashCode ^ blendMode.hashCode;
}

class ColorWithBlendMode extends Color {
  ColorWithBlendMode(Color color, this.blendMode) : super(color.value);

  final BlendMode? blendMode;

  @override
  bool operator ==(covariant Color other) {
    if (identical(this, other)) return true;
    if (other is ColorWithBlendMode) {
      return other.value == value && other.blendMode == blendMode;
    }
    return false;
  }

  @override
  int get hashCode => value.hashCode ^ blendMode.hashCode;
}

/// Set a Shadow by defining the elevation and color
class BoxShadowWithElevation implements List<BoxShadow> {
  BoxShadowWithElevation(this.elevation, {Color? color})
      : shadowColor = color,
        first = const BoxShadow(),
        last = const BoxShadow();

  /// The elevation of the shadow
  final double elevation;

  /// The color of the shadow
  final Color? shadowColor;
  @override
  bool operator ==(covariant List<BoxShadow> other) {
    if (identical(this, other)) return true;
    if (other is BoxShadowWithElevation) {
      return other.elevation == elevation && other.shadowColor == shadowColor;
    }
    return false;
  }

  @override
  int get hashCode => elevation.hashCode ^ shadowColor.hashCode;

  @override
  BoxShadow first;

  @override
  BoxShadow last;

  @override
  int length = 1;

  @override
  List<BoxShadow> operator +(List<BoxShadow> other) {
    throw UnimplementedError();
  }

  @override
  BoxShadow operator [](int index) {
    throw UnimplementedError();
  }

  @override
  void operator []=(int index, BoxShadow value) {}

  @override
  void add(BoxShadow value) {}

  @override
  void addAll(Iterable<BoxShadow> iterable) {}

  @override
  bool any(bool Function(BoxShadow element) test) {
    throw UnimplementedError();
  }

  @override
  Map<int, BoxShadow> asMap() {
    throw UnimplementedError();
  }

  @override
  List<R> cast<R>() {
    throw UnimplementedError();
  }

  @override
  void clear() {}

  @override
  bool contains(Object? element) {
    throw UnimplementedError();
  }

  @override
  BoxShadow elementAt(int index) {
    throw UnimplementedError();
  }

  @override
  bool every(bool Function(BoxShadow element) test) {
    throw UnimplementedError();
  }

  @override
  Iterable<T> expand<T>(Iterable<T> Function(BoxShadow element) toElements) {
    throw UnimplementedError();
  }

  @override
  void fillRange(int start, int end, [BoxShadow? fillValue]) {}

  @override
  BoxShadow firstWhere(bool Function(BoxShadow element) test,
      {BoxShadow Function()? orElse}) {
    throw UnimplementedError();
  }

  @override
  T fold<T>(
      T initialValue, T Function(T previousValue, BoxShadow element) combine) {
    throw UnimplementedError();
  }

  @override
  Iterable<BoxShadow> followedBy(Iterable<BoxShadow> other) {
    throw UnimplementedError();
  }

  @override
  void forEach(void Function(BoxShadow element) action) {}

  @override
  Iterable<BoxShadow> getRange(int start, int end) {
    throw UnimplementedError();
  }

  @override
  int indexOf(BoxShadow element, [int start = 0]) {
    throw UnimplementedError();
  }

  @override
  int indexWhere(bool Function(BoxShadow element) test, [int start = 0]) {
    throw UnimplementedError();
  }

  @override
  void insert(int index, BoxShadow element) {}

  @override
  void insertAll(int index, Iterable<BoxShadow> iterable) {}

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  Iterator<BoxShadow> get iterator => throw UnimplementedError();

  @override
  String join([String separator = ""]) {
    throw UnimplementedError();
  }

  @override
  int lastIndexOf(BoxShadow element, [int? start]) {
    throw UnimplementedError();
  }

  @override
  int lastIndexWhere(bool Function(BoxShadow element) test, [int? start]) {
    throw UnimplementedError();
  }

  @override
  BoxShadow lastWhere(bool Function(BoxShadow element) test,
      {BoxShadow Function()? orElse}) {
    throw UnimplementedError();
  }

  @override
  Iterable<T> map<T>(T Function(BoxShadow e) toElement) {
    throw UnimplementedError();
  }

  @override
  BoxShadow reduce(
      BoxShadow Function(BoxShadow value, BoxShadow element) combine) {
    throw UnimplementedError();
  }

  @override
  bool remove(Object? value) {
    throw UnimplementedError();
  }

  @override
  BoxShadow removeAt(int index) {
    throw UnimplementedError();
  }

  @override
  BoxShadow removeLast() {
    throw UnimplementedError();
  }

  @override
  void removeRange(int start, int end) {}

  @override
  void removeWhere(bool Function(BoxShadow element) test) {}

  @override
  void replaceRange(int start, int end, Iterable<BoxShadow> replacements) {}

  @override
  void retainWhere(bool Function(BoxShadow element) test) {}

  @override
  Iterable<BoxShadow> get reversed => throw UnimplementedError();

  @override
  void setAll(int index, Iterable<BoxShadow> iterable) {}

  @override
  void setRange(int start, int end, Iterable<BoxShadow> iterable,
      [int skipCount = 0]) {}

  @override
  void shuffle([Random? random]) {}

  @override
  BoxShadow get single => throw UnimplementedError();

  @override
  BoxShadow singleWhere(bool Function(BoxShadow element) test,
      {BoxShadow Function()? orElse}) {
    throw UnimplementedError();
  }

  @override
  Iterable<BoxShadow> skip(int count) {
    throw UnimplementedError();
  }

  @override
  Iterable<BoxShadow> skipWhile(bool Function(BoxShadow value) test) {
    throw UnimplementedError();
  }

  @override
  void sort([int Function(BoxShadow a, BoxShadow b)? compare]) {}

  @override
  List<BoxShadow> sublist(int start, [int? end]) {
    throw UnimplementedError();
  }

  @override
  Iterable<BoxShadow> take(int count) {
    throw UnimplementedError();
  }

  @override
  Iterable<BoxShadow> takeWhile(bool Function(BoxShadow value) test) {
    throw UnimplementedError();
  }

  @override
  List<BoxShadow> toList({bool growable = true}) {
    throw UnimplementedError();
  }

  @override
  Set<BoxShadow> toSet() {
    throw UnimplementedError();
  }

  @override
  Iterable<BoxShadow> where(bool Function(BoxShadow element) test) {
    throw UnimplementedError();
  }

  @override
  Iterable<T> whereType<T>() {
    throw UnimplementedError();
  }
}
