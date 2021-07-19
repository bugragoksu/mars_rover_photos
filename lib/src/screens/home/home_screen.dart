import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_repository.dart';
import 'camera_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
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
          },
          children: [
            CameraPage(
              type: 'Curisiotiy',
            ),
            CameraPage(type: 'Opportunity'),
            CameraPage(type: 'Spirit'),
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

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Welcome " + getName()),
    );
  }

  String getName() {
    return context.read<UserRepository>().userData == null
        ? ""
        : context.read<UserRepository>().userData!['name'].toString();
  }
}
