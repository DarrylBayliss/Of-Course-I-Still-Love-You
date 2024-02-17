import 'package:of_course_i_still_love_you/data/dtos/RocketLaunchDTO.dart';

import 'MissionPatch.dart';

class RocketLaunch {
  String id;
  String name;
  DateTime date;
  bool success;
  MissionPatch patch;

  RocketLaunch(
      {required this.id,
      required this.name,
      required this.date,
      required this.success,
      required this.patch});

  factory RocketLaunch.fromDTO(RocketLaunchDTO rocketLaunchDTO) {
    return RocketLaunch(
        id: rocketLaunchDTO.id,
        name: rocketLaunchDTO.name,
        date: rocketLaunchDTO.date,
        success: rocketLaunchDTO.success,
        patch: MissionPatch.fromDTO(rocketLaunchDTO.patch));
  }
}
