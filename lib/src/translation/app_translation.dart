class AppTranslation {
  Map<String, Map<String, String>> translationsKeys = {
    'en_US': enUS,
    'pt_BR': ptBR,
  };
}

final Map<String, String> enUS = {
  'languageCode': 'en',
  'languageEnglish': 'English',
  'languagePortuguese': 'Portuguese',
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
};

final Map<String, String> ptBR = {
  'languageCode': 'pt',
  'languageEnglish': 'Inglês',
  'languagePortuguese': 'Português',
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
};
