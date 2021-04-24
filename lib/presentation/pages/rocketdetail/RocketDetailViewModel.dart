import 'package:flutter/foundation.dart';
import "package:collection/collection.dart";
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/entities/RocketLaunch.dart';
import 'package:of_course_i_still_love_you/domain/usecases/GetRocketLaunchesUseCaseImpl.dart';

class RocketDetailViewModel with ChangeNotifier {
  Rocket rocket;

  final List<RocketLaunch> launches = List.empty(growable: true);

  final GetRocketLaunchesUseCaseImpl getRocketLaunchesUseCase;

  RocketDetailViewModel(this.rocket, this.getRocketLaunchesUseCase);

  void getLaunchesForRocket() {
    getRocketLaunchesUseCase.getLaunchesForRocket(rocket).then((launches) {
      this.launches.clear();
      this.launches.addAll(launches);
      this.launches.sorted((a, b) => a.date.year.compareTo(b.date.year));
      notifyListeners();
    });
  }

  Future<void> refreshLaunches() async {
    getLaunchesForRocket();
  }

  List<RocketLaunchGraphData> getLaunchesGraphData() {

    Map<int, List<RocketLaunch>> launchesGroupedByYear =
        groupBy(launches, (RocketLaunch launch) {
      return launch.date.year;
    });

    List<RocketLaunchGraphData> rocketLaunchGraphList =
        List.empty(growable: true);

    launchesGroupedByYear.forEach((year, launches) {
      RocketLaunchGraphData rocketLaunchGraphData =
          RocketLaunchGraphData(year, launches.length);
      rocketLaunchGraphList.add(rocketLaunchGraphData);
    });

    return rocketLaunchGraphList;
  }
}

class RocketLaunchGraphData {
  RocketLaunchGraphData(this.year, this.launches);

  final int year;
  final int launches;
}
