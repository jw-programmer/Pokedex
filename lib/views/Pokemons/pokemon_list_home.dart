import 'package:flutter/material.dart';

class PokemomListView extends StatefulWidget {
  PokemomListView({Key key}) : super(key: key);

  @override
  _PokemomListViewState createState() => _PokemomListViewState();
}

class _PokemomListViewState extends State<PokemomListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Esta será a lista de Pokemons"),
    );
  }
}
