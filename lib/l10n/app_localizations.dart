import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
  ];

  /// Application name
  ///
  /// In en, this message translates to:
  /// **'Area & Plot'**
  String get appName;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @calculator.
  ///
  /// In en, this message translates to:
  /// **'Calculator'**
  String get calculator;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @converter.
  ///
  /// In en, this message translates to:
  /// **'Converter'**
  String get converter;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @areaCalculator.
  ///
  /// In en, this message translates to:
  /// **'Area Calculator'**
  String get areaCalculator;

  /// No description provided for @mapCalculator.
  ///
  /// In en, this message translates to:
  /// **'Map Calculator'**
  String get mapCalculator;

  /// No description provided for @unitConverter.
  ///
  /// In en, this message translates to:
  /// **'Unit Converter'**
  String get unitConverter;

  /// No description provided for @calculationHistory.
  ///
  /// In en, this message translates to:
  /// **'Calculation History'**
  String get calculationHistory;

  /// No description provided for @rectangle.
  ///
  /// In en, this message translates to:
  /// **'Rectangle'**
  String get rectangle;

  /// No description provided for @triangle.
  ///
  /// In en, this message translates to:
  /// **'Triangle'**
  String get triangle;

  /// No description provided for @polygon.
  ///
  /// In en, this message translates to:
  /// **'Polygon'**
  String get polygon;

  /// No description provided for @width.
  ///
  /// In en, this message translates to:
  /// **'Width'**
  String get width;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @base.
  ///
  /// In en, this message translates to:
  /// **'Base'**
  String get base;

  /// No description provided for @length.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get length;

  /// No description provided for @vertices.
  ///
  /// In en, this message translates to:
  /// **'Vertices'**
  String get vertices;

  /// No description provided for @addVertex.
  ///
  /// In en, this message translates to:
  /// **'Add Vertex'**
  String get addVertex;

  /// No description provided for @removeVertex.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeVertex;

  /// No description provided for @xCoordinate.
  ///
  /// In en, this message translates to:
  /// **'X'**
  String get xCoordinate;

  /// No description provided for @yCoordinate.
  ///
  /// In en, this message translates to:
  /// **'Y'**
  String get yCoordinate;

  /// No description provided for @calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculate;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clear;

  /// No description provided for @result.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @selectUnit.
  ///
  /// In en, this message translates to:
  /// **'Select Unit'**
  String get selectUnit;

  /// No description provided for @squareFeet.
  ///
  /// In en, this message translates to:
  /// **'Square Feet'**
  String get squareFeet;

  /// No description provided for @decimal.
  ///
  /// In en, this message translates to:
  /// **'Decimal'**
  String get decimal;

  /// No description provided for @katha.
  ///
  /// In en, this message translates to:
  /// **'Katha'**
  String get katha;

  /// No description provided for @bigha.
  ///
  /// In en, this message translates to:
  /// **'Bigha'**
  String get bigha;

  /// No description provided for @acre.
  ///
  /// In en, this message translates to:
  /// **'Acre'**
  String get acre;

  /// No description provided for @squareFeetShort.
  ///
  /// In en, this message translates to:
  /// **'ft²'**
  String get squareFeetShort;

  /// No description provided for @decimalShort.
  ///
  /// In en, this message translates to:
  /// **'dec'**
  String get decimalShort;

  /// No description provided for @kathaShort.
  ///
  /// In en, this message translates to:
  /// **'katha'**
  String get kathaShort;

  /// No description provided for @bighaShort.
  ///
  /// In en, this message translates to:
  /// **'bigha'**
  String get bighaShort;

  /// No description provided for @acreShort.
  ///
  /// In en, this message translates to:
  /// **'acre'**
  String get acreShort;

  /// No description provided for @convertFrom.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get convertFrom;

  /// No description provided for @convertTo.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get convertTo;

  /// No description provided for @enterValue.
  ///
  /// In en, this message translates to:
  /// **'Enter value'**
  String get enterValue;

  /// No description provided for @conversionResult.
  ///
  /// In en, this message translates to:
  /// **'Conversion Result'**
  String get conversionResult;

  /// No description provided for @allConversions.
  ///
  /// In en, this message translates to:
  /// **'All Conversions'**
  String get allConversions;

  /// No description provided for @tapToAddPoints.
  ///
  /// In en, this message translates to:
  /// **'Tap on map to add points'**
  String get tapToAddPoints;

  /// No description provided for @addAtLeastThreePoints.
  ///
  /// In en, this message translates to:
  /// **'Add at least 3 points to calculate area'**
  String get addAtLeastThreePoints;

  /// No description provided for @pointsAdded.
  ///
  /// In en, this message translates to:
  /// **'{count} points added'**
  String pointsAdded(int count);

  /// No description provided for @calculateFromMap.
  ///
  /// In en, this message translates to:
  /// **'Calculate Area'**
  String get calculateFromMap;

  /// No description provided for @clearPoints.
  ///
  /// In en, this message translates to:
  /// **'Clear Points'**
  String get clearPoints;

  /// No description provided for @undoLastPoint.
  ///
  /// In en, this message translates to:
  /// **'Undo Last'**
  String get undoLastPoint;

  /// No description provided for @saveToHistory.
  ///
  /// In en, this message translates to:
  /// **'Save to History'**
  String get saveToHistory;

  /// No description provided for @noHistory.
  ///
  /// In en, this message translates to:
  /// **'No saved calculations yet'**
  String get noHistory;

  /// No description provided for @noHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your calculations will appear here'**
  String get noHistorySubtitle;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @allHistory.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allHistory;

  /// No description provided for @savedOn.
  ///
  /// In en, this message translates to:
  /// **'Saved on {date}'**
  String savedOn(String date);

  /// No description provided for @deleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Entry'**
  String get deleteConfirmTitle;

  /// No description provided for @deleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this entry?'**
  String get deleteConfirmMessage;

  /// No description provided for @featureAreaCalculator.
  ///
  /// In en, this message translates to:
  /// **'Area Calculator'**
  String get featureAreaCalculator;

  /// No description provided for @featureAreaCalculatorDesc.
  ///
  /// In en, this message translates to:
  /// **'Calculate area of any shape'**
  String get featureAreaCalculatorDesc;

  /// No description provided for @featureMapCalculator.
  ///
  /// In en, this message translates to:
  /// **'Map Calculator'**
  String get featureMapCalculator;

  /// No description provided for @featureMapCalculatorDesc.
  ///
  /// In en, this message translates to:
  /// **'Draw on map to measure land'**
  String get featureMapCalculatorDesc;

  /// No description provided for @featureUnitConverter.
  ///
  /// In en, this message translates to:
  /// **'Unit Converter'**
  String get featureUnitConverter;

  /// No description provided for @featureUnitConverterDesc.
  ///
  /// In en, this message translates to:
  /// **'Convert between land units'**
  String get featureUnitConverterDesc;

  /// No description provided for @featureHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get featureHistory;

  /// No description provided for @featureHistoryDesc.
  ///
  /// In en, this message translates to:
  /// **'View saved calculations'**
  String get featureHistoryDesc;

  /// No description provided for @errorInvalidInput.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid numbers'**
  String get errorInvalidInput;

  /// No description provided for @errorMinVertices.
  ///
  /// In en, this message translates to:
  /// **'Polygon needs at least 3 vertices'**
  String get errorMinVertices;

  /// No description provided for @errorSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save calculation'**
  String get errorSaveFailed;

  /// No description provided for @permissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission is required for map features'**
  String get permissionDenied;

  /// No description provided for @bangladeshUnits.
  ///
  /// In en, this message translates to:
  /// **'Common Land Units'**
  String get bangladeshUnits;

  /// No description provided for @kathaInfo.
  ///
  /// In en, this message translates to:
  /// **'1 Katha = 720 sq ft'**
  String get kathaInfo;

  /// No description provided for @bighaInfo.
  ///
  /// In en, this message translates to:
  /// **'1 Bigha = 20 Katha = 14,400 sq ft'**
  String get bighaInfo;

  /// No description provided for @decimalInfo.
  ///
  /// In en, this message translates to:
  /// **'1 Decimal = 435.56 sq ft'**
  String get decimalInfo;

  /// No description provided for @acreInfo.
  ///
  /// In en, this message translates to:
  /// **'1 Acre = 43,560 sq ft'**
  String get acreInfo;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @bengali.
  ///
  /// In en, this message translates to:
  /// **'Bengali'**
  String get bengali;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Land measurement app made for Bangladesh'**
  String get welcomeSubtitle;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @unitsInfo.
  ///
  /// In en, this message translates to:
  /// **'Unit Information'**
  String get unitsInfo;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @allUnits.
  ///
  /// In en, this message translates to:
  /// **'All Units'**
  String get allUnits;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @selectUnitLabel.
  ///
  /// In en, this message translates to:
  /// **'Select Unit'**
  String get selectUnitLabel;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @allConversionsLabel.
  ///
  /// In en, this message translates to:
  /// **'All Conversions'**
  String get allConversionsLabel;

  /// No description provided for @mapSource.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get mapSource;

  /// No description provided for @selectShape.
  ///
  /// In en, this message translates to:
  /// **'Select Shape'**
  String get selectShape;

  /// No description provided for @verticesLabel.
  ///
  /// In en, this message translates to:
  /// **'Vertices ({count})'**
  String verticesLabel(int count);

  /// No description provided for @saveResult.
  ///
  /// In en, this message translates to:
  /// **'Save to History'**
  String get saveResult;

  /// No description provided for @allUnitsLabel.
  ///
  /// In en, this message translates to:
  /// **'All Units'**
  String get allUnitsLabel;

  /// No description provided for @plotName.
  ///
  /// In en, this message translates to:
  /// **'Plot Name'**
  String get plotName;

  /// No description provided for @plotNotes.
  ///
  /// In en, this message translates to:
  /// **'Details (optional)'**
  String get plotNotes;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @dimensions.
  ///
  /// In en, this message translates to:
  /// **'Dimensions'**
  String get dimensions;

  /// No description provided for @dateCreated.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateCreated;

  /// No description provided for @allAreaValues.
  ///
  /// In en, this message translates to:
  /// **'All Measurements'**
  String get allAreaValues;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @loginToSyncText.
  ///
  /// In en, this message translates to:
  /// **'Login to sync app data online'**
  String get loginToSyncText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
