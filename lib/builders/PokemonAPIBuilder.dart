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

  Future<Map<String, dynamic>> _requestRawPokemom() async {
    print("Eu peço os dados crus");
    return await _pokeService
        .getRawPokemon("https://pokeapi.co/api/v2/pokemon/${_result.id}");
  }

  @override
  void buildMoves() async {
    List<Move> moves = List();
    print(_result.name);
    Map<String, dynamic> raw = await _requestRawPokemom()
        .then((Map<String, dynamic> full) => full['moves']);
    raw.forEach((k, y) async {
      print("Chego no for");
      if (k == "move") {
        Move move = await _moveService.getMove(y['url']);
        moves.add(move);
      }
    });
    _result.moves = moves;
  }

  @override
  void buildTypes() async {
    List<Type> types = List();
    Map<String, dynamic> raw =
        await _requestRawPokemom().then((full) => full['types']);
    raw.forEach((k, v) async {
      if (k == "type") {
        Type type = await _typeService.getType(v['url']);
        types.add(type);
      }
    });
    _result.types = types;
  }

  @override
  void buildSpecies() async {
    String url = await _requestRawPokemom().then((full) => full['url']);
    Specie specie = await _specieService.getSpecie(url);
    _result.species = specie;
  }

  @override
  Pokemon returnBuldPokemon() {
    return _result;
  }
}
