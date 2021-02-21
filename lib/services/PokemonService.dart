import 'package:dio/dio.dart';
import 'package:pokedex/models/Pokemon.dart';

class PokemonService {
  static final PokemonService _pokemonService = PokemonService._internal();

  factory PokemonService.getInstance() {
    return _pokemonService;
  }

  PokemonService._internal();

  Future<Pokemon> getPokemon(String url) async {
    Response response = await Dio().get(url);
    return Pokemon.fromJson(response.data);
  }
}
