import 'package:of_course_i_still_love_you/data/api/ApiDataSource.dart';
import 'package:of_course_i_still_love_you/data/dtos/EnginesDTO.dart';
import 'package:of_course_i_still_love_you/data/dtos/MissionPatchDTO.dart';
import 'package:of_course_i_still_love_you/data/dtos/RocketDTO.dart';
import 'package:of_course_i_still_love_you/data/dtos/RocketLaunchDTO.dart';
import 'dart:async';

class TestApiDataSource implements ApiDataSource {
  @override
  Future<List<RocketLaunchDTO>> getLaunchesForRocket(String rocketId) {
    RocketLaunchDTO rocketLaunch1 = RocketLaunchDTO(
        id: "abc-123",
        name: "Ground Control",
        date: DateTime.now(),
        success: true,
        patch: MissionPatchDTO(small: "smallString", large: "largeString"));

    RocketLaunchDTO rocketLaunch2 = RocketLaunchDTO(
        id: "abc-456",
        name: "I'm Afraid of Americans",
        date: DateTime.now(),
        success: true,
        patch: MissionPatchDTO(small: "smallString", large: "largeString"));

    RocketLaunchDTO rocketLaunch3 = RocketLaunchDTO(
        id: "abc-789",
        name: "Let's Dance",
        date: DateTime.now(),
        success: true,
        patch: MissionPatchDTO(small: "smallString", large: "largeString"));

    List<RocketLaunchDTO> rocketLaunchDTOs = List.empty(growable: true);
    rocketLaunchDTOs.add(rocketLaunch1);
    rocketLaunchDTOs.add(rocketLaunch2);
    rocketLaunchDTOs.add(rocketLaunch3);

    return Future.value(rocketLaunchDTOs);
  }

  @override
  Future<List<RocketDTO>> getRockets() {
    RocketDTO rocket1 = RocketDTO(
        id: "abc-123",
        name: "Ziggy Stardust",
        description: "Plays guitar",
        country: "United Kingdom",
        flickrImages: List.empty(),
        engines: EnginesDTO(number: 4),
        active: true);

    RocketDTO rocket2 = RocketDTO(
        id: "abc-456",
        name: "Space Oddity",
        description: "My spaceship knows which way to go",
        country: "United Kingdom",
        flickrImages: List.empty(),
        engines: EnginesDTO(number: 4),
        active: true);

    RocketDTO rocket3 = RocketDTO(
        id: "abc-789",
        name: "Life On Mars",
        description: "It's the freakiest show",
        country: "United Kingdom",
        flickrImages: List.empty(),
        engines: EnginesDTO(number: 4),
        active: true);

    List<RocketDTO> rocketDTOs = List.empty(growable: true);
    rocketDTOs.add(rocket1);
    rocketDTOs.add(rocket2);
    rocketDTOs.add(rocket3);

    return Future.value(rocketDTOs);
  }
}
