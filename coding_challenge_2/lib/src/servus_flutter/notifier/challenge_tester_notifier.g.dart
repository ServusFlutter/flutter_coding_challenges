// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_tester_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengeTesterNotifierHash() =>
    r'16c1d4ee8985266dd89eab1de8d9890396c646b6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChallengeTesterNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ChallengeTesterSuccessState?> {
  late final String testId;

  FutureOr<ChallengeTesterSuccessState?> build(
    String testId,
  );
}

/// See also [ChallengeTesterNotifier].
@ProviderFor(ChallengeTesterNotifier)
const challengeTesterNotifierProvider = ChallengeTesterNotifierFamily();

/// See also [ChallengeTesterNotifier].
class ChallengeTesterNotifierFamily
    extends Family<AsyncValue<ChallengeTesterSuccessState?>> {
  /// See also [ChallengeTesterNotifier].
  const ChallengeTesterNotifierFamily();

  /// See also [ChallengeTesterNotifier].
  ChallengeTesterNotifierProvider call(
    String testId,
  ) {
    return ChallengeTesterNotifierProvider(
      testId,
    );
  }

  @override
  ChallengeTesterNotifierProvider getProviderOverride(
    covariant ChallengeTesterNotifierProvider provider,
  ) {
    return call(
      provider.testId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies =
      const <ProviderOrFamily>[];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      const <ProviderOrFamily>{};

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'challengeTesterNotifierProvider';
}

/// See also [ChallengeTesterNotifier].
class ChallengeTesterNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChallengeTesterNotifier,
        ChallengeTesterSuccessState?> {
  /// See also [ChallengeTesterNotifier].
  ChallengeTesterNotifierProvider(
    String testId,
  ) : this._internal(
          () => ChallengeTesterNotifier()..testId = testId,
          from: challengeTesterNotifierProvider,
          name: r'challengeTesterNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$challengeTesterNotifierHash,
          dependencies: ChallengeTesterNotifierFamily._dependencies,
          allTransitiveDependencies:
              ChallengeTesterNotifierFamily._allTransitiveDependencies,
          testId: testId,
        );

  ChallengeTesterNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.testId,
  }) : super.internal();

  final String testId;

  @override
  FutureOr<ChallengeTesterSuccessState?> runNotifierBuild(
    covariant ChallengeTesterNotifier notifier,
  ) {
    return notifier.build(
      testId,
    );
  }

  @override
  Override overrideWith(ChallengeTesterNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChallengeTesterNotifierProvider._internal(
        () => create()..testId = testId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        testId: testId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChallengeTesterNotifier,
      ChallengeTesterSuccessState?> createElement() {
    return _ChallengeTesterNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengeTesterNotifierProvider && other.testId == testId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, testId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChallengeTesterNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<ChallengeTesterSuccessState?> {
  /// The parameter `testId` of this provider.
  String get testId;
}

class _ChallengeTesterNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChallengeTesterNotifier,
        ChallengeTesterSuccessState?> with ChallengeTesterNotifierRef {
  _ChallengeTesterNotifierProviderElement(super.provider);

  @override
  String get testId => (origin as ChallengeTesterNotifierProvider).testId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
