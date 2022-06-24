import 'package:flutter/material.dart';
import 'package:winrateforlol_app/pages/results_page.dart';
import 'package:winrateforlol_app/widgets/navigation_bar.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    //TODO:hacer que lea el nombre guardado en preferencias
    return ResultsPage(summonerName: "summonerName");
  }
}