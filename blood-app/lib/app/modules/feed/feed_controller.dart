import 'package:mobx/mobx.dart';

part 'feed_controller.g.dart';

class FeedController = _FeedControllerBase with _$FeedController;

abstract class _FeedControllerBase with Store {
  _FeedControllerBase();

  @observable
  bool filter = false;

  @action
  void changeFilter() {
    filter = !filter;
  }
}
