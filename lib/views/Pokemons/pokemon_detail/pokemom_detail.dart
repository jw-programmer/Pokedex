import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/stores/pokemom_store.dart';
import 'package:pokedex/views/Pokemons/pokemon_detail/pokemom_detail_pages/pokemom_image_descrpition.dart';
import 'package:pokedex/views/Pokemons/pokemon_detail/pokemom_detail_pages/pokemom_stats_page.dart';
import 'package:pokedex/views/Pokemons/pokemon_detail/pokemom_detail_pages/pokmom_moves_description.dart';

class PokemonDetail extends StatelessWidget {
  PokemonDetail(String name);

  final store = Modular.get<PokemomStore>();

  PageController _controller = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(store.pokemon.name),
        ),
        body: PageView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          children: [
            imageAndDescription(store),
            movesPage(store),
            statsPage(store)
          ],
        ));
  }
}
