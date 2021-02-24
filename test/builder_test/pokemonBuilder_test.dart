@Timeout(const Duration(seconds: 180))

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/builders/PokemonAPIBuilder.dart';
import 'package:pokedex/builders/PokemonDirector.dart';
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

    // test("Can get raw pokemons in build", () async {
    //   var raw = await builder.requestRawPokemom('moves');

    //   expect(raw, isNotNull);

    //   expect(raw.length, 78);
    // });

    test("Can get moves from builder", () async {
      await builder.buildMoves();
      poke = builder.returnBuldPokemon();

      expect(poke, isNotNull);
      expect(poke.moves, isNotNull,
          reason:
              "Os movimentos não foram baixados ou instanciados pelo builder. O que temos é ${poke.moves}");
      expect(poke.moves.length, 78);
    });

    test("Can get types from builder", () async {
      await builder.buildTypes();
      poke = builder.returnBuldPokemon();

      expect(poke, isNotNull);
      expect(poke.types, isNotNull,
          reason:
              "Os tipos não foram baixados ou instanciados pelo builder. O que temos é ${poke.moves}");
      expect(poke.types.length, 2);
    });

    test("Can get specie from builder", () async {
      await builder.buildSpecies();
      poke = builder.returnBuldPokemon();

      expect(poke, isNotNull);
      expect(poke.species, isNotNull, reason: "Provavelmente porque é nulo");

      expect(poke.species.name, "bulbasaur");
    });
  });

  test("Builder can get a full pokemom object", () async {
    Pokemon poke = await PokemonDirector.buildApiPokemom(
        PokemonApiBuilder(), "https://pokeapi.co/api/v2/pokemon/1");

    expect(poke, isNotNull);
    expect(poke.moves, isNotNull,
        reason:
            "Os movimentos não foram baixados ou instanciados pelo builder. O que temos é ${poke.moves}");
    expect(poke.moves.length, 78);
    expect(poke.types, isNotNull,
        reason:
            "Os tipos não foram baixados ou instanciados pelo builder. O que temos é ${poke.moves}");
    expect(poke.types.length, 2);
    expect(poke.species, isNotNull,
        reason: "Speci não foi instanciada pelo diretor");

    expect(poke.species.name, "bulbasaur");
  });
}
