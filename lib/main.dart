import 'package:family_tree/components/colors.dart';
import 'package:family_tree/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String titleText = "Family Tree";

    return MaterialApp(
      theme: ThemeData(accentColor: primaryColor),
      debugShowCheckedModeBanner: false,
      title: titleText,
      home: Homa_Page(),
    );
  }
}
