import 'package:blood_app/app/modules/mapa/mapa_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/feed/feed_module.dart';
import 'modules/inicio/inicio_module.dart';
import 'modules/cadastro/cadastro_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: InicioModule()),
    ModuleRoute('/cadastro', module: CadastroModule()),
    ModuleRoute('/feed', module: FeedModule()),
  ];
}
