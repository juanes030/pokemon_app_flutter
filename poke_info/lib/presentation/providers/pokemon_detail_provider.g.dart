// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonDetailHash() => r'806c6dcb1c6134e9db00fda4b6bd6f2280bf1649';

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

/// See also [pokemonDetail].
@ProviderFor(pokemonDetail)
const pokemonDetailProvider = PokemonDetailFamily();

/// See also [pokemonDetail].
class PokemonDetailFamily extends Family<AsyncValue<Pokemon>> {
  /// See also [pokemonDetail].
  const PokemonDetailFamily();

  /// See also [pokemonDetail].
  PokemonDetailProvider call(String pokemonName) {
    return PokemonDetailProvider(pokemonName);
  }

  @override
  PokemonDetailProvider getProviderOverride(
    covariant PokemonDetailProvider provider,
  ) {
    return call(provider.pokemonName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pokemonDetailProvider';
}

/// See also [pokemonDetail].
class PokemonDetailProvider extends AutoDisposeFutureProvider<Pokemon> {
  /// See also [pokemonDetail].
  PokemonDetailProvider(String pokemonName)
    : this._internal(
        (ref) => pokemonDetail(ref as PokemonDetailRef, pokemonName),
        from: pokemonDetailProvider,
        name: r'pokemonDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pokemonDetailHash,
        dependencies: PokemonDetailFamily._dependencies,
        allTransitiveDependencies:
            PokemonDetailFamily._allTransitiveDependencies,
        pokemonName: pokemonName,
      );

  PokemonDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pokemonName,
  }) : super.internal();

  final String pokemonName;

  @override
  Override overrideWith(
    FutureOr<Pokemon> Function(PokemonDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PokemonDetailProvider._internal(
        (ref) => create(ref as PokemonDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pokemonName: pokemonName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Pokemon> createElement() {
    return _PokemonDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonDetailProvider && other.pokemonName == pokemonName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pokemonName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PokemonDetailRef on AutoDisposeFutureProviderRef<Pokemon> {
  /// The parameter `pokemonName` of this provider.
  String get pokemonName;
}

class _PokemonDetailProviderElement
    extends AutoDisposeFutureProviderElement<Pokemon>
    with PokemonDetailRef {
  _PokemonDetailProviderElement(super.provider);

  @override
  String get pokemonName => (origin as PokemonDetailProvider).pokemonName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
