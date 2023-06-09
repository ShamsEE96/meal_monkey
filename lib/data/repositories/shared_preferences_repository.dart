import 'package:meal_monkey/data/enums/data_type.dart';
import 'package:meal_monkey/main.dart';

class SharedPreferencesRepository {
  //!--- Keys ----
  static String PREF_FIRST_LAUNCH = 'first_launch';

  static void setFirstLaunch(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LAUNCH,
      value: value,
    );
    print(globalSharedPreferences.get(PREF_FIRST_LAUNCH));
  }

  static bool getFirstLaunch() {
    if (globalSharedPreferences.containsKey(PREF_FIRST_LAUNCH)) {
      print(globalSharedPreferences.get(PREF_FIRST_LAUNCH));

      return getPreference(key: PREF_FIRST_LAUNCH);
    } else {
      return true;
    }
  }

  //!--- Main Function ----
  static setPreference({
    required DataType dataType,
    required String key,
    required dynamic value,
  }) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreferences.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreferences.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreferences.setDouble(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreferences.setString(key, value);
        break;
      case DataType.STRINGLIST:
        await globalSharedPreferences.setStringList(key, value);
        break;
      default:
        break;
    }
  }

  static getPreference({required String key}) {
    return globalSharedPreferences.get(key);
  }
}
