import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mars_rover_photos/src/widgets/custom_indicator.dart';

import '../../style/button_theme_contants.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? width;

  const RoundedButton(
      {Key? key,
      this.isLoading = false,
      this.width,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        style: ButtonThemeContants.instance
            .rectangeButtonStyle(color: Colors.blue),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoading
              ? CustomIndicator()
              : Text(
                  text,
                  style: GoogleFonts.jost(fontSize: 22),
                ),
        ),
      ),
    );
  }
}
