import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../provider/user_repository.dart';
import '../../../widgets/buttons/rounded_button.dart';

class LoginButton extends StatelessWidget {
  final void Function(bool success, String? errorMessage) onFinish;

  const LoginButton({Key? key, required this.onFinish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      width: context.dynamicWidth(0.75),
      isLoading: context.watch<UserRepository>().userStatus ==
          UserStatus.Authenticating,
      color: Colors.blue,
      onPressed: () async {
        bool result = await context.read<UserRepository>().signInWithFacebook();
        onFinish(result, result ? null : "Bir hata olustu.");
      },
      text: 'Continue with Facebook',
    );
  }
}
