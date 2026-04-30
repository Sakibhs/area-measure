enum AreaUnit {
  squareFeet,
  decimal,
  katha,
  bigha,
  acre;

  String get labelEn {
    switch (this) {
      case squareFeet:
        return 'Square Feet';
      case decimal:
        return 'Decimal';
      case katha:
        return 'Katha';
      case bigha:
        return 'Bigha';
      case acre:
        return 'Acre';
    }
  }

  String get labelBn {
    switch (this) {
      case squareFeet:
        return 'বর্গফুট';
      case decimal:
        return 'ডেসিমাল';
      case katha:
        return 'কাঠা';
      case bigha:
        return 'বিঘা';
      case acre:
        return 'একর';
    }
  }

  String get shortLabel {
    switch (this) {
      case squareFeet:
        return 'ft²';
      case decimal:
        return 'dec';
      case katha:
        return 'কাঠা';
      case bigha:
        return 'বিঘা';
      case acre:
        return 'acre';
    }
  }
}

class UnitConversionFactors {
  UnitConversionFactors._();

  /// Conversion factors relative to square feet (base unit).
  /// Bangladesh standard: 1 Katha = 720 sq ft, 1 Bigha = 20 Katha.
  static const Map<AreaUnit, double> toSquareFeet = {
    AreaUnit.squareFeet: 1.0,
    AreaUnit.decimal: 435.56,
    AreaUnit.katha: 720.0,
    AreaUnit.bigha: 14400.0,
    AreaUnit.acre: 43560.0,
  };
}
