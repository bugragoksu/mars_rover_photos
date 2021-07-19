import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;

  const ImageCard({Key? key, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          height: context.dynamicHeight(0.35),
          child: Text(''),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath)),
              borderRadius: BorderRadius.circular(30)),
        ));
  }
}
