// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'জমির হিসাব';

  @override
  String get home => 'হোম';

  @override
  String get calculator => 'ক্যালকুলেটর';

  @override
  String get map => 'মানচিত্র';

  @override
  String get converter => 'রূপান্তর';

  @override
  String get history => 'ইতিহাস';

  @override
  String get areaCalculator => 'ক্ষেত্রফল হিসাবক';

  @override
  String get mapCalculator => 'মানচিত্র হিসাবক';

  @override
  String get unitConverter => 'একক রূপান্তরকারী';

  @override
  String get calculationHistory => 'হিসাবের ইতিহাস';

  @override
  String get rectangle => 'আয়তক্ষেত্র';

  @override
  String get triangle => 'ত্রিভুজ';

  @override
  String get polygon => 'বহুভুজ';

  @override
  String get width => 'প্রস্থ';

  @override
  String get height => 'উচ্চতা';

  @override
  String get base => 'ভূমি';

  @override
  String get length => 'দৈর্ঘ্য';

  @override
  String get vertices => 'শীর্ষবিন্দু';

  @override
  String get addVertex => 'বিন্দু যোগ করুন';

  @override
  String get removeVertex => 'মুছুন';

  @override
  String get xCoordinate => 'X';

  @override
  String get yCoordinate => 'Y';

  @override
  String get calculate => 'হিসাব করুন';

  @override
  String get reset => 'পুনরায় শুরু';

  @override
  String get save => 'সংরক্ষণ';

  @override
  String get delete => 'মুছুন';

  @override
  String get cancel => 'বাতিল';

  @override
  String get confirm => 'নিশ্চিত করুন';

  @override
  String get done => 'সম্পন্ন';

  @override
  String get undo => 'পূর্বাবস্থা';

  @override
  String get clear => 'সব মুছুন';

  @override
  String get result => 'ফলাফল';

  @override
  String get area => 'এলাকা';

  @override
  String get unit => 'একক';

  @override
  String get selectUnit => 'একক নির্বাচন করুন';

  @override
  String get squareFeet => 'বর্গফুট';

  @override
  String get decimal => 'ডেসিমাল';

  @override
  String get katha => 'কাঠা';

  @override
  String get bigha => 'বিঘা';

  @override
  String get acre => 'একর';

  @override
  String get squareFeetShort => 'ব.ফু.';

  @override
  String get decimalShort => 'ডেসি';

  @override
  String get kathaShort => 'কাঠা';

  @override
  String get bighaShort => 'বিঘা';

  @override
  String get acreShort => 'একর';

  @override
  String get convertFrom => 'থেকে';

  @override
  String get convertTo => 'তে';

  @override
  String get enterValue => 'মান লিখুন';

  @override
  String get conversionResult => 'রূপান্তরের ফলাফল';

  @override
  String get allConversions => 'সব রূপান্তর';

  @override
  String get tapToAddPoints => 'বিন্দু যোগ করতে মানচিত্রে ট্যাপ করুন';

  @override
  String get addAtLeastThreePoints =>
      'ক্ষেত্রফল গণনার জন্য কমপক্ষে ৩টি বিন্দু যোগ করুন';

  @override
  String pointsAdded(int count) {
    return '$countটি বিন্দু যোগ হয়েছে';
  }

  @override
  String get calculateFromMap => 'ক্ষেত্রফল গণনা করুন';

  @override
  String get clearPoints => 'বিন্দু মুছুন';

  @override
  String get undoLastPoint => 'শেষটি বাদ দিন';

  @override
  String get saveToHistory => 'ইতিহাসে সংরক্ষণ';

  @override
  String get noHistory => 'কোনো সংরক্ষিত হিসাব নেই';

  @override
  String get noHistorySubtitle => 'আপনার হিসাব এখানে দেখাবে';

  @override
  String get favorites => 'প্রিয়';

  @override
  String get allHistory => 'সব';

  @override
  String savedOn(String date) {
    return '$date তারিখে সংরক্ষিত';
  }

  @override
  String get deleteConfirmTitle => 'মুছে ফেলুন';

  @override
  String get deleteConfirmMessage => 'এই হিসাবটি মুছে ফেলতে চান?';

  @override
  String get featureAreaCalculator => 'ক্ষেত্রফল হিসাবক';

  @override
  String get featureAreaCalculatorDesc => 'যেকোনো আকৃতির ক্ষেত্রফল';

  @override
  String get featureMapCalculator => 'মানচিত্র হিসাবক';

  @override
  String get featureMapCalculatorDesc => 'মানচিত্রে এঁকে জমি মাপুন';

  @override
  String get featureUnitConverter => 'একক রূপান্তরকারী';

  @override
  String get featureUnitConverterDesc => 'জমির একক পরিবর্তন করুন';

  @override
  String get featureHistory => 'ইতিহাস';

  @override
  String get featureHistoryDesc => 'সংরক্ষিত হিসাব দেখুন';

  @override
  String get errorInvalidInput => 'সঠিক সংখ্যা লিখুন';

  @override
  String get errorMinVertices => 'বহুভুজের জন্য কমপক্ষে ৩টি বিন্দু প্রয়োজন';

  @override
  String get errorSaveFailed => 'হিসাব সংরক্ষণ ব্যর্থ হয়েছে';

  @override
  String get permissionDenied =>
      'মানচিত্র ব্যবহারের জন্য অবস্থান অনুমতি প্রয়োজন';

  @override
  String get bangladeshUnits => 'প্রচলিত জমির একক';

  @override
  String get kathaInfo => '১ কাঠা = ৭২০ বর্গফুট';

  @override
  String get bighaInfo => '১ বিঘা = ২০ কাঠা = ১৪,৪০০ বর্গফুট';

  @override
  String get decimalInfo => '১ ডেসিমাল = ৪৩৫.৫৬ বর্গফুট';

  @override
  String get acreInfo => '১ একর = ৪৩,৫৬০ বর্গফুট';

  @override
  String get language => 'ভাষা';

  @override
  String get english => 'ইংরেজি';

  @override
  String get bengali => 'বাংলা';

  @override
  String get welcome => 'স্বাগতম!';

  @override
  String get welcomeSubtitle => 'বাংলাদেশের জন্য তৈরি জমি পরিমাপ অ্যাপ';

  @override
  String get features => 'বৈশিষ্ট্যসমূহ';

  @override
  String get unitsInfo => 'একক পরিচিতি';

  @override
  String get close => 'বন্ধ করুন';

  @override
  String get allUnits => 'সব এককে';

  @override
  String get saving => 'সংরক্ষণ হচ্ছে...';

  @override
  String get error => 'ত্রুটি';

  @override
  String get selectUnitLabel => 'একক নির্বাচন';

  @override
  String get from => 'থেকে';

  @override
  String get to => 'তে';

  @override
  String get allConversionsLabel => 'সব রূপান্তর';

  @override
  String get mapSource => 'মানচিত্র';

  @override
  String get selectShape => 'আকৃতি নির্বাচন';

  @override
  String verticesLabel(int count) {
    return 'শীর্ষবিন্দু ($count টি)';
  }

  @override
  String get saveResult => 'ইতিহাসে সংরক্ষণ';

  @override
  String get allUnitsLabel => 'সব এককে';

  @override
  String get plotName => 'জমির নাম';

  @override
  String get plotNotes => 'বিবরণ (ঐচ্ছিক)';

  @override
  String get details => 'বিস্তারিত';

  @override
  String get dimensions => 'মাপ';

  @override
  String get dateCreated => 'তারিখ';

  @override
  String get allAreaValues => 'সব পরিমাপ';

  @override
  String get account => 'অ্যাকাউন্ট';

  @override
  String get signInWithGoogle => 'গুগল দিয়ে সাইন ইন করুন';

  @override
  String get signOut => 'সাইন আউট';

  @override
  String get signIn => 'সাইন ইন';

  @override
  String get loginToSyncText => 'অনলাইনে ডেটা সিঙ্ক করতে লগইন করুন';

  @override
  String get errorPlotNameRequired => 'জমির নাম লিখুন';
}
