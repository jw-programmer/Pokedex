import 'package:mobx/mobx.dart';
import 'package:pokedex/builders/PokemonAPIBuilder.dart';
import 'package:pokedex/builders/PokemonDirector.dart';
import 'package:pokedex/models/Page.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/services/PokemonService.dart';
part 'pokemom_store.g.dart';

class PokemomStore = _PokemomStoreBase with _$PokemomStore;

abstract class _PokemomStoreBase with Store {
  @observable
  Page actualPage;

  @observable
  List<Results> results;

  @observable
  Pokemon pokemon;

  @observable
  bool isLoading = false;

  @action
  Future<void> fistFeth() async {
    this.results = [];
    await this.fethPage("https://pokeapi.co/api/v2/pokemon?limit=100&offset=0");
  }

  @action
  Future<void> fethPage(String url) async {
    this.isLoading = true;
    try {
      if (this.actualPage != null && this.actualPage.next == "") {
        return;
      }
      this.actualPage =
          await PokemonService.getInstance().getPaginateResults(url);
      this.results.addAll(this.actualPage.results);
    } finally {
      this.isLoading = false;
    }
  }

  @action
  Future<void> setPokemon(String url) async {
    this.isLoading = true;
    try {
      this.pokemon =
          await PokemonDirector.buildApiPokemom(PokemonApiBuilder(), url);
    } finally {
      this.isLoading = false;
    }
  }
}
