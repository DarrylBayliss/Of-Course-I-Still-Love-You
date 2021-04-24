import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/usecases/GetRocketsUseCase.dart';

class TestRocketsUseCase implements GetRocketsUseCase {

  bool appOpenForFirstTime = false;

  @override
  Future<List<Rocket>> getRockets() {
    Rocket rocket1 = Rocket(
        id: "abc-123",
        name: "Ziggy Stardust",
        description: "Plays guitar",
        active: true);

    Rocket rocket2 = Rocket(
        id: "abc-456",
        name: "Space Oddity",
        description: "My spaceship knows which way to go",
        active: true);

    Rocket rocket3 = Rocket(
        id: "abc-789",
        name: "Life On Mars",
        description: "It's the freakiest show",
        active: true);

    List<Rocket> rockets = List.empty(growable: true);
    rockets.add(rocket1);
    rockets.add(rocket2);
    rockets.add(rocket3);

    return Future.value(rockets);
  }

  @override
  Future<bool> isAppOpenForFirstTime() {
    return Future.value(appOpenForFirstTime);
  }

  @override
  void setAppOpenForFirstTime() {
    appOpenForFirstTime = true;
  }
}
