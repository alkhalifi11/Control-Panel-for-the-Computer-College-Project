// ignore_for_file: unnecessary_string_interpolations

import 'package:leftapp_1/app/constant/message.dart';

validInput(String val, int min, int max) {
  if (val.length > max) {
    return "$messageInputMax $max";
  }

  if (val.isEmpty) {
    return "$messageInputEmpty";
  }

  if (val.length < min) {
    return "$messageInputMin $min";
  }
}
