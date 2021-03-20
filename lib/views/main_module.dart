import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/views/Pokemons/pokemon_list/pokemom_list.dart';
import 'package:pokedex/views/main_widget.dart';

class AppModule extends MainModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => MainWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => PokemomListView()),
        ModularRouter("/:id", child: (_, args) => args.params['id'])
      ];
}
