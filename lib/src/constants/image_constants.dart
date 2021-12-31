import 'dart:math';

class ImageConstants {
  static const String logo = 'assets/images/db_mini_logo.png';
  static const String landing = 'assets/images/landing.jpg';
  static const String iconCollection = 'assets/images/icons/collection.png';
  static const String iconDecks = 'assets/images/icons/decks.png';
  static const String iconFavorites = 'assets/images/icons/favorites.png';
  static const String iconBoards = 'assets/images/icons/boards.png';
  static const String iconPatch = 'assets/images/icons/patch.png';
  static const String iconHeroes = 'assets/images/icons/heroes.png';
  static const String iconMinis = 'assets/images/icons/minis.png';
  static const String iconFavoritesDeck =
      'assets/images/icons/favorites_deck.png';
  static const String iconFavoritesMinis =
      'assets/images/icons/favorites_minis.png';
  static const String iconElixir = 'assets/images/icons/elixir.png';
  static const String iconDiscord = 'assets/images/icons/discord.png';
  static const String background = 'assets/images/background.png';
  static const String heroHidden = 'assets/images/hero_hidden.png';
  static const String miniHidden = 'assets/images/mini_hidden.png';

  String randomHeroIcon() {
    final List<String> list = [
      'archer_queen',
      'barbarian_king',
      'countess',
      'monk',
      'royal_champion',
      'shield_maiden',
    ];
    final random = Random();
    final icon = list[random.nextInt(list.length)];
    return 'assets/images/heroes/icon/$icon.png';
  }

  String randomMiniIcon() {
    final List<String> list = [
      'archer',
      'barbarian',
      'battle_healer',
      'bowler',
      'dart_goblin',
      'electro_wizard',
      'giant_skeleton',
      'healing_ranger',
      'ice_wizard',
      'knight',
      'lumberjack',
      'magic_archer',
      'mega_knight',
      'miner',
      'mini_pekka',
      'musketeer',
      'pekka',
      'prince',
      'skeleton_guard',
      'spear_goblin',
      'valkyrie',
      'wizard',
    ];
    final random = Random();
    final icon = list[random.nextInt(list.length)];
    return 'assets/images/minis/icon/$icon.png';
  }

  String getHeroIcon(String image) {
    return 'assets/images/heroes/icon/$image.png';
  }

  String getMiniIcon(String image) {
    return 'assets/images/minis/icon/$image.png';
  }

  String getHeroPortrait(String image) {
    return 'assets/images/heroes/portrait/$image.png';
  }

  String getMiniPortrait(String image) {
    return 'assets/images/minis/portrait/$image.png';
  }

  String getIcon(String image) {
    return 'assets/images/icons/$image.png';
  }

  String getBoards(String image) {
    return 'assets/images/boards/$image.png';
  }
}
