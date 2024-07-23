
import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.borderRadius,
    required this.colorText,
    required this.text,
    this.onPressed,
    this.trailingIcon,
  });

  final BorderRadius borderRadius;
  final Color colorText;
  final String text;
  final void Function()? onPressed;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          color: Colors.white,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: colorText,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}