import 'package:flutter/material.dart';
import 'package:of_course_i_still_love_you/di/DependencyInjector.dart';
import 'package:of_course_i_still_love_you/presentation/pages/rocketdetail/RocketDetailPage.dart';
import 'package:of_course_i_still_love_you/presentation/pages/rocketslist/RocketsListViewModel.dart';
import 'package:provider/provider.dart';

class RocketsListPage extends StatefulWidget {

  final DependencyInjector dependencyInjector;

  RocketsListPage(this.dependencyInjector);

  @override
  _RocketsListPageState createState() {
    return _RocketsListPageState(dependencyInjector.buildRocketsListViewModel());
  }
}

class _RocketsListPageState extends State<RocketsListPage> {
  RocketsListViewModel model;

  _RocketsListPageState(this.model);

  @override
  initState() {
    super.initState();

    model.isAppOpenForFirstTime().then((firstTime) {
      if (firstTime) {
        createDialog();
      }
    });

    model.getRockets();
  }

  void createDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Welcome to Of Course I Still Love You!"),
            actions: [
              TextButton(
                  onPressed: () {
                    model.setAppOpenForFirstTime();
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Rockets'), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.assistant_photo_rounded),
              tooltip: 'Show Active Rockets',
              onPressed: () {
                model.active = !model.active;
                model.refreshRockets();
              })
        ]),
        body: ChangeNotifierProvider(
            create: (context) => model,
            child: RefreshIndicator(
                onRefresh: model.refreshRockets,
                child: Consumer<RocketsListViewModel>(
                  builder: (context, rocketListModel, child) {
                    return ListView.builder(
                        itemCount: rocketListModel.rockets.length,
                        itemBuilder: (context, index) {
                          final rocket = rocketListModel.rockets[index];

                          return ListTile(
                            leading: Image.network(rocket.flickrImages.first),
                            title: Text(
                                "${rocket.name} (Engine Count: ${rocket.engines.number})"),
                            subtitle: Text(rocket.country),
                            isThreeLine: true,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RocketDetailPage.routeName,
                                  arguments: rocket);
                            },
                          );
                        });
                  },
                ))));
  }
}
