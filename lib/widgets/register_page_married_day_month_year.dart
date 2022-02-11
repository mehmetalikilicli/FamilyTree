import 'package:family_tree/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class register_page_married_day_month_year extends StatelessWidget {
  const register_page_married_day_month_year({
    Key? key,
    required this.dayController,
    required this.monthController,
    required this.yearController,
  }) : super(key: key);

  final TextEditingController dayController;
  final TextEditingController monthController;
  final TextEditingController yearController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: myTextField(
            myController: dayController,
            textFieldHintText: 'Gun',
          ),
        ),
        Expanded(
          child: myTextField(
            myController: monthController,
            textFieldHintText: 'Ay',
          ),
        ),
        Expanded(
          child: myTextField(
            myController: yearController,
            textFieldHintText: 'Yıl',
          ),
        ),
      ],
    );
  }
}
