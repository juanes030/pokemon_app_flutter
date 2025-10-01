// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonListHash() => r'2585ae54ab1801ba659b4a33be470d18bf8bb04f';

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

/// See also [pokemonList].
@ProviderFor(pokemonList)
const pokemonListProvider = PokemonListFamily();

/// See also [pokemonList].
class PokemonListFamily extends Family<AsyncValue<List<Pokemon>>> {
  /// See also [pokemonList].
  const PokemonListFamily();

  /// See also [pokemonList].
  PokemonListProvider call({int limit = 20, int offset = 0}) {
    return PokemonListProvider(limit: limit, offset: offset);
  }

  @override
  PokemonListProvider getProviderOverride(
    covariant PokemonListProvider provider,
  ) {
    return call(limit: provider.limit, offset: provider.offset);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pokemonListProvider';
}

/// See also [pokemonList].
class PokemonListProvider extends AutoDisposeFutureProvider<List<Pokemon>> {
  /// See also [pokemonList].
  PokemonListProvider({int limit = 20, int offset = 0})
    : this._internal(
        (ref) =>
            pokemonList(ref as PokemonListRef, limit: limit, offset: offset),
        from: pokemonListProvider,
        name: r'pokemonListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pokemonListHash,
        dependencies: PokemonListFamily._dependencies,
        allTransitiveDependencies: PokemonListFamily._allTransitiveDependencies,
        limit: limit,
        offset: offset,
      );

  PokemonListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.offset,
  }) : super.internal();

  final int limit;
  final int offset;

  @override
  Override overrideWith(
    FutureOr<List<Pokemon>> Function(PokemonListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PokemonListProvider._internal(
        (ref) => create(ref as PokemonListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        offset: offset,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Pokemon>> createElement() {
    return _PokemonListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonListProvider &&
        other.limit == limit &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PokemonListRef on AutoDisposeFutureProviderRef<List<Pokemon>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `offset` of this provider.
  int get offset;
}

class _PokemonListProviderElement
    extends AutoDisposeFutureProviderElement<List<Pokemon>>
    with PokemonListRef {
  _PokemonListProviderElement(super.provider);

  @override
  int get limit => (origin as PokemonListProvider).limit;
  @override
  int get offset => (origin as PokemonListProvider).offset;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
