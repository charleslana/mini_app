class MiniModel {
  MiniModel({
    required this.version,
    required this.versionApp,
    required this.author,
    required this.minis,
    required this.heroes,
    required this.maps,
    required this.patch,
    required this.rank,
    required this.deck,
  });

  MiniModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    versionApp = json['versionApp'];
    author = json['author'];
    if (json['minis'] != null) {
      minis = <Minis>[];
      json['minis'].forEach((dynamic v) {
        minis.add(Minis.fromJson(v));
      });
    }
    if (json['heroes'] != null) {
      heroes = <Heroes>[];
      json['heroes'].forEach((dynamic v) {
        heroes.add(Heroes.fromJson(v));
      });
    }
    if (json['maps'] != null) {
      maps = <Maps>[];
      json['maps'].forEach((dynamic v) {
        maps.add(Maps.fromJson(v));
      });
    }
    if (json['patch'] != null) {
      patch = <Patches>[];
      json['patch'].forEach((dynamic v) {
        patch.add(Patches.fromJson(v));
      });
    }
    if (json['rank'] != null) {
      rank = <Rank>[];
      json['rank'].forEach((dynamic v) {
        rank.add(Rank.fromJson(v));
      });
    }
    if (json['deck'] != null) {
      deck = <Deck>[];
      json['deck'].forEach((dynamic v) {
        deck.add(Deck.fromJson(v));
      });
    }
  }

  late String version;
  late String versionApp;
  late String author;
  late List<Minis> minis;
  late List<Heroes> heroes;
  late List<Maps> maps;
  late List<Patches> patch;
  late List<Rank> rank;
  late List<Deck> deck;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['versionApp'] = versionApp;
    data['author'] = author;
    data['minis'] = minis.map((v) => v.toJson()).toList();
    data['heroes'] = heroes.map((v) => v.toJson()).toList();
    data['maps'] = maps.map((v) => v.toJson()).toList();
    data['patch'] = patch.map((v) => v.toJson()).toList();
    data['rank'] = rank.map((v) => v.toJson()).toList();
    data['deck'] = deck.map((v) => v.toJson()).toList();
    return data;
  }
}

class Minis {
  Minis({
    required this.id,
    required this.name,
    required this.image,
    required this.skill,
    required this.abilities,
    required this.elixirCost,
    required this.damagePerHit,
    required this.energyCost,
    required this.stats,
  });

  Minis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = Name.fromJson(json['name']);
    image = json['image'];
    skill = Skill.fromJson(json['skill']);
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((dynamic v) {
        abilities.add(Abilities.fromJson(v));
      });
    }
    elixirCost = json['elixirCost'];
    damagePerHit = json['damagePerHit'];
    energyCost = json['energyCost'];
    if (json['stats'] != null) {
      stats = <StatsMini>[];
      json['stats'].forEach((dynamic v) {
        stats.add(StatsMini.fromJson(v));
      });
    }
  }

  late int id;
  late Name name;
  late String image;
  late Skill skill;
  late List<Abilities> abilities;
  late int elixirCost;
  late int damagePerHit;
  late int energyCost;
  late List<StatsMini> stats;

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
    data['stats'] = stats.map((v) => v.toJson()).toList();
    return data;
  }
}

class Name {
  Name({
    required this.enUs,
    required this.ptBr,
  });

  Name.fromJson(Map<String, dynamic> json) {
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

class Skill {
  Skill({
    required this.clash,
    required this.spr,
    required this.boast,
    required this.ko,
    required this.name,
    required this.description,
  });

  Skill.fromJson(Map<String, dynamic> json) {
    clash = json['clash'];
    spr = json['super'];
    boast = json['boast'];
    ko = json['ko'];
    name = Name.fromJson(json['name']);
    description = Name.fromJson(json['description']);
  }

  late bool clash;
  late bool spr;
  late bool boast;
  late bool ko;
  late Name name;
  late Name description;

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

class Abilities {
  Abilities({
    required this.star,
    required this.clash,
    required this.spr,
    required this.boast,
    required this.ko,
    required this.name,
    required this.description,
  });

  Abilities.fromJson(Map<String, dynamic> json) {
    star = json['star'];
    clash = json['clash'];
    spr = json['super'];
    boast = json['boast'];
    ko = json['ko'];
    name = Name.fromJson(json['name']);
    description = Name.fromJson(json['description']);
  }

  late int star;
  late bool clash;
  late bool spr;
  late bool boast;
  late bool ko;
  late Name name;
  late Name description;

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

class StatsMini {
  StatsMini({
    required this.star,
    required this.hp,
    required this.hitPerSecond,
  });

  StatsMini.fromJson(Map<String, dynamic> json) {
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

class Heroes {
  Heroes({
    required this.id,
    required this.name,
    required this.image,
    required this.levels,
    required this.stats,
  });

  Heroes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = Name.fromJson(json['name']);
    image = json['image'];
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((dynamic v) {
        levels.add(Levels.fromJson(v));
      });
    }
    if (json['stats'] != null) {
      stats = <StatsHero>[];
      json['stats'].forEach((dynamic v) {
        stats.add(StatsHero.fromJson(v));
      });
    }
  }

  late int id;
  late Name name;
  late String image;
  late List<Levels> levels;
  late List<StatsHero> stats;

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

class Levels {
  Levels({
    required this.level,
    required this.clash,
    required this.spr,
    required this.boast,
    required this.name,
    required this.description,
  });

  Levels.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    clash = json['clash'];
    spr = json['super'];
    boast = json['boast'];
    name = Name.fromJson(json['name']);
    description = Name.fromJson(json['description']);
  }

  late int level;
  late bool clash;
  late bool spr;
  late bool boast;
  late Name name;
  late Name description;

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

class StatsHero {
  StatsHero({
    required this.level,
    required this.hp,
    required this.hitPerSecond,
    required this.damagePerHit,
    required this.energyCost,
  });

  StatsHero.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    hp = json['hp'];
    hitPerSecond = json['hitPerSecond'];
    damagePerHit = json['damagePerHit'];
    energyCost = json['energyCost'];
  }

  late int level;
  late int hp;
  late double hitPerSecond;
  late int damagePerHit;
  late int energyCost;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['hp'] = hp;
    data['hitPerSecond'] = hitPerSecond;
    data['damagePerHit'] = damagePerHit;
    data['energyCost'] = energyCost;
    return data;
  }
}

class Maps {
  Maps({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.trophiesRequired,
  });

  Maps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = Name.fromJson(json['name']);
    description =
        json['description'] != null ? Name.fromJson(json['description']) : null;
    image = json['image'];
    trophiesRequired = json['trophiesRequired'];
  }

  late int id;
  late Name name;
  late Name? description;
  late String image;
  late int trophiesRequired;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name.toJson();
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['image'] = image;
    data['trophiesRequired'] = trophiesRequired;
    return data;
  }
}

class Patches {
  Patches({
    required this.id,
    required this.date,
    required this.description,
  });

  Patches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    description = Name.fromJson(json['description']);
  }

  late int id;
  late String date;
  late Name description;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['description'] = description.toJson();
    return data;
  }
}

class Rank {
  Rank({
    required this.id,
    required this.name,
    required this.trophies,
  });

  Rank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = Name.fromJson(json['name']);
    trophies = json['trophies'];
  }

  late int id;
  late Name name;
  late int trophies;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name.toJson();
    data['trophies'] = trophies;
    return data;
  }
}

class Deck {
  Deck({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.heroId,
    required this.minisId,
  });

  Deck.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = Name.fromJson(json['name']);
    description = Name.fromJson(json['description']);
    image = json['image'];
    heroId = json['heroId'];
    minisId = json['minisId'].cast<int>();
  }

  late int id;
  late Name name;
  late Name description;
  late String image;
  late int heroId;
  late List<int> minisId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name.toJson();
    data['description'] = description.toJson();
    data['image'] = image;
    data['heroId'] = heroId;
    data['minisId'] = minisId;
    return data;
  }
}
