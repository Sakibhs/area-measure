// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Area & Plot';

  @override
  String get home => 'Home';

  @override
  String get calculator => 'Calculator';

  @override
  String get map => 'Map';

  @override
  String get converter => 'Converter';

  @override
  String get history => 'History';

  @override
  String get areaCalculator => 'Area Calculator';

  @override
  String get mapCalculator => 'Map Calculator';

  @override
  String get unitConverter => 'Unit Converter';

  @override
  String get calculationHistory => 'Calculation History';

  @override
  String get rectangle => 'Rectangle';

  @override
  String get triangle => 'Triangle';

  @override
  String get polygon => 'Polygon';

  @override
  String get width => 'Width';

  @override
  String get height => 'Height';

  @override
  String get base => 'Base';

  @override
  String get length => 'Length';

  @override
  String get vertices => 'Vertices';

  @override
  String get addVertex => 'Add Vertex';

  @override
  String get removeVertex => 'Remove';

  @override
  String get xCoordinate => 'X';

  @override
  String get yCoordinate => 'Y';

  @override
  String get calculate => 'Calculate';

  @override
  String get reset => 'Reset';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get done => 'Done';

  @override
  String get undo => 'Undo';

  @override
  String get clear => 'Clear All';

  @override
  String get result => 'Result';

  @override
  String get area => 'Area';

  @override
  String get unit => 'Unit';

  @override
  String get selectUnit => 'Select Unit';

  @override
  String get squareFeet => 'Square Feet';

  @override
  String get decimal => 'Decimal';

  @override
  String get katha => 'Katha';

  @override
  String get bigha => 'Bigha';

  @override
  String get acre => 'Acre';

  @override
  String get squareFeetShort => 'ft²';

  @override
  String get decimalShort => 'dec';

  @override
  String get kathaShort => 'katha';

  @override
  String get bighaShort => 'bigha';

  @override
  String get acreShort => 'acre';

  @override
  String get convertFrom => 'From';

  @override
  String get convertTo => 'To';

  @override
  String get enterValue => 'Enter value';

  @override
  String get conversionResult => 'Conversion Result';

  @override
  String get allConversions => 'All Conversions';

  @override
  String get tapToAddPoints => 'Tap on map to add points';

  @override
  String get addAtLeastThreePoints => 'Add at least 3 points to calculate area';

  @override
  String pointsAdded(int count) {
    return '$count points added';
  }

  @override
  String get calculateFromMap => 'Calculate Area';

  @override
  String get clearPoints => 'Clear Points';

  @override
  String get undoLastPoint => 'Undo Last';

  @override
  String get saveToHistory => 'Save to History';

  @override
  String get noHistory => 'No saved calculations yet';

  @override
  String get noHistorySubtitle => 'Your calculations will appear here';

  @override
  String get favorites => 'Favorites';

  @override
  String get allHistory => 'All';

  @override
  String savedOn(String date) {
    return 'Saved on $date';
  }

  @override
  String get deleteConfirmTitle => 'Delete Entry';

  @override
  String get deleteConfirmMessage =>
      'Are you sure you want to delete this entry?';

  @override
  String get featureAreaCalculator => 'Area Calculator';

  @override
  String get featureAreaCalculatorDesc => 'Calculate area of any shape';

  @override
  String get featureMapCalculator => 'Map Calculator';

  @override
  String get featureMapCalculatorDesc => 'Draw on map to measure land';

  @override
  String get featureUnitConverter => 'Unit Converter';

  @override
  String get featureUnitConverterDesc => 'Convert between land units';

  @override
  String get featureHistory => 'History';

  @override
  String get featureHistoryDesc => 'View saved calculations';

  @override
  String get errorInvalidInput => 'Please enter valid numbers';

  @override
  String get errorMinVertices => 'Polygon needs at least 3 vertices';

  @override
  String get errorSaveFailed => 'Failed to save calculation';

  @override
  String get permissionDenied =>
      'Location permission is required for map features';

  @override
  String get bangladeshUnits => 'Bangladesh Standard';

  @override
  String get kathaInfo => '1 Katha = 720 sq ft';

  @override
  String get bighaInfo => '1 Bigha = 20 Katha = 14,400 sq ft';

  @override
  String get decimalInfo => '1 Decimal = 435.56 sq ft';

  @override
  String get acreInfo => '1 Acre = 43,560 sq ft';
}
