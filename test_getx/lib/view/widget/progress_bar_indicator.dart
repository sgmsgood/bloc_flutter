import 'package:flutter/material.dart';

class ProgressBarIndicator extends StatelessWidget {
  bool _visible;

  ProgressBarIndicator(this._visible);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFADD876)),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}