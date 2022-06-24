import 'package:flutter/material.dart';
import 'package:winrateforlol_app/models/initial_data.dart';
import 'package:winrateforlol_app/models/options_handler.dart';
import 'package:winrateforlol_app/models/preferences_handler.dart';
import 'package:winrateforlol_app/pages/results_page.dart';
import 'package:winrateforlol_app/pages/search_page.dart';
import 'package:winrateforlol_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initOptions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialAppOld();
        } else {
          return const MaterialApp(
            home:  Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}

class MaterialAppOld extends StatelessWidget {
  const MaterialAppOld({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      //home: SearchPage(),
      initialRoute: (OptionsHandler.defaultPagePerfil)
          ? RoutesNames.accountPage
          : RoutesNames.searchPage,
      debugShowCheckedModeBanner: false,
      routes: Routes.list,
    );
  }
}

Future initOptions() async {
  //TODO:Cargar todo aqui y ponerlo en el FutureBuilder
  await OptionsHandler.initOptions();
  await PreferenceHandler.initHistory();
  await ChampionDataHandler.initChampionsList();
  print("postInitOptionsCharged");
}
