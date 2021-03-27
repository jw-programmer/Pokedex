import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:pokedex/stores/pokemom_store.dart';
import 'package:pokedex/views/Pokemons/pokemon_list/pokemom_cell.dart';
import 'package:pokedex/views/Pokemons/pokemon_list/pokemom_list_search.dart';

class PokemomListView extends StatefulWidget {
  PokemomListView({Key key}) : super(key: key);

  @override
  _PokemomListViewState createState() => _PokemomListViewState();
}

class _PokemomListViewState extends State<PokemomListView> {
  final store = Modular.get<PokemomStore>();

  final ScrollController _scroll = new ScrollController();

  bool _fistTime = true;

  @override
  void initState() {
    store.fistFeth();
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.pixels == _scroll.position.maxScrollExtent) {
        store.fethPage(store.actualPage.next);
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: PokemomListSearch());
              })
        ],
      ),
      body: Observer(builder: (_) {
        if ((store.isPageLoading && _fistTime) || store.isPokemonLoading) {
          _fistTime = false;
          return Center(
            child: Loading(
              indicator: BallPulseIndicator(),
              size: 100,
              color: Colors.red,
            ),
          );
        } else {
          return ListView.builder(
              controller: _scroll,
              itemCount: store.results.length + 1,
              itemBuilder: (context, index) {
                if (store.results.length == index) {
                  return Center(
                    child: Loading(
                      indicator: BallPulseIndicator(),
                      size: 50,
                      color: Colors.red,
                    ),
                  );
                } else {
                  return PokemonListCell(store.results[index]);
                }
              });
        }
      }),
    );
  }
}
