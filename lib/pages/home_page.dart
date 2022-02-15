import 'package:family_tree/components/colors.dart';
import 'package:family_tree/components/lists.dart';
import 'package:family_tree/utils/utils.dart';
import 'package:family_tree/pages/register_page.dart';
import 'package:family_tree/widgets/my_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Homa_Page extends StatefulWidget {
  const Homa_Page({Key? key}) : super(key: key);

  @override
  State<Homa_Page> createState() => _Homa_PageState();
}

class _Homa_PageState extends State<Homa_Page> {
  bool isVisible = false;
  bool popupAddAnother = false;

  @override
  Widget build(BuildContext context) {
    String appBarTitleText = "Aile Ağacı";
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.12,
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
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "assets/images/profile.svg",
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "assets/images/share.svg",
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 50, left: 10),
                child: SvgPicture.asset(
                  "assets/images/union64.svg",
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register_Page()),
                    ).then(
                      (_) {
                        setState(
                          () {
                            for (var item in userList) {
                              print(item.userName);
                            }
                            if (userList.last.userProfileImage != null) {
                              child:
                              Image.file(
                                userList.last.userProfileImage!,
                              );
                              SizedBox(
                                height: height * 0.0225,
                              );
                            } else {
                              SvgPicture.asset(
                                "assets/images/add_profile.svg",
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                  child: userList.last.userProfileImage != null
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Column(
                                children: [
                                  isVisible
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              child: SvgPicture.asset(
                                                "assets/images/eye_grey.svg",
                                              ),
                                              onTap: () {},
                                            ),
                                            GestureDetector(
                                              child: SvgPicture.asset(
                                                "assets/images/add_profile_grey.svg",
                                              ),
                                              onTap: () {
                                                showPopup();
                                              },
                                              onLongPress: () {
                                                print("Akraba Ekle");
                                              },
                                            ),
                                            GestureDetector(
                                              child: SvgPicture.asset(
                                                "assets/images/edit.svg",
                                              ),
                                              onTap: () {},
                                            ),
                                            GestureDetector(
                                              child: SvgPicture.asset(
                                                "assets/images/delete.svg",
                                              ),
                                              onTap: () {},
                                            ),
                                          ],
                                        )
                                      : Container(
                                          height: 40,
                                        ),
                                  SvgPicture.asset(
                                    "assets/images/add_another_person.svg",
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundImage: Image.file(
                                userList.last.userProfileImage!,
                                fit: BoxFit.cover,
                              ).image,
                              radius: width * 0.1,
                            ),
                            myTextstyle(
                                text:
                                    "${userList.last.userName}  ${userList.last.userSurname}"),
                          ],
                        )
                      : Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/add_profile.svg",
                            ),
                            myTextstyle(text: "Seni Ağaçta Ekle"),
                          ],
                        ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Container(
            height: height * 0.7,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: width * 0.075,
                ),
                SvgPicture.asset(
                  "assets/images/eye.svg",
                ),
                SizedBox(
                  width: width * 0.45,
                ),
                SvgPicture.asset(
                  "assets/images/fit_screen.svg",
                ),
              ],
            ),
          ),
          Positioned(
            bottom: height * 0.06,
            right: width * 0.4,
            child: SvgPicture.asset(
              "assets/images/tree.svg",
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              "assets/images/bottom.svg",
              width: width,
            ),
          ),
          Positioned(
            bottom: height * 0.04,
            left: width * 0.17,
            child: Container(
              child: SvgPicture.asset(
                "assets/images/menu.svg",
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.04,
            right: width * 0.17,
            child: Container(
              child: SvgPicture.asset(
                "assets/images/dna.svg",
              ),
            ),
          ),
        ],
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
              height: MediaQuery.of(context).copyWith().size.height * 0.4,
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context);
                        },
                        child: GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(items[index].image),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(items[index].text,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        decoration: TextDecoration.none),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register_Page(),
                              ),
                            ).then((value) => null);
                          },
                        ),
                      ),
                    ],
                  );
                },
              )),
          isSurfacePainted: true,
        );
      },
    );
  }
}
