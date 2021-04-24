import 'package:flutter/material.dart';
import 'package:of_course_i_still_love_you/di/DependencyInjectorImpl.dart';
import 'package:of_course_i_still_love_you/presentation/pages/rocketdetail/RocketDetailPage.dart';
import 'presentation/pages/rocketslist/RocketsListPage.dart';

void main() {

  DependencyInjectorImpl dependencyInjector = DependencyInjectorImpl();

  runApp(OfCourseIStillLoveYouApp(dependencyInjector));
}

class OfCourseIStillLoveYouApp extends StatelessWidget {

  DependencyInjectorImpl dependencyInjector;

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
          var routes = <String, WidgetBuilder>{
            RocketDetailPage.routeName: (context) => RocketDetailPage(settings.arguments, dependencyInjector)
          };
          WidgetBuilder builder = routes[settings.name];
          return MaterialPageRoute(builder: (context) => builder(context));
        });
  }
}
