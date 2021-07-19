import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/provider/user_repository.dart';
import 'src/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserRepository(),
      child: MaterialApp(
        title: 'Mars Rover Photos',
        home: LoginScreen(),
      ),
    );
  }
}
