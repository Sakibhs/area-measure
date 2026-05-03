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
  const key = AppConstants.maptilerApiKey;
  return style == MapStyle.street
      ? 'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=$key'
      : 'https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=$key';
}
