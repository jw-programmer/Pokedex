import 'package:pokedex/interfaces/IPokemonBuilder.dart';
import 'package:pokedex/models/Pokemon.dart';

class PokemonDirector {
  Future<Pokemon> buildApiPokemom(IPokemonBuilder builder, String url) async {
    await builder.buildPokemon(url);
    builder.buildMoves();
    builder.buildTypes();
    builder.buildSpecies();

    return builder.returnBuldPokemon();
  }
}
