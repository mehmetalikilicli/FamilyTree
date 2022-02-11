import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:family_tree/components/colors.dart';
import 'package:family_tree/components/custom_textfield.dart';
import 'package:family_tree/utils/utils.dart';
import 'package:family_tree/models/user.dart';
import 'package:family_tree/widgets/my_textstyle.dart';
import 'package:family_tree/widgets/register_page_birth_day_month_year.dart.dart';
import 'package:family_tree/widgets/register_page_radio_button.dart';
import 'package:family_tree/widgets/register_page_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class Register_Page extends StatefulWidget {
  Register_Page({Key? key}) : super(key: key);

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    // Add the observer.
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    // Remove the observer
    WidgetsBinding.instance!.removeObserver(this);
    nameController.dispose();
    surnameController.dispose();
    super.dispose();
  }

  PickedFile? _image;
  File? selectedImageFile;

  _imageFromGallery() async {
    PickedFile? image = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 10,
    );

    if (image != null) {
      setState(() {
        selectedImageFile = File(image.path);
      });
    }
  }

  _imageFromCamera() async {
    PickedFile? image = await ImagePicker().getImage(
      source: ImageSource.camera,
      imageQuality: 10,
    );
    if (image != null) {
      setState(() {
        selectedImageFile = File(image.path);
      });
    }
  }

  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  final birthDayController = TextEditingController();
  final birthMonthController = TextEditingController();
  final birthYearController = TextEditingController();

  final deathDayController = TextEditingController();
  final deathMonthController = TextEditingController();
  final deathYearController = TextEditingController();

  final marriedDaycontroller = TextEditingController();
  final marriedMonthcontroller = TextEditingController();
  final marriedYearcontroller = TextEditingController();

  final noteController = TextEditingController();

  Object? selectedRadioSagOlu = 1;
  Object? selectedRadioMaleFemale = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    String appBarTitleText = "Ali'yi ekle";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        toolbarHeight: 100,
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          appBarTitleText,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: textColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "kaydet",
                style: TextStyle(
                  color: Color(0xFF8DC540),
                  fontSize: 16,
                  fontFamily: 'Helvetica Neue',
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: myTextstyle(
                        text: "Fotoğraf",
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Stack(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: selectedImageFile != null
                                ? Image.file(
                                    selectedImageFile!,
                                    width: 156,
                                    height: 192,
                                  )
                                : Stack(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: SvgPicture.asset(
                                            "assets/images/register_profile_frame.svg"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 26, top: 57),
                                        child: SvgPicture.asset(
                                            "assets/images/register_profile.svg"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40.0, top: 18),
                                        child: SvgPicture.asset(
                                            "assets/images/camera.svg"),
                                      ),
                                    ],
                                  )),
                      ],
                    ),
                  ),
                  onTap: () {
                    showPopup();
                  },
                ),
              ],
            ),
            myTextField(
              myController: nameController,
              textFieldHintText: 'Adı',
            ),
            myTextField(
              myController: surnameController,
              textFieldHintText: 'Soyadı',
            ),
            registerPageTextWidget(
              text: 'Doğum Tarihi',
            ),
            register_page_birth_day_month_year(
              dayController: birthDayController,
              monthController: birthMonthController,
              yearController: birthYearController,
            ),
            registerPageTextWidget(
              text: 'Evlilik Tarihi',
            ),
            register_page_birth_day_month_year(
              dayController: marriedDaycontroller,
              monthController: marriedMonthcontroller,
              yearController: marriedYearcontroller,
            ),
            registerPageTextWidget(
              text: 'Kişi Yaşıyor Mu ?',
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selectedRadioSagOlu,
                        activeColor: Colors.green,
                        onChanged: (val) {
                          print("Radio $val");
                          setState(() {
                            selectedRadioSagOlu = val;
                          });
                        },
                      ),
                      Text("Sağ")
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: selectedRadioSagOlu,
                        activeColor: Colors.green,
                        onChanged: (val) {
                          print("Radio $val");
                          setState(() {
                            selectedRadioSagOlu = val;
                          });
                        },
                      ),
                      Text("Ölü"),
                    ],
                  ),
                ),
              ],
            ),
            registerPageTextWidget(
              text: 'Ölüm Tarihi',
            ),
            register_page_birth_day_month_year(
              dayController: deathDayController,
              monthController: deathMonthController,
              yearController: deathYearController,
            ),
            registerPageTextWidget(
              text: 'Cinsiyet',
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selectedRadioMaleFemale,
                        activeColor: Colors.green,
                        onChanged: (val) {
                          print("Radio $val");
                          setState(() {
                            selectedRadioMaleFemale = val;
                          });
                        },
                      ),
                      Text("Erkek"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: selectedRadioMaleFemale,
                        activeColor: Colors.green,
                        onChanged: (val) {
                          print("Radio $val");
                          setState(() {
                            selectedRadioMaleFemale = val;
                          });
                        },
                      ),
                      Text("Kadın"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: selectedRadioMaleFemale,
                        activeColor: Colors.green,
                        onChanged: (val) {
                          print("Radio $val");
                          setState(() {
                            selectedRadioMaleFemale = val;
                          });
                        },
                      ),
                      Text("Diğer"),
                    ],
                  ),
                ),
              ],
            ),
            registerPageTextWidget(
              text: 'Notlar',
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: noteController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Not Gir",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      print(noteController.text);
                      registerSave();
                    },
                    child: Text(
                      "Kaydet",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showPopup() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return CupertinoPopupSurface(
          child: Container(
              color: CupertinoColors.white,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).copyWith().size.height * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    child: Text(
                      "Galeri ? Kamera ?",
                      style: TextStyle(
                        backgroundColor: CupertinoColors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () {
                              _imageFromGallery();
                              Navigator.pop(context);
                            },
                            child: Text("Galeri")),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () {
                              _imageFromCamera();
                              Navigator.pop(context);
                            },
                            child: Text("Kamera")),
                      ]),
                ],
              )),
          isSurfacePainted: true,
        );
      },
    );
  }

  void registerSave() {
    User userTemp =
        User(nameController.text, surnameController.text, selectedImageFile!);
    user = userTemp;
    Navigator.pop(context);
  }
}
