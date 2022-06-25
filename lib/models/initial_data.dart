// ignore_for_file: unused_field

import 'dart:io';
import 'dart:convert' show jsonDecode, jsonEncode, utf8;

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class InitialData {
  static List<ChampionData> championsInitialData = [
    ChampionData(
      championId: 12,
      wins: 32,
      losses: 12,
    ),
    ChampionData(
      championId: 18,
      wins: 50,
      losses: 51,
    ),
    ChampionData(
      championId: 23,
      wins: 32,
      losses: 12,
    ),
    ChampionData(
      championId: 45,
      wins: 32,
      losses: 12,
    ),
    ChampionData(
      championId: 91,
      wins: 32,
      losses: 12,
    ),
    ChampionData(
      championId: 76,
      wins: 32,
      losses: 12,
    ),
    ChampionData(
      championId: 4,
      wins: 32,
      losses: 12,
    ),
  ];

  static String getPerCent(ChampionData champion){
    return '${(champion.wins*100/(champion.losses + champion.wins)).round().toString()} %';
  }
}

class ChampionData {
  ChampionData({
    required this.championId,
    required this.wins,
    required this.losses,
  });
  final int championId;
  final int wins;
  final int losses;
}

abstract class ChampionDataHandler{
  //TODO: crear clase con un cosntructor y enviarle los datos importantes o nose
  static List<Champion> championList = [];
  static const String _linkVersions = 'https://ddragon.leagueoflegends.com/api/versions.json';
  static String actualVersion = "0.0.1";
  String _linkChampionIcon = 'https://ddragon.leagueoflegends.com/cdn/$actualVersion/img/champion/Renata.png';
  static String _championDataLink = 'https://ddragon.leagueoflegends.com/cdn/$actualVersion/data/en_US/champion.json';
  
  static Future getLastVersion() async{
    //TODO: guardar dato en shared prefences para hacer comparacion y ni hacer otro request de camepones si es el mismo
    try {
      var dio = Dio();
      var response = await dio.get(_linkVersions);
      var result = response.data;
      actualVersion = result[0];
      /*HttpClient client = HttpClient();
      HttpClientRequest request = await client.getUrl(Uri.parse(_linkVersions));
      
      HttpClientResponse response = await request.close();
      var _response = await response.transform(utf8.decoder).join();
      actualVersion = jsonDecode(_response)[0];
      client.close();*/
    } catch (e) {
      print("Error en la recopilacion de la ultima version");
      print(_linkVersions);
      print(actualVersion);
      print(e);
    }
  }

  static Future getChampionsList() async{
    try {
      var dio = Dio();
      var response = await dio.get(_championDataLink);
      var result = response.data;
      Map _responseDecode = result["data"];
      /*HttpClient client = HttpClient();
      HttpClientRequest request = await client.getUrl(Uri.parse(_championDataLink));
      HttpClientResponse response = await request.close();
      var _response = await response.transform(utf8.decoder).join();
      client.close();*/
      //Map _responseDecode = jsonDecode(_response)["data"];

      List<String> championKeyList = _responseDecode.keys.map((e) => e.toString()).toList();
      
      for (var key in championKeyList) {
        championList.add(Champion(id: key, key: _responseDecode[key]["key"], name: _responseDecode[key]["name"]));
      }
      var json = jsonEncode(List<dynamic>.from(championList.map((x) => x.toJson())));
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("championsList", json);
    } catch (e) {
      print("Error en la recopilacion de datos de campeones");
      print(_championDataLink);
      print(e);
    }
  }


  static initChampionsList() async{
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('championsList')) {
      String jsonString = prefs.getString('championsList')!;
      List json = jsonDecode(jsonString);
      championList = json.map((e) => Champion(id: e["id"], key: e["key"], name: e["name"])).toList();
    } else {
      await getLastVersion();
      await getChampionsList();
    }
  }

  static String getChampById(int id){
    for (var champ in championList) {
      if (id.toString() == champ.key) {
        return champ.id;
      }
    }
    return "NO DATA CHAMP";
  }
}

class Champion {
    Champion({
        required this.id,
        required this.key,
        required this.name,
    });

    Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "name": name,
    };

    final String id;
    final String key;
    final String name;
}
