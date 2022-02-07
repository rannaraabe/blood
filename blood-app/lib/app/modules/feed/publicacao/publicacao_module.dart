import 'package:flutter_modular/flutter_modular.dart';

import 'publicacao_page.dart';

class PublicacaoModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PublicacaoPage()),
  ];
}
