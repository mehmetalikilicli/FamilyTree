import 'dart:io';

class User {
  late String userName;
  late String userSurname;
  late File? userProfileImage;

  User(this.userName, this.userSurname, this.userProfileImage);
}
