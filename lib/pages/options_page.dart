import 'package:flutter/material.dart';
import 'package:winrateforlol_app/widgets/navigation_bar.dart';
import 'package:winrateforlol_app/widgets/options_list.dart';

class OptionsPage extends StatefulWidget {
  OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Options"),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(228, 245, 245, 245),
      bottomNavigationBar: MyNavigationBar(),
      body: SafeArea(
        child: OptionsList(),
      ),
    );
  }
}

