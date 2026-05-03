// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyNotifierHash() => r'b8ea00b230ec6a915eb5f5a09fe97f683df5ed6d';

/// See also [HistoryNotifier].
@ProviderFor(HistoryNotifier)
final historyNotifierProvider = AutoDisposeAsyncNotifierProvider<
    HistoryNotifier, List<HistoryEntry>>.internal(
  HistoryNotifier.new,
  name: r'historyNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$historyNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HistoryNotifier = AutoDisposeAsyncNotifier<List<HistoryEntry>>;
String _$favoritesNotifierHash() => r'0d6c5e6a929e0c22f8d7f1fc13c54fb8883e9273';

/// See also [FavoritesNotifier].
@ProviderFor(FavoritesNotifier)
final favoritesNotifierProvider = AutoDisposeAsyncNotifierProvider<
    FavoritesNotifier, List<HistoryEntry>>.internal(
  FavoritesNotifier.new,
  name: r'favoritesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoritesNotifier = AutoDisposeAsyncNotifier<List<HistoryEntry>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
