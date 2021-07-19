import 'package:flutter/material.dart';

import '../../data/camera_type_list.dart';
import '../../widgets/lists/image_list.dart';
import 'widgets/camera_dropdown.dart';

class CameraPage extends StatelessWidget {
  final String type;

  const CameraPage({Key? key, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Row(
        children: [
          Expanded(flex: 2, child: Text('Camera Type : ')),
          Expanded(
            child: CameraDropdown(
                items: cameraTypes,
                onChanged: (newValue) {
                  print(newValue);
                }),
          ),
        ],
      )),
      Expanded(
        flex: 10,
        child: ImageList(
          list: [
            1,
            2,
            3,
            4,
            5,
          ],
        ),
      )
    ]);
  }
}
