import 'dart:io';

class User {
  late String userName;
  late String userSurname;
  late File? userProfileImage;
  late int userBirthDay;
  late int userBirthMonth;
  late int userBirthYear;

  //late int userMarriedDay;
  //late int userMarriedMonth;
  //late int userMarriedYear;

  User(this.userName, this.userSurname, this.userProfileImage);
}
