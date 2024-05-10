# Of Course I Still Love You

![Of Course I Still Love You App Screen](/images/AppScreen.png)

An app showing rocket launches using the [SpaceX REST Api](https://github.com/r-spacex/SpaceX-API). 

Written using Dart & Flutter.

# Architecture

The app uses clean architecture. The packages are organised in the following ways:

- data
    - api
    - dto
- di
- domain
    - entities
    - repositories
    - usecases
- presentation
    - pages
    - utils
    - widgets
- main.dart

The two screens in the app are **RocketsListPage.dart** and **RocketDetailPage.dart**. Each screen has a corresponding **ViewModel** responsible for populating the screens with data via UseCases.

# Rocket List Page

![Rocket List Page](/images/AppScreen.png)

**RocketsListPage.dart** shows a listview of rockets, queried from the network. The list can be filtered to show active rockets by tapping the button in the appbar, at the top right of the screen.

When the app is opened for the first time, a dialog is shown to welcome the user. When the user taps on the ok button, a boolean is stored in local storage so the app knows to avoid showing the dialog again.

Tapping a rocket in the list will transition the app to the **RocketDetailPage.dart**.

# Rocket Detail Page

![Rocket Detail Page](/images/RocketDetailPage.png)

**RocketDetailPage.dart** shows detailed information about a rocket. The data is received by making a network request, using the rocketId as a query parameter.

The data can be refreshed by pulling down from the top of the screen where a refresh indicator appears. The returned data is shown using a listview containing different items.

The first ListItem is a line chart showing the amount of launches for the rocket over the years.

The second ListItem is a description of the rocket. This comes from the **Rocket** object, passed in as a parameter from **RocketsListPage.dart**.

The final ListItems are launches that occurred for the rocket, the list is ordered by year. The patch image for each launch are loaded in via a network call.

# Testing

Unit Tests are added to cover much of the underlying logic. The tests use mocked abstract classes as dependencies to return stub data.

# Dependencies

The following dependencies are used in the app:

- [http](https://pub.dev/packages/http)
- [provider](https://pub.dev/packages/provider)
- [rxDart](https://pub.dev/packages/rxdart)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [intl](https://pub.dev/packages/intl)
- [syncfusion_flutter_charts](https://pub.dev/packages/syncfusion_flutter_charts)
