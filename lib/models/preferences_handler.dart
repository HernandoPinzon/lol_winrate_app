import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String initialExample = '["nodata","nodata"]';
  static List<String> searchHistory = ["nodata"];

  static Future initHistory() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('searchHistory')) {
      String jsonString = prefs.getString('searchHistory')!;
      List<dynamic> json = jsonDecode(jsonString);
      searchHistory = json.map((e) => e.toString()).toList();
    }
  }

  static void addSearchInHistory(String value) async {
    if (searchHistory.length > 9) {
      searchHistory.removeLast();
    }
    searchHistory.insert(0, value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('searchHistory', jsonEncode(searchHistory));
  }
}
