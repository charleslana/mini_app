class AppModel {
  AppModel({
    required this.version,
    required this.versionApp,
    required this.author,
    required this.minis,
    required this.heroes,
    required this.boards,
    required this.patch,
    required this.rank,
  });

  AppModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    versionApp = json['versionApp'];
    author = json['author'];
    if (json['minis'] != null) {
      minis = <MiniModel>[];
      json['minis'].forEach((dynamic v) {
        minis.add(MiniModel.fromJson(v));
      });
    }
    if (json['heroes'] != null) {
      heroes = <HeroModel>[];
      json['heroes'].forEach((dynamic v) {
        heroes.add(HeroModel.fromJson(v));
      });
    }
    if (json['boards'] != null) {
      boards = <BoardsModel>[];
      json['boards'].forEach((dynamic v) {
        boards.add(BoardsModel.fromJson(v));
      });
    }
    if (json['patch'] != null) {
      patch = <PatchModel>[];
      json['patch'].forEach((dynamic v) {
        patch.add(PatchModel.fromJson(v));
      });
    }
    if (json['rank'] != null) {
      rank = <RankModel>[];
      json['rank'].forEach((dynamic v) {
        rank.add(RankModel.fromJson(v));
      });
    }
  }

  late String version;
  late String versionApp;
  late String author;
  late List<MiniModel> minis;
  late List<HeroModel> heroes;
  late List<BoardsModel> boards;
  late List<PatchModel> patch;
  late List<RankModel> rank;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['versionApp'] = versionApp;
    data['author'] = author;
    data['minis'] = minis.map((v) => v.toJson()).toList();
    data['heroes'] = heroes.map((v) => v.toJson()).toList();
    data['boards'] = boards.map((v) => v.toJson()).toList();
    data['patch'] = patch.map((v) => v.toJson()).toList();
    data['rank'] = rank.map((v) => v.toJson()).toList();
    return data;
  }
}

class MiniModel {
  MiniModel({
    required this.id,
    required this.name,
    required this.image,
    required this.skill,
    required this.abilities,
    required this.elixirCost,
    required this.damagePerHit,
    required this.energyCost,
    required this.initialEnergy,
    required this.stats,
  });

  MiniModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = TranslationModel.fromJson(json['name']);
    image = json['image'];
    skill = SkillModel.fromJson(json['skill']);
    if (json['abilities'] != null) {
      abilities = <AbilityModel>[];
      json['abilities'].forEach((dynamic v) {
        abilities.add(AbilityModel.fromJson(v));
      });
    }
    elixirCost = json['elixirCost'];
    damagePerHit = json['damagePerHit'];
    energyCost = json['energyCost'];
    initialEnergy = json['initialEnergy'];
    if (json['stats'] != null) {
      stats = <StatsMiniModel>[];
      json['stats'].forEach((dynamic v) {
        stats.add(StatsMiniModel.fromJson(v));
      });
    }
  }

  late int id;
  late TranslationModel name;
  late String image;
  late SkillModel skill;
  late List<AbilityModel> abilities;
  late int elixirCost;
  late int damagePerHit;
  late int energyCost;
  late int initialEnergy;
  late List<StatsMiniModel> stats;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name.toJson();
    data['image'] = image;
    data['skill'] = skill.toJson();
    data['abilities'] = abilities.map((v) => v.toJson()).toList();
    data['elixirCost'] = elixirCost;
    data['damagePerHit'] = damagePerHit;
    data['energyCost'] = energyCost;
    data['initialEnergy'] = initialEnergy;
    data['stats'] = stats.map((v) => v.toJson()).toList();
    return data;
  }
}

class TranslationModel {
  TranslationModel({
    required this.enUs,
    required this.ptBr,
  });

  TranslationModel.fromJson(Map<String, dynamic> json) {
    enUs = json['enUs'];
    ptBr = json['ptBr'];
  }

  late String enUs;
  late String ptBr;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enUs'] = enUs;
    data['ptBr'] = ptBr;
    return data;
  }
}

class SkillModel {
  SkillModel({
    required this.clash,
    required this.spr,
    required this.boast,
    required this.ko,
    required this.name,
    required this.description,
  });

  SkillModel.fromJson(Map<String, dynamic> json) {
    clash = json['clash'];
    spr = json['super'];
    boast = json['boast'];
    ko = json['ko'];
    name = TranslationModel.fromJson(json['name']);
    description = TranslationModel.fromJson(json['description']);
  }

  late bool clash;
  late bool spr;
  late bool boast;
  late bool ko;
  late TranslationModel name;
  late TranslationModel description;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clash'] = clash;
    data['super'] = spr;
    data['boast'] = boast;
    data['ko'] = ko;
    data['name'] = name.toJson();
    data['description'] = description.toJson();
    return data;
  }
}

class AbilityModel {
  AbilityModel({
    required this.star,
    required this.clash,
    required this.spr,
    required this.boast,
    required this.ko,
    required this.name,
    required this.description,
  });

  AbilityModel.fromJson(Map<String, dynamic> json) {
    star = json['star'];
    clash = json['clash'];
    spr = json['super'];
    boast = json['boast'];
    ko = json['ko'];
    name = TranslationModel.fromJson(json['name']);
    description = TranslationModel.fromJson(json['description']);
  }

  late int star;
  late bool clash;
  late bool spr;
  late bool boast;
  late bool ko;
  late TranslationModel name;
  late TranslationModel description;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['star'] = star;
    data['clash'] = clash;
    data['super'] = spr;
    data['boast'] = boast;
    data['ko'] = ko;
    data['name'] = name.toJson();
    data['description'] = description.toJson();
    return data;
  }
}

class StatsMiniModel {
  StatsMiniModel({
    required this.star,
    required this.hp,
    required this.hitPerSecond,
  });

  StatsMiniModel.fromJson(Map<String, dynamic> json) {
    star = json['star'];
    hp = json['hp'];
    hitPerSecond = json['hitPerSecond'];
  }

  late int star;
  late int hp;
  late double hitPerSecond;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['star'] = star;
    data['hp'] = hp;
    data['hitPerSecond'] = hitPerSecond;
    return data;
  }
}

class HeroModel {
  HeroModel({
    required this.id,
    required this.name,
    required this.image,
    required this.levels,
    required this.stats,
  });

  HeroModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = TranslationModel.fromJson(json['name']);
    image = json['image'];
    if (json['levels'] != null) {
      levels = <LevelModel>[];
      json['levels'].forEach((dynamic v) {
        levels.add(LevelModel.fromJson(v));
      });
    }
    if (json['stats'] != null) {
      stats = <StatsHeroModel>[];
      json['stats'].forEach((dynamic v) {
        stats.add(StatsHeroModel.fromJson(v));
      });
    }
  }

  late int id;
  late TranslationModel name;
  late String image;
  late List<LevelModel> levels;
  late List<StatsHeroModel> stats;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name.toJson();
    data['image'] = image;
    data['levels'] = levels.map((v) => v.toJson()).toList();
    data['stats'] = stats.map((v) => v.toJson()).toList();
    return data;
  }
}

class LevelModel {
  LevelModel({
    required this.level,
    required this.clash,
    required this.spr,
    required this.boast,
    required this.name,
    required this.description,
  });

  LevelModel.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    clash = json['clash'];
    spr = json['super'];
    boast = json['boast'];
    name = TranslationModel.fromJson(json['name']);
    description = TranslationModel.fromJson(json['description']);
  }

  late int level;
  late bool clash;
  late bool spr;
  late bool boast;
  late TranslationModel name;
  late TranslationModel description;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['clash'] = clash;
    data['super'] = spr;
    data['boast'] = boast;
    data['name'] = name.toJson();
    data['description'] = description.toJson();
    return data;
  }
}

class StatsHeroModel {
  StatsHeroModel({
    required this.level,
    required this.hp,
    required this.hitPerSecond,
    required this.damagePerHit,
    required this.energyCost,
    required this.initialEnergy,
  });

  StatsHeroModel.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    hp = json['hp'];
    hitPerSecond = json['hitPerSecond'];
    damagePerHit = json['damagePerHit'];
    energyCost = json['energyCost'];
    initialEnergy = json['initialEnergy'];
  }

  late int level;
  late int hp;
  late double hitPerSecond;
  late int damagePerHit;
  late int energyCost;
  late int initialEnergy;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['hp'] = hp;
    data['hitPerSecond'] = hitPerSecond;
    data['damagePerHit'] = damagePerHit;
    data['energyCost'] = energyCost;
    data['initialEnergy'] = initialEnergy;
    return data;
  }
}

class BoardsModel {
  BoardsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.trophiesRequired,
  });

  BoardsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = TranslationModel.fromJson(json['name']);
    description = TranslationModel.fromJson(json['description']);
    image = json['image'];
    trophiesRequired = json['trophiesRequired'];
  }

  late int id;
  late TranslationModel name;
  late TranslationModel description;
  late String image;
  late int trophiesRequired;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name.toJson();
    data['description'] = description.toJson();
    data['image'] = image;
    data['trophiesRequired'] = trophiesRequired;
    return data;
  }
}

class PatchModel {
  PatchModel({
    required this.id,
    required this.date,
    required this.description,
  });

  PatchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    description = TranslationModel.fromJson(json['description']);
  }

  late int id;
  late String date;
  late TranslationModel description;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['description'] = description.toJson();
    return data;
  }
}

class RankModel {
  RankModel({
    required this.id,
    required this.name,
    required this.trophies,
  });

  RankModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = TranslationModel.fromJson(json['name']);
    trophies = json['trophies'];
  }

  late int id;
  late TranslationModel name;
  late int trophies;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name.toJson();
    data['trophies'] = trophies;
    return data;
  }
}
