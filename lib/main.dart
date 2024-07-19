import 'package:flutter/material.dart';
import 'package:of_course_i_still_love_you/di/DependencyInjectorImpl.dart';
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/presentation/pages/rocketdetail/RocketDetailPage.dart';
import 'presentation/pages/rocketslist/RocketsListPage.dart';

void main() {
  final DependencyInjectorImpl dependencyInjector = DependencyInjectorImpl();

  runApp(OfCourseIStillLoveYouApp(dependencyInjector));
}

class OfCourseIStillLoveYouApp extends StatelessWidget {
  final DependencyInjectorImpl dependencyInjector;

  OfCourseIStillLoveYouApp(this.dependencyInjector);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Of Course I Still Love You',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: RocketsListPage(dependencyInjector),
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == RocketDetailPage.routeName) {
            final rocket = settings.arguments as Rocket;
            return MaterialPageRoute(
              builder: (context) {
                return RocketDetailPage(rocket, dependencyInjector);
              },
            );
          }

          assert(false, 'Need to implement ${settings.name}');
          return null;
        });
  }
}
