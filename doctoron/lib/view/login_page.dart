import 'package:doctoron/provider/config/config_provider.dart';
import 'package:doctoron/provider/oauth/oauth_provider.dart';
import 'package:doctoron/provider/oauth/sso/sso_provider.dart';
import 'package:doctoron/widget/button/login_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var oauthModel = context.read<OauthProvider>();
  var ssoModel = context.read<SSOProvider>();
  var configModel = context.read<ConfigProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildLogo(),
            SizedBox(
              height: 20,
            ),
            _buildLoginButton(context, oauthModel, ssoModel, configModel),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(color: Colors.lightGreen, width: 100, height: 100);
  }

  Widget _buildLoginButton(BuildContext context, OauthProvider oauthModel, SSOProvider ssoModel, ConfigProvider configModel) {
    return Center(
      child: LoginButton(
        onPressed: () {
          oauthModel.oauth(ssoModel, configModel);
        },
        buttonTitle: 'Login Button',
      ),
    );
  }
}
