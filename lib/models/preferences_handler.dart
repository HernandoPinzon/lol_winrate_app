
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler{

  static const String initialExample = '["summoner1","summoner2"]';


  static Future<String> getExample() async{
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('example')==null) {
      await prefs.setString('example', initialExample);
    }
    final String? example = prefs.getString('example');
    //print(example);
    return Future.value(example);
  }

  static void setExample(String example) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('example', example);
  }

  static void printJsonExample() async{
    String jsonString = await getExample();
    setExample(initialExample);
    print(jsonString);
    try {
      List<dynamic> JSON = jsonDecode(jsonString);
      final List<String> strs = JSON.map((e) => e.toString()).toList();
      print(strs[0]);
      print(strs[1]);
    } catch (e) {
      setExample(initialExample);
      String jsonString = await getExample();
      List<dynamic> JSON = jsonDecode(jsonString);
      final List<String> strs = JSON.map((e) => e.toString()).toList();
    }
  }

  static void setJsonExample(String example) async{
    String jsonString = await getExample();
    List<dynamic> JSON = jsonDecode(jsonString);
    final List<String> strs = JSON.map((e) => e.toString()).toList();
    print(strs);
    if (strs.length>9) {
      strs.removeLast();
    }
    strs.insert(0, example);
    print(example);
    print(strs);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('example', jsonEncode(strs));
    //print(jsonEncode(strs));
  }

  static Future<List<String>> getJsonExample() async{
    String jsonString = await getExample();
    try {
      List<dynamic> JSON = jsonDecode(jsonString);
      final List<String> strs = JSON.map((e) => e.toString()).toList();
      return strs;
    } catch (e) {
      setExample(initialExample);
      String jsonString = await getExample();
      List<dynamic> JSON = jsonDecode(jsonString);
      final List<String> strs = JSON.map((e) => e.toString()).toList();
      return strs;
    }
  }

  static void deleteExample() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('example');
  }

  static void setInitialValues(){
    Map<String, Object> values = <String, Object>{'example': initialExample};
    SharedPreferences.setMockInitialValues(values);
  }
}