class InitialData {
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
      championId: 49,
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
