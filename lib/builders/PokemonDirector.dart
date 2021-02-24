import 'package:pokedex/interfaces/IPokemonBuilder.dart';
import 'package:pokedex/models/Pokemon.dart';

class PokemonDirector {
  static Future<Pokemon> buildApiPokemom(
      IPokemonBuilder builder, String url) async {
    await builder.buildPokemon(url);
    await builder.buildMoves();
    await builder.buildTypes();
    await builder.buildSpecies();

    return builder.returnBuldPokemon();
  }
}
