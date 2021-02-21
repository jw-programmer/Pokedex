import 'Sprites.dart';
import 'Specie.dart';
import 'Move.dart';
import 'Type.dart';

class Pokemon {
  int _id;
  String _name;
  int _baseExperience;
  int _height;
  bool _isDefault;
  int _order;
  int _weight;
  Specie species;
  Sprites _sprites;
  List<Type> types;
  List<Move> moves;

  Pokemon(
      {int id,
      String name,
      int baseExperience,
      int height,
      bool isDefault,
      int order,
      int weight,
      Sprites sprites}) {
    this._id = id;
    this._name = name;
    this._baseExperience = baseExperience;
    this._height = height;
    this._isDefault = isDefault;
    this._order = order;
    this._weight = weight;
    this._sprites = sprites;
  }

  int get id => _id;
  String get name => _name;
  int get baseExperience => _baseExperience;
  int get height => _height;
  bool get isDefault => _isDefault;
  int get order => _order;
  int get weight => _weight;
  Sprites get sprites => _sprites;

  Pokemon.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _baseExperience = json['base_experience'];
    _height = json['height'];
    _isDefault = json['is_default'];
    _order = json['order'];
    _weight = json['weight'];
    _sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
  }
}
