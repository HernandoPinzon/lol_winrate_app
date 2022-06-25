// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:winrateforlol_app/models/initial_data.dart';
import 'package:winrateforlol_app/widgets/navigation_bar.dart';

class ResultsPage extends StatefulWidget {
  //TODO:usar el summoner name
  final String summonerName;
  ResultsPage({Key? key, required this.summonerName}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.replay_outlined, color: Colors.black),
        backgroundColor: Color(0xff90a4ae),
      ),

      //guardar color en otro lugar
      backgroundColor: Color.fromARGB(228, 245, 245, 245),
      appBar: AppBar(
        //la sombra del abbbar
        elevation: 0,
        //boton de volver atras
        
        leading:  IconButton(
          onPressed: () async{
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              print("no hay pagina para volver atras");
              await ChampionDataHandler.getLastVersion();
              await ChampionDataHandler.initChampionsList();
              print("finLlamadas");
            }
          },
          //TODO:hacer esto pero con una variable
          icon: Navigator.canPop(context)?const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ):const Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
          ),
        ),
        //agregar color en otro lugar para acceder mas facilmente
        backgroundColor: Color(0xff90a4ae),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.summonerName}'),
            const Text(
              "50% (30V 30L)",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),

      body: ListView.builder(
        itemCount: InitialData.championsInitialData.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text(ChampionDataHandler.getChampById(InitialData.championsInitialData[i].championId)),
            subtitle: Text(
              (InitialData.championsInitialData[i].losses +
                          InitialData.championsInitialData[i].wins)
                      .toString() +
                  " games winrate:" +
                  InitialData.getPerCent(InitialData.championsInitialData[i]),
            ),
            trailing: Container(
              child: Image.network("https://ddragon.leagueoflegends.com/cdn/12.12.1/img/champion/"+ChampionDataHandler.getChampById(InitialData.championsInitialData[i].championId)+".png"),
              width: 40,
              height: 40,
            ),
            onTap: () {
              print("me tapiaron");
            },
          );
        },
      ),
    );
  }
}
