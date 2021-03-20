import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:pokedex/stores/pokemom_store.dart';
import 'package:pokedex/views/Pokemons/pokemon_list/pokemom_cell.dart';

class PokemomListView extends StatefulWidget {
  PokemomListView({Key key}) : super(key: key);

  @override
  _PokemomListViewState createState() => _PokemomListViewState();
}

class _PokemomListViewState extends State<PokemomListView> {
  final store = Modular.get<PokemomStore>();

  @override
  void initState() {
    super.initState();
    store.fistFeth();
  }

  _updateList() async {
    await store.fethPage(store.actualPage.next);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: Observer(builder: (_) {
        return store.isLoading
            ? Center(
                child: Loading(
                  indicator: BallPulseIndicator(),
                  size: 500.0,
                  color: Colors.red,
                ),
              )
            : ListView.builder(
                itemCount: store.results.length,
                itemBuilder: (context, index) {
                  if (index == store.results.length) {
                    _updateList();
                    Center(
                      child: Loading(
                        indicator: BallPulseIndicator(),
                        size: 500.0,
                        color: Colors.red,
                      ),
                    );
                  }
                  return PokemonListCell(store.results[index]);
                });
      }),
    );
  }
}
