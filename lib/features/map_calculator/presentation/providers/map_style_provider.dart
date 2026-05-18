import 'package:area_and_plot/core/constants/app_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'map_style_provider.g.dart';

enum MapStyle { street, satellite }

const _prefKey = 'map_style';

@Riverpod(keepAlive: true)
class MapStyleNotifier extends _$MapStyleNotifier {
  SharedPreferences? _prefs;

  @override
  Future<MapStyle> build() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      await _prefs!.reload();
      final saved = _prefs!.getString(_prefKey);
      if (saved == MapStyle.street.name) return MapStyle.street;
      return MapStyle.satellite;
    } catch (_) {
      return MapStyle.satellite;
    }
  }

  Future<void> setStyle(MapStyle style) async {
    try {
      _prefs ??= await SharedPreferences.getInstance();
      await _prefs!.setString(_prefKey, style.name);
    } catch (_) {}
    state = AsyncData(style);
  }
}

String mapTileUrl(MapStyle style) {
  if (style == MapStyle.street) {
    const key = AppConstants.maptilerApiKey;
    return 'https://api.maptiler.com/maps/streets/{z}/{x}/{y}{r}.png?key=$key';
  }
  // Stadia Maps "Alidade Satellite" — sharp imagery, native @2x retina via {r},
  // simple signup. Configure via --dart-define=STADIA_API_KEY=...
  const key = AppConstants.stadiaApiKey;
  return 'https://tiles.stadiamaps.com/tiles/alidade_satellite/{z}/{x}/{y}{r}.jpg?api_key=$key';
}

String mapTileAttribution(MapStyle style) => style == MapStyle.street
    ? '© MapTiler © OpenStreetMap contributors'
    : '© Stadia Maps © OpenMapTiles © OpenStreetMap contributors';

// Camera-side cap: how far the user can pinch in.
double maxZoomForStyle(MapStyle style) => 22.0;

// Server-side cap: highest zoom for which the provider actually serves tiles.
// Past this, flutter_map upscales from the deepest native tile.
double maxNativeZoomForStyle(MapStyle style) =>
    style == MapStyle.satellite ? 20.0 : 22.0;
