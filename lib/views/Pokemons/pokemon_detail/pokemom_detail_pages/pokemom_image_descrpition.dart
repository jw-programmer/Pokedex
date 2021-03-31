import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/stores/pokemom_store.dart';

Widget ImageAndDescription(PokemomStore store) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: FlipCard(
                front: Image.network(
                  store.pokemon.sprites.frontDefault,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                back: Image.network(
                  store.pokemon.sprites.backDefault,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                )),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: FlipCard(
                front: Image.network(
                  store.pokemon.sprites.frontShiny,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                back: Image.network(
                  store.pokemon.sprites.backShiny,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                )),
          )
        ],
      ),
      Text(
        "Informacao, Bio, de vários jogos e linguas",
        style: TextStyle(fontSize: 25),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: store.pokemon.species.flavorTextEntries.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Card(
                  child: Text(store
                      .pokemon.species.flavorTextEntries[index].flavorText),
                ));
              }))
    ],
  );
}
