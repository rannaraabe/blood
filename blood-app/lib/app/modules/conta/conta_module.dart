import 'package:blood_app/app/modules/conta/conta_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContaModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ContaPage()),
  ];
}
