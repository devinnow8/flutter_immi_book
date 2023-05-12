abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "he_In": heIN
  };
}

final Map<String, String> enUS = {
  'immibookTitle': 'The Immi Book',
  'underContruction': 'Hello this site is under construction',
  'greeting': 'Hello, How are you?',
  'day': "Awesome day...",
  'home': 'Home',
  'about': 'About',
  'services': 'Services',
  'jobs': 'Jobs',
  'accomodations': 'Accomodations',
  'events': 'Events',
  'register': 'Register or Sign In',
  'heroTagline': 'Everything you need to know about after immigration',
  'postsTitle': 'Posts',
  'jobsTitle': 'Jobs',
  'eventsTitle': 'Events',
  'viewMore': 'View more',
  'viewDetails': 'View Details',
  'registerTitle': 'Start your international journey now',
  'registerDescription':
      'It is a long established fact that a reader will be distracted by the readable content of a page looking.',
  'accomodationsTitle': 'Accomodations',
      
};

final Map<String, String> heIN = {'greeting': 'Namaste', 'day': "Sukhad Din"};
