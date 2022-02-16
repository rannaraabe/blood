import 'package:blood_app/app/modules/mapa/mapa_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/feed/feed_module.dart';
import 'modules/feed/publicacao/publicacao_module.dart';
import 'modules/inicio/inicio_module.dart';
import 'modules/cadastro/cadastro_module.dart';
import 'modules/conta/conta_module.dart';
import 'modules/conteudo/conteudo_module.dart';
import 'modules/conteudo/impedimentos/conteudo_impedimentos_module.dart';
import 'modules/conteudo/requisitos/conteudo_requisitos_module.dart';
import 'modules/login/login_module.dart';
import 'modules/main/main_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: InicioModule()),
    ModuleRoute('/login', module: LoginModule()),

    /// Defines the navigation between pages:
    ModuleRoute('/main', module: MainModule()),
    ModuleRoute('/cadastro', module: CadastroModule()),
    ModuleRoute('/feed', module: FeedModule()),
    ModuleRoute('/conta', module: ContaModule()),
    ModuleRoute('/conteudo', module: ConteudoModule()),
    ModuleRoute('/conteudo/requisitos', module: ConteudoRequisitosModule()),
    ModuleRoute('/conteudo/impedimentos', module: ConteudoImpedimentosModule()),
    ModuleRoute('/mapa', module: MapaModule()),
  ];
}
