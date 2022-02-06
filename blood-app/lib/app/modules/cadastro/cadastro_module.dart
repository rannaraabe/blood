import 'package:blood_app/app/modules/cadastro/cadastro_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastroModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CadastroPage()),
  ];
}
