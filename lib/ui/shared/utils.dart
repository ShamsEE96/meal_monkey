bool isVaildEmail(String value) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

// 1 uppercase
// 1 spical char [!@#\$&*~]
// min 8 char length

bool isVaildPassword(String value) {
  RegExp regExp = new RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{8,}$');
  return regExp.hasMatch(value);
}

// ^ - Start of string
// \+? - Match + ( optional )
// 09 - Match literally 09
// [0-9]{9} - Match any digits between 0 to 9, 9 times
// $ -End of string

bool isVaildMobileNo(String value) {
  RegExp regExp = new RegExp(r'^\+?09[0-9]{8}$');
  return regExp.hasMatch(value);
}

bool isVaildName(String value) {
  RegExp regExp = new RegExp(r"^[a-zA-Z]+(([\'\-\s][a-zA-Z])?[a-zA-Z]*)*$");
  return regExp.hasMatch(value);
}
