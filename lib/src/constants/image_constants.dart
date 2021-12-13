class ImageConstants {
  static const String logo = 'assets/images/logo_mini_app.png';
  static const String landing = 'assets/images/landing.jpg';
  static const String iconBowler = 'assets/images/icons/bowler.png';
  static const String iconElectroWizard =
      'assets/images/icons/electro_wizard.png';
  static const String iconMiner = 'assets/images/icons/miner.png';
  static const String iconArcher = 'assets/images/icons/archer.png';
  static const String iconLumberjack = 'assets/images/icons/lumberjack.png';
  static const String iconPekka = 'assets/images/icons/p_e_k_k_a.png';
  static const String iconSkeletonGuard =
      'assets/images/icons/skeleton_guard.png';
  static const String iconValkyrie = 'assets/images/icons/valkyrie.png';
  static const String iconCountess = 'assets/images/icons/countess.png';
  static const String iconSpearGoblin = 'assets/images/icons/spear_goblin.png';
  static const String iconElixir = 'assets/images/icons/elixir.png';
  static const String iconDiscord = 'assets/images/icons/discord.png';
  static const String background = 'assets/images/background.png';

  String getHeroThumbnail(String image) {
    return 'assets/images/heroes/thumbnail/$image.png';
  }

  String getMiniThumbnail(String image) {
    return 'assets/images/minis/thumbnail/$image.png';
  }

  String getHeroPortrait(String image) {
    return 'assets/images/heroes/portrait/$image.png';
  }

  String getMiniPortrait(String image) {
    return 'assets/images/minis/portrait/$image.png';
  }
}
