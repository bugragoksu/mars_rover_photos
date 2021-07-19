import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_repository.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserStatus userStatus =
        Provider.of<UserRepository>(context, listen: true).userStatus;
    checkAndNavigateUser(userStatus, context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  checkAndNavigateUser(UserStatus userStatus, BuildContext context) {
    if (userStatus == UserStatus.Authenticated) {
      Future.microtask(() => Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false));
    } else if (userStatus == UserStatus.Unauthenticated) {
      Future.microtask(() => Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false));
    }
  }
}
