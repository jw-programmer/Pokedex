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

  final ScrollController _scroll = new ScrollController();

  _updateList() async {
    await store.fethPage(store.actualPage.next);
  }

  @override
  void initState() {
    store.fistFeth();
    _scroll.addListener(() {
      if (_scroll.position.pixels == _scroll.position.maxScrollExtent) {
        _updateList();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            controller: _scroll,
            itemCount: store.results.length,
            itemBuilder: (context, index) {
              return PokemonListCell(store.results[index]);
            });
      }),
    );
  }
}
