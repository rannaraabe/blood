import 'package:flutter_modular/flutter_modular.dart';

import 'conteudo_requisitos_page.dart';

class ConteudoRequisitosModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => ConteudoRequisitosPage()),
  ];
}
