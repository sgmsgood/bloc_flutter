import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_noti_flutter/provider/anonymous_login_provider.dart';

class CircularProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Center(
                child: CircularProgressIndicator(),
              ),
              Container(
                color: Colors.grey.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
