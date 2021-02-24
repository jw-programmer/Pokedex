import 'package:pokedex/interfaces/IPokemonBuilder.dart';
import 'package:pokedex/models/Move.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/models/Specie.dart';
import 'package:pokedex/models/Type.dart';
import 'package:pokedex/services/MoveService.dart';
import 'package:pokedex/services/PokemonService.dart';
import 'package:pokedex/services/SpecieService.dart';
import 'package:pokedex/services/TypeService.dart';

class PokemonApiBuilder implements IPokemonBuilder {
  Pokemon _result;

  PokemonService _pokeService;
  MoveService _moveService;
  TypeService _typeService;
  SpecieService _specieService;

  PokemonApiBuilder() {
    this._pokeService = PokemonService.getInstance();
    this._moveService = MoveService.getInstance();
    this._typeService = TypeService.getInstance();
    this._specieService = SpecieService.getInstance();
  }

  @override
  Future<Pokemon> buildPokemon(key) async {
    this._result = await _pokeService.getPokemon(key);
    return this._result;
  }

  //Devido a forma como o dar trata eventos assincronos, essa é a melhor soução para o problema.
  Future<List<Move>> _requestBuildMovesAsync() async {
    List<Move> moves = List();
    List<dynamic> rmoves = await _pokeService
        .getRawPokemon("https://pokeapi.co/api/v2/pokemon/${_result.id}")
        .then((var full) => full['moves']);
    for (var rawmove in rmoves) {
      Move move = await _moveService.getMove(rawmove['move']['url']);
      moves.add(move);
    }
    return moves;
  }

  @override
  Future<void> buildMoves() async {
    this._result.moves = await _requestBuildMovesAsync();
  }

  Future<List<Type>> _requestTypesAsync() async {
    List<Type> types = List();
    List<dynamic> rtypes = await _pokeService
        .getRawPokemon("https://pokeapi.co/api/v2/pokemon/${_result.id}")
        .then((var full) => full['types']);
    for (var rawtype in rtypes) {
      Type type = await _typeService.getType(rawtype['type']['url']);
      types.add(type);
    }
    return types;
  }

  @override
  Future<void> buildTypes() async {
    this._result.types = await _requestTypesAsync();
  }

  @override
  Future<void> buildSpecies() async {
    String url = await _pokeService
        .getRawPokemon("https://pokeapi.co/api/v2/pokemon/${_result.id}")
        .then((var raw) => raw['species']['url']);
    Specie specie = await _specieService.getSpecie(url);
    _result.species = specie;
  }

  @override
  Pokemon returnBuldPokemon() {
    return _result;
  }
}
