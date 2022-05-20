import 'package:flutter/material.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;

  const BottomBarColumn({
    Key? key,
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getBottomText(heading, 18, Colors.white),
          const SizedBox(height: 10),
          getBottomText(s1, 14, Colors.white60),
          getBottomText(s2, 14, Colors.white60),
          getBottomText(s3, 14, Colors.white60),
        ],
      ),
    );
  }
}

Text getBottomText(String text, double font, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: font,
      fontWeight: FontWeight.w500,
    ),
  );
}
