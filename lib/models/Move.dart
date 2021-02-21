class Move {
  int _id;
  String _name;
  int _accuracy;
  Null _effectChance;
  int _pp;
  int _priority;
  int _power;

  Move(
      {int id,
      String name,
      int accuracy,
      Null effectChance,
      int pp,
      int priority,
      int power}) {
    this._id = id;
    this._name = name;
    this._accuracy = accuracy;
    this._effectChance = effectChance;
    this._pp = pp;
    this._priority = priority;
    this._power = power;
  }

  int get id => _id;
  String get name => _name;
  int get accuracy => _accuracy;
  Null get effectChance => _effectChance;
  int get pp => _pp;
  int get priority => _priority;
  int get power => _power;

  Move.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _accuracy = json['accuracy'];
    _effectChance = json['effect_chance'];
    _pp = json['pp'];
    _priority = json['priority'];
    _power = json['power'];
  }
}
