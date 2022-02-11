import 'package:family_tree/components/colors.dart';
import 'package:flutter/material.dart';

class myTextField extends StatefulWidget {
  myTextField({
    Key? key,
    required this.textFieldHintText,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;
  String textFieldHintText = "";

  @override
  State<myTextField> createState() => _myTextFieldState();
}

class _myTextFieldState extends State<myTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: new InputDecoration(
          hintText: widget.textFieldHintText,
          hintStyle: TextStyle(
            color: textColor,
            fontSize: 14,
            fontFamily: "Helvetica Neue",
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            //  when the TextFormField in unfocused
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            //  when the TextFormField in unfocused
          ),
        ),
        controller: widget.myController,
      ),
    );
  }
}
