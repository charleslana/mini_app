enum TypeFavorite { mini, hero }

class FavoriteModel {
  FavoriteModel({required this.favorites});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['favorites'] != null) {
      favorites = <Favorite>[];
      json['favorites'].forEach((dynamic v) {
        favorites.add(Favorite.fromJson(v));
      });
    }
  }

  late List<Favorite> favorites = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorites'] = favorites.map((v) => v.toJson()).toList();
    return data;
  }
}

class Favorite {
  Favorite({
    required this.index,
    required this.type,
  });

  Favorite.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    type = json['type'] != null
        ? TypeFavorite.values.elementAt(json['type'])
        : null;
  }

  late final int? index;
  late final TypeFavorite? type;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['type'] = type!.index;
    return data;
  }
}
