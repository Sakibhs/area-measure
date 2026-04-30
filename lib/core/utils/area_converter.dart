import 'package:area_and_plot/core/constants/unit_constants.dart';

class AreaConverter {
  const AreaConverter._();

  static double convert({
    required double value,
    required AreaUnit from,
    required AreaUnit to,
  }) {
    if (from == to) return value;
    final valueInSqFt = value * (UnitConversionFactors.toSquareFeet[from] ?? 1.0);
    return valueInSqFt / (UnitConversionFactors.toSquareFeet[to] ?? 1.0);
  }

  static Map<AreaUnit, double> convertToAll(double valueInSqFt) {
    return {
      for (final unit in AreaUnit.values)
        unit: valueInSqFt / (UnitConversionFactors.toSquareFeet[unit] ?? 1.0),
    };
  }

  /// Shoelace formula for polygon area given a list of [x, y] vertex pairs.
  static double polygonAreaFromVertices(List<({double x, double y})> vertices) {
    final n = vertices.length;
    if (n < 3) return 0.0;
    double area = 0.0;
    for (int i = 0; i < n; i++) {
      final j = (i + 1) % n;
      area += vertices[i].x * vertices[j].y;
      area -= vertices[j].x * vertices[i].y;
    }
    return area.abs() / 2.0;
  }

  /// Spherical excess formula for polygon area given geo-coordinates (lat/lng).
  /// Returns area in square metres, then converted to square feet.
  static double geoPolygonAreaInSqFt(List<({double lat, double lng})> points) {
    final n = points.length;
    if (n < 3) return 0.0;

    const earthRadiusM = 6371008.8;
    double area = 0.0;

    for (int i = 0; i < n; i++) {
      final j = (i + 1) % n;
      final lat1 = _toRad(points[i].lat);
      final lat2 = _toRad(points[j].lat);
      final dLng = _toRad(points[j].lng - points[i].lng);
      area += dLng * (2 + (lat1 + lat2).abs().clamp(0, 3.14159));
    }

    final areaSqM = (area * earthRadiusM * earthRadiusM / 2).abs();
    return areaSqM * 10.7639; // sq metres to sq feet
  }

  static double _toRad(double deg) => deg * 3.141592653589793 / 180.0;
}
