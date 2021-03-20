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
  void fethPage(String url) async {
    this.actualPage =
        await PokemonService.getInstance().getPaginateResults(url);
  }

  @action
  void setPokemon(String url) async {
    this.isLoading = true;
    try {
      this.pokemon =
          await PokemonDirector.buildApiPokemom(PokemonApiBuilder(), url);
    } finally {
      this.isLoading = false;
    }
  }
}
