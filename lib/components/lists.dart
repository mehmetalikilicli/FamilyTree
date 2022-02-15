import 'package:family_tree/models/gridview_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:family_tree/models/user.dart';

List<GridViewList> items = [
  GridViewList("assets/images/add_father.svg", "Baba Ekle"),
  GridViewList("assets/images/add_mother.svg", "Anne Ekle"),
  GridViewList("assets/images/add_spouse.svg", "Eşini Ekle"),
  GridViewList("assets/images/add_child.svg", "Çocuk Ekle"),
  GridViewList("assets/images/add_brother.svg", "Erkek Kardeş Ekle"),
  GridViewList("assets/images/add_sister.svg", "Kız Kardeş Ekle"),
];

List<User> userList = [];
