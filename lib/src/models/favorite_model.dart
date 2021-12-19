enum TypeFavorite { mini, hero }

class FavoriteModel {
  FavoriteModel({
    required this.favorites,
    required this.favoritesDeck,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['favorites'] != null) {
      favorites = <FavoriteMiniModel>[];
      json['favorites'].forEach((dynamic v) {
        favorites.add(FavoriteMiniModel.fromJson(v));
      });
    }
    if (json['favoritesDeck'] != null) {
      favoritesDeck = <FavoriteDeckModel>[];
      json['favoritesDeck'].forEach((dynamic v) {
        favoritesDeck.add(FavoriteDeckModel.fromJson(v));
      });
    }
  }

  late List<FavoriteMiniModel> favorites = [];
  late List<FavoriteDeckModel> favoritesDeck = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorites'] = favorites.map((v) => v.toJson()).toList();
    data['favoritesDeck'] = favoritesDeck.map((v) => v.toJson()).toList();
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
    required this.name,
    required this.heroId,
    required this.minisId,
  });

  FavoriteDeckModel.fromJson(Map<String, dynamic> json) {
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
