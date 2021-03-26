// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemom_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemomStore on _PokemomStoreBase, Store {
  final _$actualPageAtom = Atom(name: '_PokemomStoreBase.actualPage');

  @override
  Page get actualPage {
    _$actualPageAtom.reportRead();
    return super.actualPage;
  }

  @override
  set actualPage(Page value) {
    _$actualPageAtom.reportWrite(value, super.actualPage, () {
      super.actualPage = value;
    });
  }

  final _$resultsAtom = Atom(name: '_PokemomStoreBase.results');

  @override
  List<Results> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(List<Results> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$pokemonAtom = Atom(name: '_PokemomStoreBase.pokemon');

  @override
  Pokemon get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(Pokemon value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  final _$isPageLoadingAtom = Atom(name: '_PokemomStoreBase.isPageLoading');

  @override
  bool get isPageLoading {
    _$isPageLoadingAtom.reportRead();
    return super.isPageLoading;
  }

  @override
  set isPageLoading(bool value) {
    _$isPageLoadingAtom.reportWrite(value, super.isPageLoading, () {
      super.isPageLoading = value;
    });
  }

  final _$isPokemonLoadingAtom =
      Atom(name: '_PokemomStoreBase.isPokemonLoading');

  @override
  bool get isPokemonLoading {
    _$isPokemonLoadingAtom.reportRead();
    return super.isPokemonLoading;
  }

  @override
  set isPokemonLoading(bool value) {
    _$isPokemonLoadingAtom.reportWrite(value, super.isPokemonLoading, () {
      super.isPokemonLoading = value;
    });
  }

  final _$fistFethAsyncAction = AsyncAction('_PokemomStoreBase.fistFeth');

  @override
  Future<void> fistFeth() {
    return _$fistFethAsyncAction.run(() => super.fistFeth());
  }

  final _$fethPageAsyncAction = AsyncAction('_PokemomStoreBase.fethPage');

  @override
  Future<void> fethPage(String url) {
    return _$fethPageAsyncAction.run(() => super.fethPage(url));
  }

  final _$setPokemonAsyncAction = AsyncAction('_PokemomStoreBase.setPokemon');

  @override
  Future<void> setPokemon(String url) {
    return _$setPokemonAsyncAction.run(() => super.setPokemon(url));
  }

  @override
  String toString() {
    return '''
actualPage: ${actualPage},
results: ${results},
pokemon: ${pokemon},
isPageLoading: ${isPageLoading},
isPokemonLoading: ${isPokemonLoading}
    ''';
  }
}
