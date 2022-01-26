import 'package:mobx/mobx.dart';
part 'main_controller.g.dart';

class MainController = _MainControllerBase with _$MainController;

abstract class _MainControllerBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void updateIndex(index) {
    currentIndex = index;
  }
}
