import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class AppLocalisation {
  final Locale locale;
  const AppLocalisation(this.locale);

  static const _AppDelegate delegate = _AppDelegate();

  static AppLocalisation of(BuildContext context) => Localizations.of<AppLocalisation>(context, AppLocalisation)!;

  static Map<String, dynamic>? _localizedStrings;

  /// String keys
  static const _apiConnectionTimeout = "_apiConnectionTimeout";
  static const _apiNoResponse = "_apiNoResponse";
  static const _databaseException = "_databaseException";
  static const _apiBadRequest = "_apiBadRequest";
  static const _apiUnauthenticated = "_apiUnauthenticated";

  /// key getters
  String get apiConnectionTimeout => _apiConnectionTimeout;
  String get apiNoResponse => _apiNoResponse;
  String get databaseException => _databaseException;
  String get apiBadRequest => _apiBadRequest;
  String get apiUnauthenticated => _apiUnauthenticated;

  Future<void> load() async {
    _localizedStrings = {
      _apiUnauthenticated: "You need authentication to perform this action",
      _databaseException: "Database Access Failure",
      _apiNoResponse: "Something went wrong",
      _apiBadRequest: "There was a problem making the request to the server",
      _apiConnectionTimeout: "Connection time out"
    };
  }

  String translate(String key) => _localizedStrings![key];
}

class _AppDelegate extends LocalizationsDelegate<AppLocalisation> {
  const _AppDelegate();

  @override
  bool isSupported(Locale locale) {
    return <String>["en", "fr"].contains(locale.countryCode);
  }

  @override
  Future<AppLocalisation> load(Locale locale) async {
    AppLocalisation _appLocalisation = AppLocalisation(locale);
    await _appLocalisation.load();
    return _appLocalisation;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalisation> old) => false;
}