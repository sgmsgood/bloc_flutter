import 'package:flutter/material.dart';

class ScreenSizeProvider {
  Size _screenSize = Size(360, 640);
  double _zeplinHeightRatio = 1.0;
  double _zeplinWidthRatio = 1.0;

  ScreenSizeProvider calc(BuildContext context) {
    if (_screenSize != null) {
      return this;
    }
    _screenSize = MediaQuery.of(context).size;
    _zeplinHeightRatio = _screenSize.height / 640;
    _zeplinWidthRatio = _screenSize.width / 360;

    return this;
  }

  Size getRatioSize(double width, double height) {
    var ratioHeight = height * _zeplinHeightRatio;
    var widthRatio = width / height;

    return Size(ratioHeight * widthRatio, ratioHeight);
  }

  double getRatioY(double y) {
    return _zeplinHeightRatio * y;
  }

  double getRatioX(double x) {
    return _zeplinWidthRatio * x;
  }
}
