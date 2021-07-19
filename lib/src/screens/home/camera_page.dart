import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_photos/src/screens/home/bloc/rover_bloc.dart';
import 'package:mars_rover_photos/src/widgets/custom_indicator.dart';

import '../../data/camera_type_list.dart';
import '../../widgets/lists/image_list.dart';
import 'widgets/camera_dropdown.dart';

class CameraPage extends StatelessWidget {
  final String type;
  final Function(String? newType) onCameraTypeChanged;

  CameraPage({Key? key, required this.type, required this.onCameraTypeChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoverBloc, RoverState>(builder: (_, state) {
      if (state is RoverFetching) {
        return Center(child: CustomIndicator());
      } else if (state is RoverFetched) {
        List<String> imgList = [];
        state.rover.photos.forEach((element) {
          imgList.add(element.imgSrc);
        });
        return _buildBody(imgList);
      } else if (state is RoverFetchFailed) {
        return Center(
          child: Text('Error! : ${state.message}'),
        );
      }
      return SizedBox();
    });
  }

  Column _buildBody(List<String> imgList) {
    return Column(children: [
      Expanded(
          child: Row(
        children: [
          Expanded(flex: 2, child: Text('Camera Type : ')),
          Expanded(
            child: CameraDropdown(
                items: cameraTypes, onChanged: onCameraTypeChanged),
          ),
        ],
      )),
      Expanded(
        flex: 10,
        child: ImageList(
          imageList: imgList,
        ),
      )
    ]);
  }
}
