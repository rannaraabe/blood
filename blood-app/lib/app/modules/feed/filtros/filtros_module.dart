import 'package:flutter_modular/flutter_modular.dart';

import 'filtros_controller.dart';
import 'filtros_page.dart';

class FiltrosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => FiltrosController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => FiltrosPage()),
  ];
}
