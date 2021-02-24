import 'package:dio/dio.dart';
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

  Future<Map<String, dynamic>> getRawPokemon(String url) async {
    return await Dio().get(url).then((Response response) => response.data);
  }

  Future<String> getPhotoPokemon(String url) async {
    return await getPokemon(url)
        .then((pokemon) => pokemon.sprites.frontDefault);
  }
}
