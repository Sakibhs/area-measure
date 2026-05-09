enum AreaUnit {
  squareFeet,
  decimal,
  katha,
  bigha,
  acre,
  squareMeter,
  hectare,
  squareKilometer,
  squareYard;

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
      case squareMeter:
        return 'Square Meter';
      case hectare:
        return 'Hectare';
      case squareKilometer:
        return 'Square Kilometer';
      case squareYard:
        return 'Square Yard';
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
      case squareMeter:
        return 'বর্গমিটার';
      case hectare:
        return 'হেক্টর';
      case squareKilometer:
        return 'বর্গকিলোমিটার';
      case squareYard:
        return 'বর্গগজ';
    }
  }

  String label(String locale) => locale == 'bn' ? labelBn : labelEn;

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
      case squareMeter:
        return 'm²';
      case hectare:
        return 'ha';
      case squareKilometer:
        return 'km²';
      case squareYard:
        return 'yd²';
    }
  }
}

class UnitConversionFactors {
  UnitConversionFactors._();

  /// Conversion factors relative to square feet (base unit).
  /// Bangladesh standard: 1 Katha = 720 sq ft, 1 Bigha = 20 Katha.
  /// International: 1 m² = 10.7639104 ft²; 1 yd² = 9 ft² (exact).
  static const Map<AreaUnit, double> toSquareFeet = {
    AreaUnit.squareFeet: 1.0,
    AreaUnit.decimal: 435.56,
    AreaUnit.katha: 720.0,
    AreaUnit.bigha: 14400.0,
    AreaUnit.acre: 43560.0,
    AreaUnit.squareMeter: 10.7639104,
    AreaUnit.hectare: 107639.104,
    AreaUnit.squareKilometer: 10763910.4,
    AreaUnit.squareYard: 9.0,
  };
}
