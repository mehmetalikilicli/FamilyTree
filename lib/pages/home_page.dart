import 'package:family_tree/components/colors.dart';
import 'package:family_tree/utils/utils.dart';
import 'package:family_tree/pages/register_page.dart';
import 'package:family_tree/widgets/my_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Homa_Page extends StatefulWidget {
  const Homa_Page({Key? key}) : super(key: key);

  @override
  State<Homa_Page> createState() => _Homa_PageState();
}

class _Homa_PageState extends State<Homa_Page> {
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
                    ).then((_) {
                      setState(() {
                        user?.userProfileImage != null
                            ? Image.file(
                                user!.userProfileImage!,
                              )
                            : SvgPicture.asset(
                                "assets/images/add_profile.svg",
                              );
                      });
                    });
                  },
                  child: user?.userProfileImage != null
                      ? Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: Image.file(
                                user!.userProfileImage!,
                                fit: BoxFit.cover,
                              ).image,
                              radius: width * 0.1,
                            ),
                            SizedBox(
                              height: height * 0.0225,
                            ),
                            myTextstyle(
                                text:
                                    "${user?.userName}  ${user!.userSurname}"),
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
}
