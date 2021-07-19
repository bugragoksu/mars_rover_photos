import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../widgets/buttons/rounded_button.dart';

class LoginButton extends StatefulWidget {
  final void Function(bool success, String? errorMessage) onFinish;

  const LoginButton({Key? key, required this.onFinish}) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      width: context.dynamicWidth(0.75),
      isLoading: isLoading,
      color: Colors.blue,
      onPressed: () async {
        changeLoading();
        final LoginResult result = await FacebookAuth.instance.login();
        if (result.status == LoginStatus.success) {
          final AccessToken accessToken = result.accessToken!;
          widget.onFinish(true, null);
        } else {
          widget.onFinish(false, result.message);
        }
        changeLoading();
      },
      text: 'Continue with Facebook',
    );
  }
}
