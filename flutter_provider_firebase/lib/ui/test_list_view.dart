import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_authentication/user_authentication.dart';

class TestListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<FirebaseAuthenticationRepository>(context).authenticate();
    log("@!!${context.read<FirebaseAuthenticationRepository>().getUserId().toString()}");
    return Container();
  }
}
