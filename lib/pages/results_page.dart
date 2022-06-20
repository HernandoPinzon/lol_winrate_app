import 'package:flutter/material.dart';
import 'package:winrateforlol_app/models/initialData.dart';
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
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              print("no hay pagina para volver atras");
            }
          },
          //TODO:hacer esto pero con una variable
          icon: Navigator.canPop(context)?Icon(
            Icons.arrow_back,
            color: Colors.black,
          ):Icon(
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
            Text(
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
            title: Text(
                InitialData.championsInitialData[i].championId.toString() +
                    " champ"),
            subtitle: Text(
              (InitialData.championsInitialData[i].losses +
                          InitialData.championsInitialData[i].wins)
                      .toString() +
                  " games winrate:" +
                  InitialData.getPerCent(InitialData.championsInitialData[i]),
            ),
            trailing: Container(
              color: Colors.black,
              width: 20,
              height: 20,
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
