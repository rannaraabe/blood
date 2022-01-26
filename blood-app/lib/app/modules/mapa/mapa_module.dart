import 'package:blood_app/app/modules/mapa/mapa_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MapaModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => MapaPage()),
  ];
}
