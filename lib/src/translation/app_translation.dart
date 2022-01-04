class AppTranslation {
  Map<String, Map<String, String>> translationsKeys = {
    'en_US': enUS,
    'pt_BR': ptBR,
    'es_ES': esES,
  };
}

final Map<String, String> enUS = {
  'languageCode': 'en',
  'languageEnglish': 'English',
  'languagePortuguese': 'Portuguese',
  'languageSpanish': 'Spanish',
  'splashscreenTitle': 'Database, minis and heroes',
  'splashscreenVersion': 'Version @version',
  'splashscreenCreatedBy': 'Created by @name',
  'landingInfo': 'Waiting for database information',
  'landingConnection': 'Make sure you have an internet connection.',
  'landingError': 'An error occurred. Please try again.',
  'landingUpdate': 'There is a new update available, please update your app.',
  'utilsDialogNameInput': 'Type your name',
  'utilsDialogNameInputEmpty': 'Please enter your name.',
  'utilsDialogNameInputMaxCharacters':
      'Your name must contain a maximum of 20 characters.',
  'utilsDialogNameButton': 'Continue',
  'utilsDialogEditNameButton': 'Edit',
  'utilsDialogLanguage': 'Change language',
  'utilsDialogNameDeckInput': 'Enter your deck name',
  'utilsDialogNameDeckButton': 'Save',
  'utilsDialogNameDeckInputEmpty': 'Please enter your deck name',
  'utilsDialogNameDeckInputMaxCharacters':
      'The deck name must contain a maximum of 30 characters.',
  'homePageCollection': 'Collection',
  'homePageTierList': 'Tier List',
  'homePageFavorites': 'Favorites',
  'homePageRank': 'Rank',
  'homePagePatch': 'Patch',
  'favoritesDiscord': 'Join our Discord!',
  'favorites': 'Favorites',
  'favoritesTabDecks': 'Decks (@value)',
  'favoritesTabMinis': 'Minis (@value)',
  'favoritesMiniNotFound': 'No favorite minis found.',
  'favoritesDeckNotFound': 'No favorite decks found.',
  'favoritesDeckNewDeck': 'New Deck',
  'favoritesDeckDialogTitle': 'Remove',
  'favoritesDeckDialogMiddleText': 'Are you sure you want to remove the deck?',
  'favoritesDeckDialogTextConfirm': 'Ok',
  'favoritesDeckDialogTextCancel': 'Cancel',
  'formDeckPageCreateDeck': 'Create a new deck',
  'formDeckPageEditDeck': 'Edit deck',
  'formDeckPageSaveDeck': 'Save deck',
  'formDeckPageHeroTitle': 'Select a Hero',
  'formDeckPageMiniTitle': 'Select a Mini',
  'formDeckDialogTitle': 'Alert',
  'formDeckDialogTextCancel': 'Cancel',
  'formDeckDialogTextConfirm': 'Ok',
  'formDeckDialogMiddleText':
      "You haven't finished the entire deck, do you really want to quit?",
  'formDeckBottomSheetTooltipHero':
      'Press and hold to see a brief hero stat, or tap to select.',
  'formDeckBottomSheetTooltipMini':
      'Press and hold to see a brief mini stat, or tap to select.',
  'formDeckFloatingActionButtonTooltip':
      'Tap and hold on hero/minis to see a brief stat, or tap to select.',
  'collection': 'Collection',
  'collectionTabHeroes': 'Heroes (@value)',
  'collectionTabMinis': 'Minis (@value)',
  'tabHeroesSearch': 'Search Heroes',
  'tabHeroesSearchNotFound': 'No hero found.',
  'tabMinisSearch': 'Search Minis',
  'tabMinisSearchNotFound': 'No mini found.',
  'tabMinisFilterAll': 'All',
  'heroDetailsLevel': 'Choose a Level: @level',
  'heroDetailsStatsLevel': 'Level',
  'heroDetailsStatsHP': 'HP',
  'heroDetailsStatsHitPerSecond': 'Hit per second',
  'heroDetailsStatsDamagePerHit': 'Damage per Hit',
  'heroDetailsStatsEnergyCost': 'Energy Cost',
  'heroDetailsStatsInitialEnergy': 'Initial Energy',
  'heroDetailsLevelsUnlockLevel': 'Level unlock: @level',
  'heroDetailsLevelsClash': 'Clash',
  'heroDetailsLevelsSuper': 'Super',
  'heroDetailsLevelsBoast': 'Boast',
  'miniDetailsStar': 'Choose a Star',
  'miniDetailsButtonEmpty': 'Empty',
  'miniDetailsStatsStar': 'Star',
  'miniDetailsStatsHP': 'HP',
  'miniDetailsStatsHitPerSecond': 'Hit per second',
  'miniDetailsStatsDamagePerHit': 'Damage per Hit',
  'miniDetailsStatsEnergyCost': 'Energy Cost',
  'miniDetailsStatsInitialEnergy': 'Initial Energy',
  'miniDetailsStatsElixirCost': 'Elixir Cost',
  'miniDetailsAbilitiesUnlockStar': 'Star unlock: @star',
  'miniDetailsAbilitiesClash': 'Clash',
  'miniDetailsAbilitiesSuper': 'Super',
  'miniDetailsAbilitiesBoast': 'Boast',
  'miniDetailsAbilitiesKO': 'KO',
  'patchTitle': 'Patch',
  'rankTitle': 'Rank and Boards',
  'rankTrophies': 'Trophies: @trophies',
  'rankBoardTrophiesRequired': 'Trophies required: @trophies',
  'tierListTitle': 'Tier List',
  'tierListButtonNew': 'New Tier List',
  'formTierListPageTitle': 'Create a New Tier List',
  'formTierListPageSubtitle': 'Move minis to Tier List',
  'formTierListPageEmpty': 'Empty',
};

final Map<String, String> ptBR = {
  'languageCode': 'pt',
  'languageEnglish': 'Inglês',
  'languagePortuguese': 'Português',
  'languageSpanish': 'Espanhol',
  'splashscreenTitle': 'Database, minis e heróis',
  'splashscreenVersion': 'Versão @version',
  'splashscreenCreatedBy': 'Criado por @name',
  'landingInfo': 'Aguardando informações do banco de dados',
  'landingConnection': 'Certifique-se que haja conexão com a internet.',
  'landingError': 'Ocorreu um erro, por favor tente novamente.',
  'landingUpdate':
      'Há uma nova atualização disponível, por favor atualize seu aplicativo.',
  'utilsDialogNameInput': 'Digite seu Nome',
  'utilsDialogNameInputEmpty': 'Por favor insira seu nome.',
  'utilsDialogNameInputMaxCharacters':
      'O seu nome deve conter no máximo 20 caracteres.',
  'utilsDialogNameButton': 'Continuar',
  'utilsDialogEditNameButton': 'Editar',
  'utilsDialogLanguage': 'Alterar idioma',
  'utilsDialogNameDeckInput': 'Digite o nome do seu deck',
  'utilsDialogNameDeckButton': 'Salvar',
  'utilsDialogNameDeckInputEmpty': 'Por favor insira o nome do seu deck',
  'utilsDialogNameDeckInputMaxCharacters':
      'O nome do deck deve conter no máximo 30 caracteres.',
  'homePageCollection': 'Coleção',
  'homePageTierList': 'Tier List',
  'homePageFavorites': 'Favoritos',
  'homePageRank': 'Classificação',
  'homePagePatch': 'Correção',
  'favoritesDiscord': 'Entre em nosso Discord!',
  'favorites': 'Favoritos',
  'favoritesTabDecks': 'Decks (@value)',
  'favoritesTabMinis': 'Minis (@value)',
  'favoritesMiniNotFound': 'Nenhum mini favorito encontrado.',
  'favoritesDeckNotFound': 'Nenhum deck favorito encontrado.',
  'favoritesDeckNewDeck': 'Novo Deck',
  'favoritesDeckDialogTitle': 'Remover',
  'favoritesDeckDialogMiddleText': 'Tem certeza que deseja remover o deck?',
  'favoritesDeckDialogTextConfirm': 'Ok',
  'favoritesDeckDialogTextCancel': 'Cancelar',
  'formDeckPageCreateDeck': 'Criar um novo deck',
  'formDeckPageEditDeck': 'Editar deck',
  'formDeckPageSaveDeck': 'Salvar deck',
  'formDeckPageHeroTitle': 'Selecione um Herói',
  'formDeckPageMiniTitle': 'Selecione um Mini',
  'formDeckDialogTitle': 'Alerta',
  'formDeckDialogTextCancel': 'Cancelar',
  'formDeckDialogTextConfirm': 'Ok',
  'formDeckDialogMiddleText':
      'Você não finalizou todo o deck, deseja realmente sair?',
  'formDeckBottomSheetTooltipHero':
      'Mantenha pressionado para ver uma breve estatística do herói, ou toque para selecionar.',
  'formDeckBottomSheetTooltipMini':
      'Mantenha pressionado para ver uma breve estatística do mini, ou toque para selecionar.',
  'formDeckFloatingActionButtonTooltip':
      'Mantenha pressionado no herói/minis para ver uma breve estatística, ou toque para selecionar.',
  'collection': 'Coleção',
  'collectionTabHeroes': 'Heróis (@value)',
  'collectionTabMinis': 'Minis (@value)',
  'tabHeroesSearch': 'Pesquisar Heróis',
  'tabHeroesSearchNotFound': 'Nenhum herói encontrado.',
  'tabMinisSearch': 'Pesquisar Minis',
  'tabMinisSearchNotFound': 'Nenhum mini encontrado.',
  'tabMinisFilterAll': 'Todos',
  'heroDetailsLevel': 'Escolha um Nível: @level',
  'heroDetailsStatsLevel': 'Nível',
  'heroDetailsStatsHP': 'Pontos de Vida',
  'heroDetailsStatsHitPerSecond': 'Golpe por segundo',
  'heroDetailsStatsDamagePerHit': 'Dano por Golpe',
  'heroDetailsStatsEnergyCost': 'Custo de Energia',
  'heroDetailsStatsInitialEnergy': 'Energia Inicial',
  'heroDetailsLevelsUnlockLevel': 'Desbloqueio de nível: @level',
  'heroDetailsLevelsClash': 'Clash',
  'heroDetailsLevelsSuper': 'Super',
  'heroDetailsLevelsBoast': 'Vangloriar-se',
  'miniDetailsStar': 'Escolha uma Estrela',
  'miniDetailsButtonEmpty': 'Vazio',
  'miniDetailsStatsStar': 'Estrela',
  'miniDetailsStatsHP': 'Pontos de Vida',
  'miniDetailsStatsHitPerSecond': 'Golpe por segundo',
  'miniDetailsStatsDamagePerHit': 'Dano por Golpe',
  'miniDetailsStatsEnergyCost': 'Custo de Energia',
  'miniDetailsStatsInitialEnergy': 'Energia Inicial',
  'miniDetailsStatsElixirCost': 'Custo de Elixir',
  'miniDetailsAbilitiesUnlockStar': 'Desbloqueio de estrela: @star',
  'miniDetailsAbilitiesClash': 'Clash',
  'miniDetailsAbilitiesSuper': 'Super',
  'miniDetailsAbilitiesBoast': 'Vangloriar-se',
  'miniDetailsAbilitiesKO': 'Dano Mortal',
  'patchTitle': 'Correção',
  'rankTitle': 'Classificação e Tabuleiros',
  'rankTrophies': 'Troféus: @trophies',
  'rankBoardTrophiesRequired': 'Troféus necessários: @trophies',
  'tierListTitle': 'Tier List',
  'tierListButtonNew': 'Nova Tier List',
  'formTierListPageTitle': 'Criar uma Nova Tier List',
  'formTierListPageSubtitle': 'Mova os minis até a Tier List',
  'formTierListPageEmpty': 'Vazio',
};

final Map<String, String> esES = {
  'languageCode': 'es',
  'languageEnglish': 'Inglés',
  'languagePortuguese': 'Portugués',
  'languageSpanish': 'Español',
  'splashscreenTitle': 'Base de datos, minis y héroes',
  'splashscreenVersion': 'Versión @version',
  'splashscreenCreatedBy': 'Creado por @name',
  'landingInfo': 'Esperando información de la base de datos',
  'landingConnection': 'Asegúrate de tener una conexión a Internet.',
  'landingError': 'Ocurrió un error. Inténtalo de nuevo.',
  'landingUpdate':
      'Hay una nueva actualización disponible, actualice su aplicación.',
  'utilsDialogNameInput': 'Escriba su nombre',
  'utilsDialogNameInputEmpty': 'Por favor, escriba su nombre.',
  'utilsDialogNameInputMaxCharacters':
      'Su nombre debe contener un máximo de 20 caracteres.',
  'utilsDialogNameButton': 'Continuar',
  'utilsDialogEditNameButton': 'Editar',
  'utilsDialogLanguage': 'Cambiar idioma',
  'utilsDialogNameDeckInput': 'Ingresa el nombre de tu mazo',
  'utilsDialogNameDeckButton': 'Guardar',
  'utilsDialogNameDeckInputEmpty': 'Por favor ingrese el nombre de su baraja',
  'utilsDialogNameDeckInputMaxCharacters':
      'El nombre de la baraja debe contener un máximo de 30 caracteres.',
  'homePageCollection': 'Colección',
  'homePageTierList': 'Tier List',
  'homePageFavorites': 'Favoritos',
  'homePageRank': 'Rango',
  'homePagePatch': 'Parche',
  'favoritesDiscord': '¡Únase a nuestra discordia!',
  'favorites': 'Favoritos',
  'favoritesTabDecks': 'Barajas (@value)',
  'favoritesTabMinis': 'Minis (@value)',
  'favoritesMiniNotFound': 'No se encontraron minis favoritos.',
  'favoritesDeckNotFound': 'No se encontraron barajas favoritos.',
  'favoritesDeckNewDeck': 'Nueva Baraja',
  'favoritesDeckDialogTitle': 'Eliminar',
  'favoritesDeckDialogMiddleText':
      '¿Estás seguro de que quieres eliminar la baraja?',
  'favoritesDeckDialogTextConfirm': 'Ok',
  'favoritesDeckDialogTextCancel': 'Cancelar',
  'formDeckPageCreateDeck': 'Crea una nueva baraja',
  'formDeckPageEditDeck': 'Editar baraja',
  'formDeckPageSaveDeck': 'Guardar baraja',
  'formDeckPageHeroTitle': 'Selecciona un héroe',
  'formDeckPageMiniTitle': 'Selecciona un mini',
  'formDeckDialogTitle': 'Alerta',
  'formDeckDialogTextCancel': 'Cancelar',
  'formDeckDialogTextConfirm': 'Ok',
  'formDeckDialogMiddleText':
      'No has terminado todo el baraja, ¿de verdad quieres dejarlo?',
  'formDeckBottomSheetTooltipHero':
      'Mantén pulsado para ver una breve estadística de héroe o toca para seleccionar.',
  'formDeckBottomSheetTooltipMini':
      'Mantén pulsado para ver una breve estadística de mini o toca para seleccionar.',
  'formDeckFloatingActionButtonTooltip':
      'Toque y mantenga presionado héroe/minis para ver una breve estadística, o toque para seleccionar.',
  'collection': 'Colección',
  'collectionTabHeroes': 'Héroes (@value)',
  'collectionTabMinis': 'Minis (@value)',
  'tabHeroesSearch': 'Buscar Héroes',
  'tabHeroesSearchNotFound': 'No se encontró ningún héroe.',
  'tabMinisSearch': 'Buscar Minis',
  'tabMinisSearchNotFound': 'No se encontró ningún mini.',
  'tabMinisFilterAll': 'Todos',
  'heroDetailsLevel': 'Elige un Nivel: @level',
  'heroDetailsStatsLevel': 'Nivel',
  'heroDetailsStatsHP': 'Puntos de Vida',
  'heroDetailsStatsHitPerSecond': 'Impactos por segundo',
  'heroDetailsStatsDamagePerHit': 'Daño por Impacto',
  'heroDetailsStatsEnergyCost': 'Coste de Energía',
  'heroDetailsStatsInitialEnergy': 'Energía Inicial',
  'heroDetailsLevelsUnlockLevel': 'Desbloqueo de nivel: @level',
  'heroDetailsLevelsClash': 'Clash',
  'heroDetailsLevelsSuper': 'Súper',
  'heroDetailsLevelsBoast': 'Alarde',
  'miniDetailsStar': 'Elige una estrella',
  'miniDetailsButtonEmpty': 'Vacío',
  'miniDetailsStatsStar': 'Estrella',
  'miniDetailsStatsHP': 'Puntos de Vida',
  'miniDetailsStatsHitPerSecond': 'Impactos por segundo',
  'miniDetailsStatsDamagePerHit': 'Daño por Impacto',
  'miniDetailsStatsEnergyCost': 'Coste de Energía',
  'miniDetailsStatsInitialEnergy': 'Energía Inicial',
  'miniDetailsStatsElixirCost': 'Coste de Elixir',
  'miniDetailsAbilitiesUnlockStar': 'Desbloqueo de estrella: @star',
  'miniDetailsAbilitiesClash': 'Clash',
  'miniDetailsAbilitiesSuper': 'Súper',
  'miniDetailsAbilitiesBoast': 'Alarde',
  'miniDetailsAbilitiesKO': 'Daño Mortal',
  'patchTitle': 'Parche',
  'rankTitle': 'Rango y Tableros',
  'rankTrophies': 'Trofeos: @trophies',
  'rankBoardTrophiesRequired': 'Trofeos requeridos: @trophies',
  'tierListTitle': 'Tier List',
  'tierListButtonNew': 'Nueva Tier List',
  'formTierListPageTitle': 'Crear una nueva Tier List',
  'formTierListPageSubtitle': 'Mover minis a la Tier List',
  'formTierListPageEmpty': 'Vacío',
};
