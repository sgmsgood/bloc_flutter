import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_noti_flutter/provider/screen_size_provider.dart';

class TestListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeModel =  context.read<ScreenSizeProvider>().calc(context);
    return Scaffold(
      // appBar: _customAppbar(context, sizeModel),
      body: SafeArea(
        child: Container(
          color: Colors.red,
          child: Row(
            children: [
              Center(
                child: Container(
                  color: Colors.white,
                  width: sizeModel.getRatioX(328),
                  height: 40,
                ),
              ),
              SizedBox(
                width: sizeModel.getRatioX(1),
              ),
              Container(
                  color: Colors.blue,
                width: sizeModel.getRatioX(30),
                  height: 40,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customAppbar(BuildContext context, ScreenSizeProvider sizeModel) {
    log("@!!sizeModel.getRatioY(88): ${sizeModel.getRatioY(88)}");
    return PreferredSize(
      child: AppBar(
        title: Text("............"),
      ),
      preferredSize: Size.fromHeight(sizeModel.getRatioY(88)),
    );
  }
}
