enum TypeFavorite { mini, hero }

class FavoriteModel {
  FavoriteModel({
    required this.favorites,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['favorites'] != null) {
      favorites = <FavoriteMinisModel>[];
      json['favorites'].forEach((dynamic v) {
        favorites.add(FavoriteMinisModel.fromJson(v));
      });
    }
  }

  late List<FavoriteMinisModel> favorites = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorites'] = favorites.map((v) => v.toJson()).toList();
    return data;
  }
}

class FavoriteMinisModel {
  FavoriteMinisModel({
    required this.index,
    required this.type,
  });

  FavoriteMinisModel.fromJson(Map<String, dynamic> json) {
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
