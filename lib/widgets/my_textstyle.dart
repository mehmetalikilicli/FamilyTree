import 'package:family_tree/components/colors.dart';
import 'package:flutter/material.dart';

class myTextstyle extends StatelessWidget {
  String text;
  myTextstyle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 14,
        fontFamily: "Helvetica Neue",
      ),
    );
  }
}
