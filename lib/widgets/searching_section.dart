import 'package:flutter/material.dart';
import 'package:winrateforlol_app/models/preferences_handler.dart';
import 'package:winrateforlol_app/pages/results_page.dart';

class SearchingSection extends StatelessWidget {
  String nameSummoner = "";
  SearchingSection({
    Key? key,
  }) : super(key: key);

  void _showResultsPage(BuildContext context) async{
    //creando la ruta hacia la pagina de resultados
    //TODO: leer string del textfield
    final Route route = PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            ResultsPage(summonerName: nameSummoner),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero);
    await Navigator.push(context, route);
    
  }

  void _saveNameInPreferences() async{
    //PreferenceHandler.setExample(nameSummoner);
    PreferenceHandler.setJsonExample(nameSummoner);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xff90a4ae),
        ),
      ),
      child: Row(
        children: [
          //TODO:mostrar dialogo para cambiar de region
          TextButton(child: Text("LAN"), onPressed: () {}),
          Expanded(
            child: TextField(
              autocorrect: false,
              onChanged: (value) {
                nameSummoner = value;
                print(nameSummoner);
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                //border: OutlineInputBorder(),
                border: InputBorder.none,
                hintText: "Search a summoner"
              ),
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
          ),
          IconButton(
            onPressed: () {
              if (nameSummoner.length>2) {
                _saveNameInPreferences();
                _showResultsPage(context);
              } else {
                //TODO:hacer q funcione
                AlertDialog(
                  title: Text("Debes escribir un nombre en el cuadro de bsuqueda"),
                );
              }
              
            },
            icon: Icon(Icons.search_sharp, color:Colors.blueGrey,),
          )
        ],
      ),
    );
  }
}
