import 'package:mobx/mobx.dart';

part 'conta_controller.g.dart';

class ContaController = _ContaControllerBase with _$ContaController;

abstract class _ContaControllerBase with Store {
  _ContaControllerBase();
}
