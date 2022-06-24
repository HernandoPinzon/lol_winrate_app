

import 'package:shared_preferences/shared_preferences.dart';

abstract class OptionsHandler{

  static bool defaultPagePerfil=false;
  static bool showOnlyRankedsDefault=false;
  static String showDefaultResults= showDefaultResultsOptions[2];
  static final List<String> showDefaultResultsOptions = [
    "vs per rol",
    "vs all",
    "my champions",
    "allied champions"
  ];

  static Future initOptions() async{
    final prefs = await SharedPreferences.getInstance();
    defaultPagePerfil = prefs.getBool('defaultPagePerfilOPTION')??false;
    showOnlyRankedsDefault = prefs.getBool('showOnlyRankedsDefaultOPTION')??false;
    showDefaultResults = prefs.getString('showDefaultResultsOPTION')??showDefaultResults;
    print("initOptions");
  }

  static Future setDefaultPagePerfil(bool value) async{
    defaultPagePerfil = value;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('defaultPagePerfilOPTION',defaultPagePerfil);
  }

  static Future setShowOnlyRankedsDefault(bool value) async{
    showOnlyRankedsDefault = value;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showOnlyRankedsDefaultOPTION',showOnlyRankedsDefault);
  }

  static Future setShowDefaultResults(String value) async{
    showDefaultResults = value;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('showDefaultResultsOPTION', showDefaultResults);
  }
}