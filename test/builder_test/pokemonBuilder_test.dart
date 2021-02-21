import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/builders/PokemonAPIBuilder.dart';
import 'package:pokedex/models/Pokemon.dart';

void main() {
  group("Builder", () {
    Pokemon poke;
    PokemonApiBuilder builder = PokemonApiBuilder();
    test("Can get pokemom from builder", () async {
      Pokemon newPoke =
          await builder.buildPokemon("https://pokeapi.co/api/v2/pokemon/1");
      poke = builder.returnBuldPokemon();
      expect(poke, newPoke);
    });

    test("Can get moves from builder", () async {
      builder.buildMoves();
      poke = builder.returnBuldPokemon();

      expect(poke, isNotNull);
      expect(poke.moves, isNotNull,
          reason:
              "Os movimentos não foram baixados ou instanciados pelo builder. O que temos é ${poke.moves}");
      expect(poke.moves.length, 78);
    });
  });
}
