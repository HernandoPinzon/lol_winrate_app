import 'package:flutter/material.dart';
import 'package:winrateforlol_app/widgets/navigation_bar.dart';

class OptionsPage extends StatefulWidget {
  OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 245, 245, 245),
      bottomNavigationBar: MyNavigationBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Options page")
            ],
          ),
        ),
      ),
    );
  }
}