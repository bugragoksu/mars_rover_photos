import 'package:flutter/material.dart';

import '../../core/constants/path_constants.dart';
import '../../core/extensions/context_extension.dart';
import 'widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(loginImagePath),
              SizedBox(height: context.highValue),
              LoginButton(
                onFinish: (bool success, String? errorMessage) {
                  if (success) {
                    print("basarili");
                  } else {
                    print("hata");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
