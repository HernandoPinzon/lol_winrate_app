import 'package:flutter/material.dart';
import 'package:winrateforlol_app/pages/account_page.dart';
import 'package:winrateforlol_app/pages/options_page.dart';
import 'package:winrateforlol_app/pages/results_page.dart';
import 'package:winrateforlol_app/pages/search_page.dart';

abstract class Routes {
  static Map<String, Widget Function(BuildContext)> list = {
    RoutesNames.searchPage: (_) => SearchPage(),
    RoutesNames.accountPage: (_) => AccountPage(),
    RoutesNames.optionsPage: (_) => OptionsPage(),
    RoutesNames.resultsPage: (BuildContext context) {
      final String nameSummoner = ModalRoute.of(context)!.settings.arguments as String;
      return ResultsPage(summonerName: nameSummoner,);
    }
  };
}

abstract class RoutesNames {
  static const String searchPage = "/search-page";
  static const String accountPage = "/account-page";
  static const String optionsPage = "/options-page";
  static const String resultsPage = "/results-page";
}
