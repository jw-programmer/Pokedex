import 'package:dio/dio.dart';
import 'package:pokedex/models/Specie.dart';

class SpecieService {
  static final SpecieService _specieService = SpecieService._internal();

  factory SpecieService.getInstance() {
    return _specieService;
  }

  SpecieService._internal();

  Future<Specie> getSpecie(String url) async {
    Response response = await Dio().get(url);
    return Specie.fromJson(response.data);
  }
}
