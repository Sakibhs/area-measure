// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyNotifierHash() => r'635b6680c01cb988e8fc38001ee243454acd94d1';

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
String _$favoritesNotifierHash() => r'd2c64101f5a489106969eaf4cefa88ac35a74a49';

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
