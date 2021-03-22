import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
             child: FutureBuilder<DocumentSnapshot>(
                future: users.doc('JUnM3VFDkFHQmQyydBsD').get(),
               builder: (context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.done) {
                   Map<String, dynamic> data = snapshot.data.data();
                   return Text("Full Name: ${data['complete']} ${data['note']}");
                 }

                 return Text("loading");
               },
             )
           ),
          ],
        ),
      ),
    );
  }
}
