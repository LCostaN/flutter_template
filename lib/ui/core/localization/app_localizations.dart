import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

import '../utils/formatters/string_formatter.dart';

class AppLocalization {
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization) ??
        (throw Exception('AppLocalization not found in context'));
  }

  static const _strings = <String, String>{
    'activities': 'Activities',
    'addDates': 'Add Dates',
    'bookingDeleted': 'Booking deleted',
    'cancel': 'Cancel',
    'close': 'Close',
    'confirm': 'Confirm',
    'daytime': 'Daytime',
    'groupCreated': 'Group created',
    'groupUpdated': 'Group updated',
    'errorSavingGroup': 'Error while saving group',
    'errorWhileDeletingBooking': 'Error while deleting booking',
    'errorWhileLoadingActivities': 'Error while loading activities',
    'errorWhileLoadingBooking': 'Error while loading booking',
    'errorWhileLoadingGroupDetails': 'Error while loading continents',
    'errorWhileLoadingProfile': 'Error while loading profile',
    'errorWhileLoadingHome': 'Error while loading home',
    'errorWhileLogin': 'Usuário ou senha inválidos',
    'errorWhileLogout': 'Error while trying to logout',
    'errorWhileSavingActivities': 'Error while saving activities',
    'errorWhileSavingItinerary': 'Error while saving itinerary',
    'errorWhileLoadingGroupList': 'Error while loading group list',
    'evening': 'Evening',
    'goBack': 'Go Back',
    'login': 'Login',
    'nameTrips': '{name}\'s Trips',
    'profile': 'Profile',
    'save': 'Save',
    'search': 'Search',
    'searchDestination': 'Search destination',
    'selected': '{1} selected',
    'shareTrip': 'Share Trip',
    'tryAgain': 'Try again',
    'yourChosenActivities': 'Your chosen activities',
    'when': 'When',
  };

  // If string for "label" does not exist, will show "[LABEL]"
  static String _get(String label) => _strings[label] ?? '[${label.capitalFirstLetter()}]';

  String get activities => _get('activities');

  String get addDates => _get('addDates');

  String get confirm => _get('confirm');

  String get daytime => _get('daytime');

  String get errorSavingGroup => _get('errorSavingGroup');

  String get errorWhileLoadingActivities => _get('errorWhileLoadingActivities');

  String get errorWhileLoadingBooking => _get('errorWhileLoadingBooking');

  String get errorWhileLoadingGroupDetails => _get('errorWhileLoadingGroupDetails');

  String get errorWhileLoadingProfile => _get('errorWhileLoadingProfile');

  String get errorWhileSavingActivities => _get('errorWhileSavingActivities');

  String get errorWhileSavingItinerary => _get('errorWhileSavingItinerary');

  String get evening => _get('evening');

  String get goBack => _get('goBack');

  String get groupCreated => _get('groupCreated');

  String get groupUpdated => _get('groupUpdated');

  String get profile => _get('profile');

  String get save => _get('save');

  String get search => _get('search');

  String get searchDestination => _get('searchDestination');

  String get shareTrip => _get('shareTrip');

  String get tryAgain => _get('tryAgain');

  String get yourChosenActivities => _get('yourChosenActivities');

  String get when => _get('when');

  String get errorWhileLogin => _get('errorWhileLogin');

  String get login => _get('login');

  String get errorWhileLogout => _get('errorWhileLogout');

  String get cancel => _get('cancel');

  String get close => _get('close');

  String get errorWhileLoadingGroupList => _get('errorWhileLoadingGroupList');

  String get errorWhileLoadingHome => _get('errorWhileLoadingHome');

  String nameTrips(String name) => _get('nameTrips').replaceAll('{name}', name);

  String selected(int value) => _get('selected').replaceAll('{1}', value.toString());
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) => ['pt', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture(AppLocalization());
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) => false;
}
