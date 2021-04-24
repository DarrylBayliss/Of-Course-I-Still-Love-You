
import 'package:of_course_i_still_love_you/domain/repositories/ConfigRepository.dart';

class TestConfigRepository implements ConfigRepository {

  bool appOpenForFirstTime = false;

  @override
  Future<bool> isAppOpenForFirstTime() {
    return Future.value(appOpenForFirstTime);
  }

  @override
  void setAppOpenForFirstTime() {
    appOpenForFirstTime = true;
  }
}