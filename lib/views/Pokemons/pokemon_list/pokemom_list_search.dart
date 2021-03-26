import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:pokedex/models/Page.dart';
import 'package:pokedex/services/PokemonService.dart';
import 'package:pokedex/stores/pokemom_store.dart';
import 'package:pokedex/views/Pokemons/pokemon_list/pokemom_cell.dart';

class PokemomListSearch extends SearchDelegate<Results> {
  PokemonService service = PokemonService.getInstance();
  final store = Modular.get<PokemomStore>();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != "") {
      return FutureBuilder<Results>(
          future: service.getPokemonByName(query),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Observer(builder: (_) {
                if (store.isPokemonLoading) {
                  return Center(
                    child: Loading(
                      indicator: BallPulseIndicator(),
                      size: 100,
                      color: Colors.red,
                    ),
                  );
                } else {
                  return PokemonListCell(snapshot.data);
                }
              });
            } else {
              return Center(
                child: Loading(
                  indicator: BallPulseIndicator(),
                  size: 100,
                  color: Colors.red,
                ),
              );
            }
          });
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("Pesquisar por ${query != "" ? query : " "}");
  }
}
