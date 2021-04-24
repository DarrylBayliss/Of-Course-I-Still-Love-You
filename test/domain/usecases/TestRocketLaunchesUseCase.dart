
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/entities/RocketLaunch.dart';
import 'package:of_course_i_still_love_you/domain/usecases/GetRocketLaunchesUseCase.dart';

class TestRocketLaunchesUseCase implements GetRocketLaunchesUseCase {

  @override
  Future<List<RocketLaunch>> getLaunchesForRocket(Rocket rocket) {

    RocketLaunch rocketLaunch1 = RocketLaunch(id:"abc-123",
        name:"Ground Control",
        date: DateTime.now(),
        success: true,
        patch: null);

    RocketLaunch rocketLaunch2 = RocketLaunch(id:"abc-456",
        name:"I'm Afraid of Americans",
        date: DateTime.now(),
        success: true,
        patch: null);

    RocketLaunch rocketLaunch3 = RocketLaunch(id:"abc-789",
        name:"Let's Dance",
        date: DateTime.now(),
        success: true,
        patch: null);

    List<RocketLaunch> rocketLaunchs = List.empty(growable: true);
    rocketLaunchs.add(rocketLaunch1);
    rocketLaunchs.add(rocketLaunch2);
    rocketLaunchs.add(rocketLaunch3);

    return Future.value(rocketLaunchs);
  }
}