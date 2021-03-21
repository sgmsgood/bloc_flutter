import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_noti_flutter/provider/anonymous_login_provider.dart';
import 'package:test_noti_flutter/provider/screen_size_provider.dart';

class MainListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeModel =  context.read<ScreenSizeProvider>().calc(context);
    var authModel =  context.read<AnonymousLoginProvider>();
    authModel.authenticate();

    return Scaffold(
      // appBar: _customAppbar(context, sizeModel),
      body: SafeArea(
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
