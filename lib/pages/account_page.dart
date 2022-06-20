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
    return ResultsPage(summonerName: "summonerName");
  }
}