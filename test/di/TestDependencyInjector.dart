
import 'package:of_course_i_still_love_you/di/DependencyInjector.dart';
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/presentation/pages/rocketdetail/RocketDetailViewModel.dart';
import 'package:of_course_i_still_love_you/presentation/pages/rocketslist/RocketsListViewModel.dart';

import '../domain/usecases/TestRocketsUseCase.dart';

class TestDependencyInjector implements DependencyInjector {

  @override
  RocketDetailViewModel buildRocketDetailViewModel(Rocket rocket) {
    // TODO: implement buildRocketDetailViewModel
    throw UnimplementedError();
  }

  @override
  RocketsListViewModel buildRocketsListViewModel() {
    return RocketsListViewModel(TestRocketsUseCase());
  }
}