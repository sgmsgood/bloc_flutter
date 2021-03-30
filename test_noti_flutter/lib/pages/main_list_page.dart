import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_noti_flutter/components/custom_list_tile.dart';
import 'package:test_noti_flutter/model/tests.dart';
import 'package:test_noti_flutter/provider/anonymous_login_provider.dart';
import 'package:test_noti_flutter/provider/screen_size_provider.dart';

import 'list_page.dart';

class MainListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeModel = context.read<ScreenSizeProvider>().calc(context);

    CollectionReference users = FirebaseFirestore.instance.collection('test');
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: testList.length,
          itemBuilder: (BuildContext context, int index) {
            return Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(index)));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 310,
                      height: 220,
                      child: Stack(
                        children: [
                          CustomPaint(
                            painter: CustomListTile(),
                          ),
                          Center(
                            child: Text(
                              testMap[testList[index]],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
