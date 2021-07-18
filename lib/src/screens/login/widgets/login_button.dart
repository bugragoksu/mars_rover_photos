import 'package:flutter/material.dart';

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
    isLoading = !isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      width: context.dynamicWidth(0.75),
      isLoading: isLoading,
      color: Colors.blue,
      onPressed: () {
        setState(() {
          changeLoading();
        });
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            changeLoading();
            widget.onFinish(true, null);
          });
        });
      },
      text: 'Facebook ile giris yap',
    );
  }
}
