import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/models/Move.dart';

import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/models/Specie.dart';
import 'package:pokedex/models/Type.dart';
import 'package:pokedex/services/MoveService.dart';
import 'package:pokedex/services/PokemonService.dart';
import 'package:pokedex/services/SpecieService.dart';
import 'package:pokedex/services/TypeService.dart';

void main() {
  test('Pokemon service can get one pokemon and create o object', () async {
    var service = PokemonService.getInstance();

    Pokemon poke =
        await service.getPokemon("https://pokeapi.co/api/v2/pokemon/1");

    expect(poke.name, "bulbasaur");
    expect(poke.sprites, isNotNull);
    expect(poke.moves, isNull);
    expect(poke.types, isNull);
    expect(poke.species, isNull);
  });

  test('Pokemon service can get raw pokemon by url', () async {
    var service = PokemonService.getInstance();

    Map poke =
        await service.getRawPokemon("https://pokeapi.co/api/v2/pokemon/1");

    expect(poke['name'], "bulbasaur");
  });

  test('Pokemon service can get default sprite by url', () async {
    var service = PokemonService.getInstance();

    String photo_url =
        await service.getPhotoPokemon("https://pokeapi.co/api/v2/pokemon/1");

    expect(photo_url,
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png");
  });

  test('Move service can get moves object', () async {
    var service = MoveService.getInstance();

    Move move = await service.getMove("https://pokeapi.co/api/v2/move/13/");

    expect(move.name, "razor-wind");
  });

  test("Type service can feath type object", () async {
    var service = TypeService.getInstance();
    Type type = await service.getType("https://pokeapi.co/api/v2/type/12/");

    expect(type.id, 12);
    expect(type.name, "grass");
  });

  test("Specie service can feath specie object", () async {
    var service = SpecieService.getInstance();
    Specie specie =
        await service.getSpecie("https://pokeapi.co/api/v2/pokemon-species/1/");

    expect(specie.name, "bulbasaur");
    expect(specie.flavorTextEntries, isNotNull);
    expect(specie.formDescriptions, isNotNull);
    expect(specie.flavorTextEntries.length, 94);
    expect(specie.formDescriptions.length, 0);
    expect(specie.flavorTextEntries[0].flavorText,
        "A strange seed was\nplanted on its\nback at birth.\u000cThe plant sprouts\nand grows with\nthis POKéMON.");
  });
}
