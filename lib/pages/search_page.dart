import 'package:flutter/material.dart';
import 'package:winrateforlol_app/models/preferences_handler.dart';
import 'package:winrateforlol_app/widgets/navigation_bar.dart';
import 'package:winrateforlol_app/widgets/searching_section.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> example = ["no cargo", "no cargo"];
  @override
  void initState() {
    _loadPreferences();
    super.initState();
  }

  void _loadPreferences() async {
    example = await PreferenceHandler.getJsonExample();
    //PreferenceHandler.printJsonExample();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 245, 245, 245),
      bottomNavigationBar: MyNavigationBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          //width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchingSection(),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.amber,
                width: 200,
                child: Column(
                  children: List.generate(
                    example.length,
                    (index) => Text(example[index]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
