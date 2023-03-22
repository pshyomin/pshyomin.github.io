import 'package:flutter/material.dart';

class LayoutManager {
  //미디어 쿼리
  MediaQueryData? mediaQueryData;
  //화면 width 사이즈
  double? width;
  //화면 height 사이즈
  double? height;
  //top Padding 값
  double? topPadding;

  LayoutManager(this.mediaQueryData) {
    if (mediaQueryData != null) {
      width = mediaQueryData!.size.width;
      height = mediaQueryData!.size.height;
      topPadding = mediaQueryData!.padding.top;
    } else {
      width = 360;
      height = 640;
      topPadding = 7;
    }
  }

  getWidth(value) => width! * value;
  getHeight(value) => height! * value;
  getLayoutHeight(value) => (height! - topPadding!).abs() * value;
}
