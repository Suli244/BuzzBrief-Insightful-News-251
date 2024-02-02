import 'package:shared_preferences/shared_preferences.dart';

class FirstOpenInsightfulNews {
  static Future<bool> fop() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isOpened') ?? false;
  }

  static Future<void> sop() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isOpened', true);
  }
}
