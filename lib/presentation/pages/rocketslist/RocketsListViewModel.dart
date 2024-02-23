import 'package:flutter/foundation.dart';
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/usecases/GetRocketsUseCase.dart';
import 'dart:async';

import 'package:of_course_i_still_love_you/domain/usecases/IsAppOpenForFirstTimeUseCase.dart';
import 'package:of_course_i_still_love_you/domain/usecases/SetAppOpenForFirstTimeUseCase.dart';

class RocketsListViewModel with ChangeNotifier {
  final List<Rocket> rockets = List.empty(growable: true);

  bool active = false;

  final GetRocketsUseCase getRocketsUseCase;
  final IsAppOpenForFirstTimeUseCase isAppOpenForFirstTimeUseCase;
  final SetAppOpenForFirstTimeUseCase setAppOpenForFirstTimeUseCase;

  RocketsListViewModel(this.getRocketsUseCase,
      this.isAppOpenForFirstTimeUseCase, this.setAppOpenForFirstTimeUseCase);

  void getRockets() {
    getRocketsUseCase.getRockets().then((rockets) {
      this.rockets.clear();

      if (active) {
        this.rockets.addAll(rockets.where((rocket) => rocket.active));
      } else {
        this.rockets.addAll(rockets);
      }

      notifyListeners();
    });
  }

  Future<void> refreshRockets() async {
    getRockets();
  }

  Future<bool> isAppOpenForFirstTime() {
    return isAppOpenForFirstTimeUseCase.isAppOpenForFirstTime();
  }

  void setAppOpenForFirstTime() {
    return setAppOpenForFirstTimeUseCase.setAppOpenForFirstTime();
  }
}
