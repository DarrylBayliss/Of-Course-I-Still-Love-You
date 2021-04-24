import 'dart:async';

import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/repositories/AppConfigRepository.dart';
import 'package:of_course_i_still_love_you/domain/repositories/LaunchesRepository.dart';
import 'package:of_course_i_still_love_you/domain/usecases/GetRocketsUseCase.dart';

class GetRocketsUseCaseImpl implements GetRocketsUseCase {

  final LaunchesRepository _launchesRepository;

  final AppConfigRepository _appConfigRepository;

  GetRocketsUseCaseImpl(this._launchesRepository, this._appConfigRepository);

  @override
  Future<List<Rocket>> getRockets() async {

    try {
      return await _launchesRepository.getRockets();
    } catch (exception) {
      return Future.error(exception);
    }
  }

  @override
  void setAppOpenForFirstTime() {
    _appConfigRepository.setAppOpenForFirstTime();
  }

  @override
  Future<bool> isAppOpenForFirstTime() {
    return _appConfigRepository.isAppOpenForFirstTime();
  }
}
