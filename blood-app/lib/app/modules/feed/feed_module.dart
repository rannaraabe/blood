import 'package:flutter_modular/flutter_modular.dart';

import 'feed_page.dart';

class FeedModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => FeedPage()),
  ];
}