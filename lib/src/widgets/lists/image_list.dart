import 'package:flutter/material.dart';

import '../../core/constants/path_constants.dart';
import '../cards/image_card.dart';

class ImageList extends StatelessWidget {
  final List list;

  const ImageList({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, i) => ImageCard(
              imagePath: loginImagePath,
            ),
        itemCount: list.length);
  }
}
