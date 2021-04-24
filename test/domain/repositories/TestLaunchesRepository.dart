
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/entities/RocketLaunch.dart';
import 'package:of_course_i_still_love_you/domain/repositories/LaunchesRepository.dart';

class TestLaunchesRepository implements LaunchesRepository {

  @override
  Future<List<RocketLaunch>> getLaunchesForRocket(String rocketId) {

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

  @override
  Future<List<Rocket>> getRockets() {

    Rocket rocket1 = Rocket(id:"abc-123",
        name:"Ziggy Stardust",
        description: "Plays guitar",
        active: true);

    Rocket rocket2 = Rocket(id:"abc-456",
        name:"Space Oddity",
        description: "My spaceship knows which way to go",
        active: true);

    Rocket rocket3 = Rocket(id:"abc-789",
        name:"Life On Mars",
        description: "It's the freakiest show",
        active: true);

    List<Rocket> rockets = List.empty(growable: true);
    rockets.add(rocket1);
    rockets.add(rocket2);
    rockets.add(rocket3);

    return Future.value(rockets);
  }

}