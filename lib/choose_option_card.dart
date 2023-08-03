import 'package:flutter/material.dart';

class ChooseOptionCard extends StatelessWidget {
  final String assetPath;
  final String title;
  final void Function() onTap;

  const ChooseOptionCard({
    Key? key,
    required this.assetPath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Color(0xffB5C0FF),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(
              assetPath,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
