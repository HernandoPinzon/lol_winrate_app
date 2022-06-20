

import 'package:shared_preferences/shared_preferences.dart';

class OptionsHandler{

  static bool defaultPagePerfil=false;
  static bool showOnlyRankedsDefault=false;
  static String showDefaultResults= "vs all";
  static final List<String> showDefaultResultsOptions = [
    "vs per rol",
    "vs all",
    "my champions",
    "allied champions"
  ];

  static Future initOptions() async{
    final prefs = await SharedPreferences.getInstance();
    defaultPagePerfil = prefs.getBool('defaultPagePerfilOPTION')??false;
    defaultPagePerfil = prefs.getBool('showOnlyRankedsDefaultOPTION')??false;
    print("initOptions");
  }
}