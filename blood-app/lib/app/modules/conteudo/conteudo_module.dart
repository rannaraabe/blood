import 'package:flutter_modular/flutter_modular.dart';

import 'conteudo_page.dart';

class ConteudoModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ConteudoPage()),
  ];
}
