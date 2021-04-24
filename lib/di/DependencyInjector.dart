
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/presentation/pages/rocketdetail/RocketDetailViewModel.dart';
import 'package:of_course_i_still_love_you/presentation/pages/rocketslist/RocketsListViewModel.dart';

abstract class DependencyInjector {

  // Build a RocketsListViewModel
  RocketsListViewModel buildRocketsListViewModel();

  // Build a RocketDetailViewModel
  RocketDetailViewModel buildRocketDetailViewModel(Rocket rocket);
}