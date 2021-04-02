import 'package:flutter/cupertino.dart';
import 'package:pokedex/stores/pokemom_store.dart';

Widget statsPage(PokemomStore store) {
  StringBuffer typeBuff = new StringBuffer();
  var types = store.pokemon.types.map((e) => e.name);
  typeBuff.writeAll(types, "|");
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Tipos: ${typeBuff.toString()}",
        style: TextStyle(fontSize: 25),
      ),
      Text("Altura: ${store.pokemon.height}", style: TextStyle(fontSize: 25)),
      Text("Peso: ${store.pokemon.weight}", style: TextStyle(fontSize: 25)),
      Text("É bebê? ${store.pokemon.species.isBaby ? 'Sim' : 'Não'}",
          style: TextStyle(fontSize: 25)),
      Text("É Lendário? ${store.pokemon.species.isLegendary ? 'Sim' : 'Não'}",
          style: TextStyle(fontSize: 25)),
      Text("É Místico? ${store.pokemon.species.isMythical ? 'Sim' : 'Não'}",
          style: TextStyle(fontSize: 25))
    ],
  );
}
