import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mars_rover_photos/src/screens/home/home_screen.dart';

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
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                        (route) => false);
                  } else {
                    Fluttertoast.showToast(msg: errorMessage!);
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
