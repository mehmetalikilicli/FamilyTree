import 'package:family_tree/components/colors.dart';
import 'package:flutter/material.dart';

class registerPageTextWidget extends StatelessWidget {
  registerPageTextWidget({
    required String this.text,
    Key? key,
  }) : super(key: key);

  String text = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
