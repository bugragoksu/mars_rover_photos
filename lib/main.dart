import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rover_repository/rover_repository.dart';

import 'src/provider/user_repository.dart';
import 'src/screens/home/bloc/rover_bloc.dart';
import 'src/screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserRepository(),
      child: BlocProvider(
        create: (BuildContext context) => RoverBloc(RoverRepository())
          ..add(RoverFetchEvent(
              model: RoverRequestModel(type: 'curiosity', cameraType: 'FHAZ'))),
        child: MaterialApp(
          title: 'Mars Rover Photos',
          home: SplashScreen(),
        ),
      ),
    );
  }
}
