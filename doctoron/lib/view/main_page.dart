import 'package:doctoron/provider/config/config_provider.dart';
import 'package:doctoron/provider/oauth/oauth_provider.dart';
import 'package:doctoron/provider/oauth/sso/sso_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var oauthModel = context.read<OauthProvider>();
    var configModel = context.read<ConfigProvider>();
    var ssoModel = context.read<SSOProvider>();

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: _drawerList(oauthModel, ssoModel, configModel),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildTextFieldForm(),
            ElevatedButton(
              onPressed: () {},
              child: Text('move'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldForm() {
    return TextFormField(
        autovalidateMode: AutovalidateMode.disabled,
        validator: (String val) {
          return val.isEmpty ? 'val is Empty!' : null;
        }
    );
  }

  Widget _drawerList(OauthProvider oauthModel, SSOProvider ssoModel,
      ConfigProvider configModel) {
    return ListView(
      children: [
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        TextButton(
          onPressed: () {
            oauthModel.signout(ssoModel, configModel);
          },
          child: Text('로그아웃'),
        )
      ],
    );
  }
}
