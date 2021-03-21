import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(color: Colors.black.withOpacity(0.4),),
          CircularProgress(),
        ],
      ),
    );
  }
}
