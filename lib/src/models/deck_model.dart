class DeckModel {
  DeckModel({
    required this.decks,
  });

  DeckModel.fromJson(Map<String, dynamic> json) {
    if (json['decks'] != null) {
      decks = <DeckMinisModel>[];
      json['decks'].forEach((dynamic v) {
        decks.add(DeckMinisModel.fromJson(v));
      });
    }
  }

  late List<DeckMinisModel> decks = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['decks'] = decks.map((v) => v.toJson()).toList();
    return data;
  }
}

class DeckMinisModel {
  DeckMinisModel({
    required this.name,
    required this.heroId,
    required this.minisId,
  });

  DeckMinisModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    heroId = json['heroId'];
    minisId = json['minisId'].cast<int>();
  }

  late String name;
  late int heroId;
  late List<int> minisId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['heroId'] = heroId;
    data['minisId'] = minisId;
    return data;
  }
}
