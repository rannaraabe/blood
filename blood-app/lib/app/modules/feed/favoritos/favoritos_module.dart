import 'package:flutter_modular/flutter_modular.dart';

import 'favoritos_page.dart';

class FavoritosModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => FavoritosPage(originalList: [])),
  ];
}
