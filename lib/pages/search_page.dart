import 'package:flutter/material.dart';
import 'package:winrateforlol_app/models/preferences_handler.dart';
import 'package:winrateforlol_app/widgets/google_nav.dart';
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
    //TODO:evitar fallos cuando no hay nada guardado
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 245, 245, 245),
      bottomNavigationBar: GoogleNavBar(position: 1),//MyNavigationBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          //width: double.infinity,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchingSection(),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffc1d5e0),
                  border: Border.all(
                    width: 1,
                    color: Color(0xff62757f),
                  ),
                ),
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 20),
                //width: double.infinity,
                child: Column(
                  children: List.generate(
                    PreferenceHandler.searchHistory.length,
                    (index) => Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("Lan"),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 25,
                                    color: Color(0xff62757f),
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    child: Text(
                                      PreferenceHandler.searchHistory[index],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
