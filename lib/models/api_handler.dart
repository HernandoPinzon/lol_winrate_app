import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ApiHandler {
  static const baseUrl = 'https://prueba1.hnunez.workers.dev';
  static const baseUrlLocal = 'http://127.0.0.1:8787';
}

abstract class SummonerData {
  static Summoner actualSummoner = Summoner(name: "NODATA", puuid: "NODATA");
  static bool exist = false;
  static List<Summoner> summonersHistory = [];

  static Future<bool> searchHistory(String summonerString) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('summonersData')) {
      String jsonString = prefs.getString('summonersData')!;
      //TODO: revisar si sirve
      List<dynamic> json = jsonDecode(jsonString);
      summonersHistory = json
          .map((e) => Summoner(
                name: e['name']!,
                puuid: e['puuid']!,
              ))
          .toList();
      bool found = false;
      int foundPosition = -1;
      for (int i = 0; i < summonersHistory.length; i++) {
        if (summonersHistory[i].name == summonerString) {
          foundPosition = i;
          found = true;
        }
      }
      if (found) {
        actualSummoner = summonersHistory[foundPosition];
        return true;
      } else {
        print("No se encontro la data entre los summoners guardados");
        exist = await getSummonerDataFromApi(summonerString);
        if (exist) {
          saveSummonersInPrefs(actualSummoner, prefs);
        }
        return exist;
      }
    } else {
      print("No se encontro la data en shared preferences");
      exist = await getSummonerDataFromApi(summonerString);
      if (exist) {
        saveSummonersInPrefs(actualSummoner, prefs);
      }
      return exist;
    }
  }

  static saveSummonersInPrefs(Summoner summoner, SharedPreferences prefs) {
    summonersHistory.add(summoner);
    print("Se va a guardar la data en las shared");
    prefs.setString(
      'summonersData',
      jsonEncode(
        summonersHistory.map((e) => e.toJson()).toList(),
      ),
    );
  }

  static Future<bool> getSummonerDataFromApi(String summoner) async {
    const String url = '${ApiHandler.baseUrl}/summoner';
    var dio = Dio();
    dio.options.headers['summonerName'] = summoner;
    print("Se buscara la data en la API");
    var response;
    try {
      response = await dio.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Se encontro la data en la API");
        print(response.data);
        String puuid = jsonDecode(response.data)['puuid'];
        String name = jsonDecode(response.data)['name'];
        print('se creo el summoner');
        actualSummoner = Summoner(name: name, puuid: puuid);
        return true;
      } else {
        print("No se encontro el nombre de invocador en la API");
        return false;
      }
    } on DioError catch (e, tree) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          //TODO: Mostrar visualmente q no se encontro el summoner
          print('No se encontro el summoner');
        } else {
          print('algo paso en el dio');
        }
      } else {
        print(e);
      }
      return false;
    }
  }
}

class Summoner {
  final String name;
  final String puuid;
  Summoner({required this.name, required this.puuid});

  Map<String, String> toJson() => {'name': name, 'puuid': puuid};
}

abstract class AccountSummonerData {
  static Summoner summoner = Summoner(name: "NODATA", puuid: "NODATA");
  static bool exist = false;

  static initAccountData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('accountData')) {
      String jsonString = prefs.getString('accountData')!;
      Map<String, String> json = jsonDecode(jsonString);
      if (json.containsKey('name')) {
        summoner = Summoner(name: json['name']!, puuid: json['puuid']!);
        exist = true;
      } else {
        exist = false;
      }
    } else {
      exist = false;
    }
  }
}
