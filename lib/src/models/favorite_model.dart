enum TypeFavorite { mini, hero }

class FavoriteModel {
  FavoriteModel({required this.favorites});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['favorites'] != null) {
      favorites = <FavoriteMiniModel>[];
      json['favorites'].forEach((dynamic v) {
        favorites.add(FavoriteMiniModel.fromJson(v));
      });
    }
  }

  late List<FavoriteMiniModel> favorites = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorites'] = favorites.map((v) => v.toJson()).toList();
    return data;
  }
}

class FavoriteMiniModel {
  FavoriteMiniModel({
    required this.index,
    required this.type,
  });

  FavoriteMiniModel.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    type = TypeFavorite.values.elementAt(json['type']);
  }

  late int index;
  late TypeFavorite type;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['type'] = type.index;
    return data;
  }
}

class FavoriteDeckModel {
  FavoriteDeckModel({
    required this.index,
    required this.heroId,
    required this.minisId,
  });

  FavoriteDeckModel.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    heroId = json['heroId'];
    minisId = json['minisId'].cast<int>();
  }

  late int index;
  late int heroId;
  late List<int> minisId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['heroId'] = heroId;
    data['minisId'] = minisId;
    return data;
  }
}
