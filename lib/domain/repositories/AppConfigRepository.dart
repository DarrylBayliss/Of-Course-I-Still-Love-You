import 'package:of_course_i_still_love_you/domain/repositories/ConfigRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AppConfigRepository extends ConfigRepository {
  static const String _firstTimeAppOpenedKey = "firstTimeAppOpened";

  @override
  Future<bool> isAppOpenForFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_firstTimeAppOpenedKey)) {
      return prefs.getBool(_firstTimeAppOpenedKey) ?? true;
    } else {
      return true;
    }
  }

  @override
  void setAppOpenForFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_firstTimeAppOpenedKey, false);
  }
}
