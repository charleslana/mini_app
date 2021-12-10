import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:mini_app/src/constants/color_constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      duration: const Duration(milliseconds: 100),
      onPressed: onPressed,
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorConstants.background,
          ),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
