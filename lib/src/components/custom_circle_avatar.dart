import 'package:flutter/material.dart';
import 'package:mini_app/src/constants/color_constants.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    required this.image,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final double radius = height / 2;
    final double radiusBorder = radius + 4;

    return CircleAvatar(
      radius: radiusBorder,
      backgroundColor: Colors.black54,
      child: CircleAvatar(
        radius: radius,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: width,
            height: height,
            color: ColorConstants.background,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
