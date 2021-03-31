class Specie {
  int _id;
  String _name;
  int _order;
  int _genderRate;
  int _captureRate;
  int _baseHappiness;
  bool _isBaby;
  bool _isLegendary;
  bool _isMythical;
  int _hatchCounter;
  bool _hasGenderDifferences;
  bool _formsSwitchable;
  List<FlavorTextEntries> _flavorTextEntries;
  List<FormDescriptions> _formDescriptions;

  Specie(
      {int id,
      String name,
      int order,
      int genderRate,
      int captureRate,
      int baseHappiness,
      bool isBaby,
      bool isLegendary,
      bool isMythical,
      int hatchCounter,
      bool hasGenderDifferences,
      bool formsSwitchable,
      List<FlavorTextEntries> flavorTextEntries,
      List<FormDescriptions> formDescriptions}) {
    this._id = id;
    this._name = name;
    this._order = order;
    this._genderRate = genderRate;
    this._captureRate = captureRate;
    this._baseHappiness = baseHappiness;
    this._isBaby = isBaby;
    this._isLegendary = isLegendary;
    this._isMythical = isMythical;
    this._hatchCounter = hatchCounter;
    this._hasGenderDifferences = hasGenderDifferences;
    this._formsSwitchable = formsSwitchable;
    this._flavorTextEntries = flavorTextEntries;
    this._formDescriptions = formDescriptions;
  }

  int get id => _id;
  String get name => _name;
  int get order => _order;
  int get genderRate => _genderRate;
  int get captureRate => _captureRate;
  int get baseHappiness => _baseHappiness;
  bool get isBaby => _isBaby;
  bool get isLegendary => _isLegendary;
  bool get isMythical => _isMythical;
  int get hatchCounter => _hatchCounter;
  bool get hasGenderDifferences => _hasGenderDifferences;
  bool get formsSwitchable => _formsSwitchable;
  List<FlavorTextEntries> get flavorTextEntries => _flavorTextEntries;
  List<FormDescriptions> get formDescriptions => _formDescriptions;

  Specie.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _order = json['order'];
    _genderRate = json['gender_rate'];
    _captureRate = json['capture_rate'];
    _baseHappiness = json['base_happiness'];
    _isBaby = json['is_baby'];
    _isLegendary = json['is_legendary'];
    _isMythical = json['is_mythical'];
    _hatchCounter = json['hatch_counter'];
    _hasGenderDifferences = json['has_gender_differences'];
    _formsSwitchable = json['forms_switchable'];
    if (json['flavor_text_entries'] != null) {
      _flavorTextEntries = [];
      json['flavor_text_entries'].forEach((v) {
        _flavorTextEntries.add(new FlavorTextEntries.fromJson(v));
      });
    }
    if (json['form_descriptions'] != null) {
      _formDescriptions = [];
      json['form_descriptions'].forEach((v) {
        _formDescriptions.add(new FormDescriptions.fromJson(v));
      });
    }
  }
}

class FlavorTextEntries {
  String _flavorText;

  FlavorTextEntries({String flavorText}) {
    this._flavorText = flavorText;
  }

  String get flavorText => _flavorText;

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    _flavorText = json['flavor_text'];
  }
}

class FormDescriptions {
  String _description;

  FormDescriptions({String description}) {
    this._description = description;
  }

  String get description => _description;

  FormDescriptions.fromJson(Map<String, dynamic> json) {
    _description = json['description'];
  }
}
