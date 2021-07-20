import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_photos/src/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:rover_repository/rover_repository.dart';

import '../../data/camera_type_list.dart';
import '../../data/type_list.dart';
import '../../provider/user_repository.dart';
import 'bloc/rover_bloc.dart';
import 'camera_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  String currentCameraType = cameraTypes[0];
  PageController _pageController = PageController();
  void onCameraTypeChange(String? cameraType) {
    setState(() {
      currentCameraType = cameraType!;
    });
    sendRequest();
  }

  void sendRequest() {
    BlocProvider.of<RoverBloc>(context).add(RoverFetchEvent(
        model: RoverRequestModel(
            type: typeList[_currentPageIndex].toLowerCase(),
            cameraType: currentCameraType)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      bottomNavigationBar: _buildBottomNavigationBar,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PageView(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
            sendRequest();
          },
          children: [
            CameraPage(
              selectedCameraTypeValue: currentCameraType,
              onCameraTypeChanged: onCameraTypeChange,
              type: typeList[0],
            ),
            CameraPage(
                selectedCameraTypeValue: currentCameraType,
                onCameraTypeChanged: onCameraTypeChange,
                type: typeList[1]),
            CameraPage(
                selectedCameraTypeValue: currentCameraType,
                onCameraTypeChanged: onCameraTypeChange,
                type: typeList[2]),
          ],
        ),
      )),
    );
  }

  BottomNavigationBar get _buildBottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: _currentPageIndex,
      onTap: (int index) {
        setState(() {
          _currentPageIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        });
        sendRequest();
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_input_antenna),
          label: 'Curisiotiy',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stream),
          label: 'Opportunity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.precision_manufacturing_outlined),
          label: 'Spirit',
        ),
      ],
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      title: Text("Welcome " + getName()),
      actions: [
        IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await context.read<UserRepository>().logout();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => SplashScreen()),
                  (route) => false);
            })
      ],
    );
  }

  String getName() {
    return context.watch<UserRepository>().userData == null
        ? ""
        : context.read<UserRepository>().userData!['name'].toString();
  }
}
