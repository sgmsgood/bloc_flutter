import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_noti_flutter/components/custom_list_tile.dart';
import 'package:test_noti_flutter/provider/anonymous_login_provider.dart';
import 'package:test_noti_flutter/provider/screen_size_provider.dart';

class MainListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeModel =  context.read<ScreenSizeProvider>().calc(context);
    var authModel = context.read<AnonymousLoginProvider>();
    CollectionReference users = FirebaseFirestore.instance.collection('todos');
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
           Container(
             child: StreamBuilder<QuerySnapshot>(
               stream: users.snapshots(),
               builder: (context, snapshot) {
                 if (snapshot.hasError) {
                   return Text('Something went wrong');
                 }

                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return Text("Loading");
                 }

                 return ListView(
                   shrinkWrap: true,
                   children: snapshot.data.docs.map((DocumentSnapshot document) {
                     return SizedBox(
                       height: 300,
                       child: CustomPaint(
                         painter: CustomListTile(),
                         child: Container(height: 300,)
                       ),
                     );
                     // return new ListTile(
                     //   title: new Text(document.data()['note']),
                     //   subtitle: new Text(document.data()['task']),
                     // );
                   }).toList(),
                 );
               },
             )
           ),
          ],
        ),
      ),
    );
  }
}
