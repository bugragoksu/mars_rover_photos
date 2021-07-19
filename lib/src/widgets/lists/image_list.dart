import 'package:flutter/material.dart';

import '../cards/image_card.dart';

class ImageList extends StatelessWidget {
  final List<String> imageList;

  const ImageList({Key? key, required this.imageList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, i) => ImageCard(
              imagePath: imageList[i],
            ),
        itemCount: imageList.length);
  }
}
