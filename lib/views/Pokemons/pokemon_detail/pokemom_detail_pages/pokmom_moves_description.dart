import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/stores/pokemom_store.dart';

Widget movesPage(PokemomStore store) {
  return ListView.builder(
      itemCount: store.pokemon.moves.length,
      itemBuilder: (context, index) {
        return ExpansionCard(
            backgroundColor: Colors.grey,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  store.pokemon.moves[index].name,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text("Precisão: ${store.pokemon.moves[index].accuracy}"),
                Text("Força: ${store.pokemon.moves[index].power}"),
                Text("Unidades: ${store.pokemon.moves[index].pp}"),
                // Text(
                //   "Chance de realizar efeito:\n ${store.pokemon.moves[index].effectChance != null ? store.pokemon.moves[index].effectChance : 'Não causa efeito'}",
                // ),
                Text("Prioridade: ${store.pokemon.moves[index].priority}"),
              ],
            ));
      });
}
