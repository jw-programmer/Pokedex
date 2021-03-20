import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:pokedex/models/Page.dart';
import 'package:pokedex/services/PokemonService.dart';

class PokemonListCell extends StatelessWidget {
  Results _result;

  PokemonListCell(Results result) {
    this._result = result;
  }

  Future<Image> _getImage() async {
    String src =
        await PokemonService.getInstance().getPhotoPokemon(this._result.url);
    return Image.network(src);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(this._result.name),
        FutureBuilder<Image>(
            future: _getImage(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return snapshot.data;
              } else {
                return Loading(
                  indicator: BallPulseIndicator(),
                  size: 100.0,
                  color: Colors.blue,
                );
              }
            })
      ],
    );
  }
}
