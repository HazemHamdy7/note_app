import 'package:noteapp/constant/massage.dart';

validInput(String val, int min, int max) {
  if (val.length > max) {
    return "$messageInputmax $max ";
  }
  if (val.isEmpty) {
    return "$messageInputEmpty";
  }
  if (val.length > max) {
    return "$messageInputmin $min ";
  }
}
