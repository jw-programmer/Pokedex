import 'package:dio/dio.dart';
import 'package:pokedex/exceptions/PokemonException.dart';
import 'package:pokedex/models/Page.dart';
import 'package:pokedex/models/Pokemon.dart';

class PokemonService {
  static final PokemonService _pokemonService = PokemonService._internal();

  factory PokemonService.getInstance() {
    return _pokemonService;
  }

  PokemonService._internal();

  Future<Pokemon> getPokemon(String url) async {
    return await Dio()
        .get(url)
        .then((Response response) => Pokemon.fromJson(response.data));
  }

  Future<Results> getPokemonByName(String name) async {
    try {
      var query = "https://pokeapi.co/api/v2/pokemon/$name";
      return await Dio().get(query).then((Response response) => Results(
          name: response.data['name'],
          url: "https://pokeapi.co/api/v2/pokemon/${response.data["id"]}"));
    } catch (e) {
      throw new PokemonException(
          "Erro de rede ou pokemon não localizado. Experimente usar o nome inteiro e em ingles.");
    }
  }

  Future<Map<String, dynamic>> getRawPokemon(String url) async {
    return await Dio().get(url).then((Response response) => response.data);
  }

  Future<Page> getPaginateResults(String url) async {
    return await Dio()
        .get(url)
        .then((Response response) => Page.fromJson(response.data));
  }

  Future<String> getPhotoPokemon(String url) async {
    return await getPokemon(url)
        .then((pokemon) => pokemon.sprites.frontDefault);
  }
}
