import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_noti_flutter/model/tests.dart';

class ListPage extends StatelessWidget {
  int _index;

  ListPage(this._index);

  @override
  Widget build(BuildContext context) {
    Query query = FirebaseFirestore.instance.collection(testList[_index]);

    log("@!!query: ${query.snapshots()}");
    return Container();
  }
}
