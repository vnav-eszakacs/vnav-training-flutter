import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['hu', 'en', 'ro'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? huText = '',
    String? enText = '',
    String? roText = '',
  }) =>
      [huText, enText, roText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'oc1dcv0u': {
      'hu': 'Home',
      'en': 'Home',
      'ro': 'Acasă',
    },
  },
  // Authentication
  {
    'srdki1n8': {
      'hu': 'Oktatási Portál belépés',
      'en': 'Education Portal login',
      'ro': 'Conectare la portalul educațional',
    },
    'o6cmwfba': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'w809pfq0': {
      'hu': 'E-mail cím',
      'en': 'E-mail address',
      'ro': 'Adresa de e-mail',
    },
    '2fntz9wb': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'dfej6ht7': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'cjrc1fnl': {
      'hu': 'Jelszó',
      'en': 'Password',
      'ro': 'Parola',
    },
    'sojx53fk': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '7bkx507d': {
      'hu': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul derulant',
    },
    'bscsi3gi': {
      'hu': 'Field is required',
      'en': 'Field is required',
      'ro': 'Câmpul este obligatoriu',
    },
    'k2418501': {
      'hu': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul derulant',
    },
    'r5hpic4s': {
      'hu': 'Belépés',
      'en': 'Entry',
      'ro': 'Intrare',
    },
    'akk3h8hi': {
      'hu': 'Home',
      'en': 'Home',
      'ro': 'Acasă',
    },
  },
  // Profile
  {
    '39jvpy26': {
      'hu': 'Személyes adataim',
      'en': 'My personal data',
      'ro': 'Datele mele personale',
    },
    'jbkx5y19': {
      'hu': 'Kilépés',
      'en': 'Exit',
      'ro': 'Ieșire',
    },
    'vh53ctch': {
      'hu': 'Home',
      'en': 'Home',
      'ro': 'Acasă',
    },
  },
  // PersonalData
  {
    '1zsijete': {
      'hu': 'Személyes adataim',
      'en': 'My personal data',
      'ro': 'Datele mele personale',
    },
    'ehy5rkix': {
      'hu': 'Vezetéknév...',
      'en': 'Last name...',
      'ro': 'Nume...',
    },
    'vsmkd5tx': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'swl2l6sx': {
      'hu': 'Keresztnév...',
      'en': 'First name...',
      'ro': 'Nume...',
    },
    'uyrt29r2': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '8jjthsv1': {
      'hu': 'Option 1',
      'en': 'Option 1',
      'ro': 'Opțiunea 1',
    },
    'u1oyaaut': {
      'hu': 'Nem...',
      'en': 'No...',
      'ro': 'Nu...',
    },
    'bg0v5tmi': {
      'hu': 'Search for an item...',
      'en': 'Search for an item...',
      'ro': 'Căutați un articol...',
    },
    '128k3awz': {
      'hu': 'Anyja neve...',
      'en': 'His mother\'s name...',
      'ro': 'Numele mamei lui...',
    },
    'yzj142md': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '4btafi54': {
      'hu': 'Születési név...',
      'en': 'Birth name...',
      'ro': 'Numele de nastere...',
    },
    'e6lz5dr8': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '1p3651hz': {
      'hu': 'Születési dátum',
      'en': 'Date of birth',
      'ro': 'Data nașterii',
    },
    'za29q6ta': {
      'hu': 'Születési hely...',
      'en': 'Place of birth...',
      'ro': 'Locul nașterii...',
    },
    'xng0ztif': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'xwazsvng': {
      'hu': 'Magyarország',
      'en': 'Hungary',
      'ro': 'Ungaria',
    },
    'jtj5rysw': {
      'hu': 'Szerbia',
      'en': 'Serbia',
      'ro': 'Serbia',
    },
    '4zfabglj': {
      'hu': 'Románia',
      'en': 'Romania',
      'ro': 'România',
    },
    '0nr1tbng': {
      'hu': 'Ukrajna',
      'en': 'Ukraine',
      'ro': 'Ucraina',
    },
    'wy75wls1': {
      'hu': 'Szlovákia',
      'en': 'Slovakia',
      'ro': 'Slovacia',
    },
    'il811yck': {
      'hu': 'Ausztria',
      'en': 'Austria',
      'ro': 'Austria',
    },
    'fk3bh71u': {
      'hu': 'Szlovénia',
      'en': 'Slovenia',
      'ro': 'Slovenia',
    },
    'a6c3uvf8': {
      'hu': 'Születési ország...',
      'en': 'Country of birth...',
      'ro': 'Tara natala...',
    },
    'tt3takh6': {
      'hu': 'Search for an item...',
      'en': 'Search for an item...',
      'ro': 'Căutați un articol...',
    },
    'qs478bmq': {
      'hu': 'Kötelező mező',
      'en': 'Mandatory field',
      'ro': 'Câmp obligatoriu',
    },
    '73ctu7id': {
      'hu': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul derulant',
    },
    '9andb8cf': {
      'hu': 'Kötelező mező',
      'en': 'Mandatory field',
      'ro': 'Câmp obligatoriu',
    },
    'e1gq511q': {
      'hu': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul derulant',
    },
    '3cdhkyq4': {
      'hu': 'Kötelező mező',
      'en': 'Mandatory field',
      'ro': 'Câmp obligatoriu',
    },
    '4208i8ck': {
      'hu': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul derulant',
    },
    'tw0hf3bp': {
      'hu': 'Kötelező mező',
      'en': 'Mandatory field',
      'ro': 'Câmp obligatoriu',
    },
    'c6upaarj': {
      'hu': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'ro': 'Vă rugăm să alegeți o opțiune din meniul derulant',
    },
    'y2h2it4v': {
      'hu': 'Mentés',
      'en': 'Rescue',
      'ro': 'Salvare',
    },
    'hbi8s0ha': {
      'hu': 'Home',
      'en': 'Home',
      'ro': 'Acasă',
    },
  },
  // training
  {
    'bi1zfeqj': {
      'hu': 'Képzés kezdete',
      'en': 'Start of training',
      'ro': 'Începutul antrenamentului',
    },
    'p92yt7ti': {
      'hu': 'Képzés befejezése',
      'en': 'Completion of training',
      'ro': 'Finalizarea instruirii',
    },
  },
  // Miscellaneous
  {
    '81pe6ysl': {
      'hu': 'Button',
      'en': 'Button',
      'ro': 'Buton',
    },
    'z8za61i2': {
      'hu': 'Email ...',
      'en': 'Email...',
      'ro': 'E-mail...',
    },
    'u4tjt0t7': {
      'hu': 'Button',
      'en': 'Button',
      'ro': 'Buton',
    },
    'urgr7p0r': {
      'hu': 'Option 1',
      'en': 'Option 1',
      'ro': 'Opțiunea 1',
    },
    'w1vsoix2': {
      'hu': 'Please select...',
      'en': 'Please select...',
      'ro': 'Te rog selecteaza...',
    },
    'ny9jl35z': {
      'hu': 'Search for an item...',
      'en': 'Search for an item...',
      'ro': 'Căutați un articol...',
    },
    '6059i1bb': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'cms1xktg': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'b2sp8u1s': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'mz74h1v7': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '28w8mjeg': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'gx7i79ia': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'edm91bgb': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'bv32tdhw': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '5u7e531c': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'ivhukg4p': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'l19ji8ou': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'z0mhs8pu': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'q0afieh1': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '3aftch5m': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'w2qpkvfz': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '15ns7xqm': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'fs3u870k': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'f3x70waa': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '8ura547n': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'o7z4rfzz': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'w2781a47': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '6rpv935d': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    '7ssi0t9p': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'wcuu68rx': {
      'hu': '',
      'en': '',
      'ro': '',
    },
    'qbaasj1h': {
      'hu': '',
      'en': '',
      'ro': '',
    },
  },
].reduce((a, b) => a..addAll(b));
