import 'package:flutter_modular/flutter_modular.dart';

import 'conteudo_impedimentos_page.dart';

class ConteudoImpedimentosModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => ConteudoImpedimentosPage()),
  ];
}
