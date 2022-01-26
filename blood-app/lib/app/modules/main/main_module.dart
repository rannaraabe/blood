import 'package:blood_app/app/modules/main/main_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => MainPage()),
  ];
}