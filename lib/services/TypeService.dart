import 'package:dio/dio.dart';
import 'package:pokedex/models/Type.dart';

class TypeService {
  static final TypeService _typeService = TypeService._internal();

  factory TypeService.getInstance() {
    return _typeService;
  }

  TypeService._internal();

  Future<Type> getType(String url) async {
    Response response = await Dio().get(url);
    return Type.fromJson(response.data);
  }
}
