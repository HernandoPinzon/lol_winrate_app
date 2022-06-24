import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              OptionsList(),
              LineSeparator(),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shadowColor: Colors.redAccent,
                      padding: EdgeInsets.symmetric( horizontal: 30, vertical: 10)
                    ),
                    onPressed: () async{
                      var prefs = await SharedPreferences.getInstance();
                      await prefs.clear();
                      print("Limpiado");
                    },
                    child: Column(
                      //TODO: agregarle un alert para verficar que no le den por error(tal vez con un contador)
                      children: [
                        Text(
                          "Eliminar Datos",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
