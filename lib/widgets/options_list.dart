import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winrateforlol_app/models/options_handler.dart';

class OptionsList extends StatefulWidget {
  OptionsList({
    Key? key,
  }) : super(key: key);

  @override
  State<OptionsList> createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList> {
  bool _exampleEnable = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                value: _exampleEnable,
                onChanged: (bool value) {
                  setState(() {
                    _exampleEnable = value;
                  });
                },
              ),
            ],
          ),
          const LineSeparator(),
          SwitchListTile(
            value: OptionsHandler.defaultPagePerfil,
            title: const Text(
              "Mostrar tu perfil como pagina por defecto",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              "Un subtitulo de example",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            onChanged: (bool value) {
              setState(() {
                OptionsHandler.defaultPagePerfil = value;
              });
            },
          ),
          const LineSeparator(),
          SwitchListTile(
            value: OptionsHandler.showOnlyRankedsDefault,
            title: const Text(
              "Mostrar solo rankeds por defecto",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              "Si esta activado mostrara por defecto solo resultados de rankeds, cuando esta desactivado muestra resultados de todas las partidas",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            onChanged: (bool value) {
              setState(() {
                OptionsHandler.showOnlyRankedsDefault = value;
              });
            },
          ),
          const LineSeparator(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Tipo de resultado por default",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  //TODO:Cambiar esto por numeros y cambiar el dropdown por algo mejor
                  value: OptionsHandler.showDefaultResults,
                  items: OptionsHandler.showDefaultResultsOptions
                      .map((e) => DropdownMenuItem<String>(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    OptionsHandler.showDefaultResults =
                        value ?? OptionsHandler.showDefaultResults;
                    setState(() {});
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LineSeparator extends StatelessWidget {
  const LineSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 1,
      color: Colors.black45,
    );
  }
}
