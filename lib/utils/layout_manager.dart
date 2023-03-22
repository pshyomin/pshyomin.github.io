import 'package:flutter/material.dart';

class LayoutManager {
  final MediaQueryData mediaQueryData;
  double? width;
  double? height;
  double? topPadding;

  LayoutManager(this.mediaQueryData) {
    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;
    topPadding = mediaQueryData.padding.top;
  }

  getWidth(value) => width! * value;
  getHeight(value) => height! * value;
  getLayoutHeight(value) => (height! - topPadding!).abs() * value;
}
