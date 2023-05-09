abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "he_In": heIN
  };
}

final Map<String, String> enUS = {
  'underContruction': 'Hello this site is under construction',
  'greeting': 'Hello, How are you?',
  'day': "Awesome day..."
};

final Map<String, String> heIN = {'greeting': 'Namaste', 'day': "Sukhad Din"};
