import 'package:of_course_i_still_love_you/data/api/SpaceXApiDataSource.dart';
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/entities/RocketLaunch.dart';
import 'package:of_course_i_still_love_you/domain/repositories/LaunchesRepository.dart';
import 'dart:async';

class SpaceXLaunchesRepository extends LaunchesRepository {
  final SpaceXApiDataSource spaceXApi;

  SpaceXLaunchesRepository(this.spaceXApi);

  @override
  Future<List<Rocket>> getRockets() async {
    return spaceXApi.getRockets().then((rocketDTOList) =>
        rocketDTOList.map((rocketDTO) => Rocket.fromDTO(rocketDTO)).toList());
  }

  @override
  Future<List<RocketLaunch>> getLaunchesForRocket(String rocketId) async {
    return spaceXApi.getLaunchesForRocket(rocketId).then(
        (rocketLaunchDTOList) => rocketLaunchDTOList
            .map((rocketLaunchDTO) => RocketLaunch.fromDTO(rocketLaunchDTO))
            .toList());
  }
}
