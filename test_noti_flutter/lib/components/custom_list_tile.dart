import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;

    RRect rRect = RRect.fromRectXY(Rect.fromLTRB(0.0, 0.0, 310.0, 200.0), 40, 40);
    canvas.drawRRect(
        rRect,
        Paint()
          ..color = Color(0xFF6886C5)
          ..style = PaintingStyle.fill);

    Rect rect = Rect.fromCircle(center: Offset(30, 35), radius: 10);
    canvas.drawOval(rect, Paint()..color = Color(0xFFFFE0AC)
    ..style = PaintingStyle.fill);

    // RRect rightTop = RRect.fromRectAndCorners(Rect.fromLTRB(220,0, 300, 30), bottomLeft: Radius.circular(200.0), topRight: Radius.circular(200.0), bottomRight: Radius.circular(80.0));
    Rect rightTop = Rect.fromCircle(center: Offset(282, -13), radius: 50);
    // canvas.drawOval(rightTop, Paint()..color = Color(0xFFFFE0AC)
    //   ..style = PaintingStyle.fill
    // ..blendMode = BlendMode.softLight);
    // canvas.clipRect(rightTop, clipOp: ClipOp.difference, doAntiAlias: true);
    var paint = Paint()..color = Color(0xFFFFE0AC)
      ..style = PaintingStyle.fill
    ..blendMode = BlendMode.lighten;

    RRect rightRect = RRect.fromRectAndCorners(Rect.fromLTRB(278, 174, 287, 185), topRight: Radius.circular(10.0), topLeft: Radius.circular(9.0), bottomRight: Radius.circular(14.0));
    canvas.drawRRect(rightRect, Paint()..color = Color(0xFFFFE0AC)
      ..style = PaintingStyle.fill);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
