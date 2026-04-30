import 'package:area_and_plot/core/utils/area_converter.dart';
import 'package:area_and_plot/features/map_calculator/domain/entities/map_area_point.dart';

class CalculatePolygonAreaUseCase {
  const CalculatePolygonAreaUseCase();

  double call(List<MapAreaPoint> points) {
    if (points.length < 3) return 0.0;
    final geoPoints = points
        .map((p) => (lat: p.latitude, lng: p.longitude))
        .toList();
    return AreaConverter.geoPolygonAreaInSqFt(geoPoints);
  }
}
