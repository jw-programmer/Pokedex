class Sprites {
  String _backFemale;
  String _backShinyFemale;
  String _backDefault;
  String _frontFemale;
  String _frontShinyFemale;
  String _backShiny;
  String _frontDefault;
  String _frontShiny;

  Sprites(
      {String backFemale,
      String backShinyFemale,
      String backDefault,
      String frontFemale,
      String frontShinyFemale,
      String backShiny,
      String frontDefault,
      String frontShiny}) {
    this._backFemale = backFemale;
    this._backShinyFemale = backShinyFemale;
    this._backDefault = backDefault;
    this._frontFemale = frontFemale;
    this._frontShinyFemale = frontShinyFemale;
    this._backShiny = backShiny;
    this._frontDefault = frontDefault;
    this._frontShiny = frontShiny;
  }

  String get backFemale => _backFemale;
  String get backShinyFemale => _backShinyFemale;
  String get backDefault => _backDefault;
  String get frontFemale => _frontFemale;
  String get frontShinyFemale => _frontShinyFemale;
  String get backShiny => _backShiny;
  String get frontDefault => _frontDefault;
  String get frontShiny => _frontShiny;

  Sprites.fromJson(Map<String, dynamic> json) {
    _backFemale = json['back_female'];
    _backShinyFemale = json['back_shiny_female'];
    _backDefault = json['back_default'];
    _frontFemale = json['front_female'];
    _frontShinyFemale = json['front_shiny_female'];
    _backShiny = json['back_shiny'];
    _frontDefault = json['front_default'];
    _frontShiny = json['front_shiny'];
  }
}
