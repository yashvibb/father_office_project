import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final TextStyle? textStyle;

  const CustomBtn({
    Key? key,
    this.title = "Save",
    required this.onPressed,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: Color(0xffB5C0FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
}