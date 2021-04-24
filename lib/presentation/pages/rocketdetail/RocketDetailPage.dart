import 'package:flutter/material.dart';
import 'package:of_course_i_still_love_you/data/api/SpaceXApiDataSource.dart';
import 'package:of_course_i_still_love_you/di/DependencyInjectorImpl.dart';
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/entities/RocketLaunch.dart';
import 'package:of_course_i_still_love_you/domain/repositories/SpaceXLaunchesRepository.dart';
import 'package:of_course_i_still_love_you/domain/usecases/GetRocketLaunchesUseCaseImpl.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'RocketDetailViewModel.dart';

class RocketDetailPage extends StatefulWidget {

  static const routeName = '/rocketDetail';

  final Rocket rocket;

  final DependencyInjectorImpl dependencyInjector;

  RocketDetailPage(this.rocket, this.dependencyInjector);

  @override
  _RocketDetailPageState createState() {
    RocketDetailViewModel viewModel = dependencyInjector.buildRocketDetailViewModel(rocket);
    return _RocketDetailPageState(viewModel);
  }
}

class _RocketDetailPageState extends State<RocketDetailPage> {
  RocketDetailViewModel model;

  _RocketDetailPageState(this.model);

  @override
  initState() {
    super.initState();

    model.getLaunchesForRocket();
  }

  @override
  Widget build(BuildContext context) {

    const int lineGraphItem = 0;

    const int rocketDescriptionItem = 1;

    // This allows for two extra rows in the listview for the line graph and rocket description
    // Use it to make extra rows and count backwards in the list view index when showing rocket launch rows.
    // e.g: itemCount: rocketLaunchesListModel.launches.length + lineGraphAndDescriptionIndexOffset,
    // e.g: itemBuilder: (context, index) {
    //   final launch = rocketLaunchesListModel.launches[index - lineGraphAndDescriptionIndexOffset];
    const int lineGraphAndDescriptionIndexOffset = 2;

    DateFormat formatter = DateFormat.yMMMd();

    return Scaffold(
        appBar: AppBar(title: Text(model.rocket.name)),
        body: ChangeNotifierProvider(
            create: (context) => model,
            child: RefreshIndicator(
                onRefresh: model.refreshLaunches,
                child: Consumer<RocketDetailViewModel>(
                  builder: (context, rocketLaunchesListModel, child) {
                    return ListView.builder(
                        itemCount: rocketLaunchesListModel.launches.length + lineGraphAndDescriptionIndexOffset,
                        itemBuilder: (context, index) {
                          switch (index) {
                            case lineGraphItem:
                              return SfCartesianChart(series: <ChartSeries>[
                                LineSeries<RocketLaunchGraphData, int>(
                                    dataSource: model.getLaunchesGraphData(),
                                    xValueMapper:
                                        (RocketLaunchGraphData data, _) =>
                                            data.year,
                                    yValueMapper:
                                        (RocketLaunchGraphData data, _) =>
                                            data.launches)
                              ]);
                              break;
                            case rocketDescriptionItem:
                              return ListTile(
                                  title: Text("${model.rocket.description}"));
                              break;
                            default:
                              final launch = rocketLaunchesListModel.launches[index - lineGraphAndDescriptionIndexOffset];

                              return ListTile(
                                leading: Image.network(launch.patch.large),
                                title: Text(
                                    "${launch.name} (${formatter.format(launch.date)})"),
                                subtitle: Text(
                                    "Successful Launch: ${launch.success ? "Yes" : "No"}"),
                                isThreeLine: true,
                              );
                              break;
                          }
                        });
                  },
                ))));
  }
}
