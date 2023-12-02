import 'package:senpai/data/text_constants.dart';

//TODO: gender fron BE
//male
//female
const _genderFromServerMale = 'male';

enum UserGender {
  male,
  female;

  static UserGender genderFromServer(int? gender) =>
      gender == 0 ? UserGender.male : UserGender.female;
}

String genderToString(UserGender userGender) =>
    userGender == UserGender.male ? TextConstants.male : TextConstants.female;

int genderToServer(UserGender userGender) =>
    userGender == UserGender.male ? 0 : 1;

int genderFromServerString(String? gender) {
  if (gender == _genderFromServerMale) {
    return 0;
  } else {
    return 1;
  }
}
