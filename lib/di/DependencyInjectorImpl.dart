import 'package:of_course_i_still_love_you/data/api/SpaceXApiDataSource.dart';
import 'package:of_course_i_still_love_you/di/DependencyInjector.dart';
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/repositories/AppConfigRepository.dart';
import 'package:of_course_i_still_love_you/domain/repositories/SpaceXLaunchesRepository.dart';
import 'package:of_course_i_still_love_you/domain/usecases/GetRocketLaunchesUseCaseImpl.dart';
import 'package:of_course_i_still_love_you/domain/usecases/GetRocketsUseCaseImpl.dart';
import 'package:of_course_i_still_love_you/domain/usecases/SetAppOpenForFirstTimeUseCaseImpl.dart';
import 'package:of_course_i_still_love_you/presentation/pages/rocketdetail/RocketDetailViewModel.dart';
import 'package:of_course_i_still_love_you/presentation/pages/rocketslist/RocketsListViewModel.dart';
import 'package:of_course_i_still_love_you/domain/usecases/IsAppOpenForFirstTimeUseCaseImpl.dart';

class DependencyInjectorImpl implements DependencyInjector {
  RocketsListViewModel buildRocketsListViewModel() {
    return RocketsListViewModel(
        GetRocketsUseCaseImpl(SpaceXLaunchesRepository(SpaceXApiDataSource())),
        IsAppOpenForFirstTimeUseCaseImpl(AppConfigRepository()),
        SetAppOpenForFirstTimeUseCaseImpl(AppConfigRepository()));
  }

  RocketDetailViewModel buildRocketDetailViewModel(Rocket rocket) {
    return RocketDetailViewModel(
        rocket,
        GetRocketLaunchesUseCaseImpl(
            SpaceXLaunchesRepository(SpaceXApiDataSource())));
  }
}
