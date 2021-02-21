import 'package:dio/dio.dart';
import 'package:pokedex/models/Move.dart';

class MoveService {
  static final MoveService _moveService = MoveService._internal();

  factory MoveService.getInstance() {
    return _moveService;
  }

  MoveService._internal();

  Future<Move> getMove(String url) async {
    Response response = await Dio().get(url);
    return Move.fromJson(response.data);
  }
}
