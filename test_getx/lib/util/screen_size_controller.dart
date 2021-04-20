import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSizeController extends GetxController{
  Size _screenSize;
  double _zeplinHeightRatio = 1.0;
  double _zeplinWidthRatio = 1.0;
  double _screenRatio = 1.0;

  ScreenSizeController calc(BuildContext context) {
    if (_screenSize != null) {
      return this;
    }
    _screenSize = MediaQuery.of(context).size;
    _zeplinHeightRatio = _screenSize.height / 640;
    _zeplinWidthRatio = _screenSize.width / 360;

    _screenRatio = (640 / 360) / (_screenSize.height / _screenSize.width);

    return this;
  }

  Size getRatioSize(double width, double height) {
    var ratioHeight = height * _zeplinHeightRatio;
    var widthRatio = width / height;

    return Size(ratioHeight * widthRatio * _screenRatio, ratioHeight);
  }

  double getRatioY(double y) {
    return _zeplinHeightRatio * y;
  }

  double getRatioX(double x) {
    return _zeplinWidthRatio * x;
  }
}