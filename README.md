# Of Course I Still Love You

An app showing rocket launches using the [SpaceX REST Api](https://github.com/r-spacex/SpaceX-API). Written in Flutter.

# Commentry

The app uses clean architecture, with the packages organised like so:

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

The two screens in the app are **RocketsListPage.dart** and **RocketDetailPage.dart**. Each screen has a corresponding **ViewModel**, responsible for populating the screens with data via UseCases.

**RocketsListPage.dart** shows a listview of rockets, queried from the network. The list can be filtered to show active rockets by tapping the button in the appbar, at the top right of the screen.

When the app is opened for the first time, a dialog is shown to welcome the user. When the user taps on the ok button, a boolean is stored in local storage so the app knows to avoid showing the dialog again.

Tapping the button causes another network request to occur. This is not ideal in my opinion. If I had more time, I have two approaches in mind to solve this:

1. Add a method to **RocketsListViewModel.dart** to return a list of **Rocket**, filtered by the `active` property.
2. Add a persistence layer to cache the network request, then replay the request. Filtering out rockets with the `active` property set to false.

Tapping a rocket in the list will transition the app to the **RocketDetailPage.dart**.

**RocketDetailPage.dart** shows particular information about a rocket. The data is received by making a network request, using the rocketId as a query parameter.

The data can be refreshed by pulling down from the top of the screen, where a refresh indicator appears. The returned data is showing using a listview, containing different items. An improvement I would like to make is to show the refresh indicator when the screen first appears.

The first listitem is a line chart, showing the amount of launches for the rocket over the years. There is some screen clipping occurring with the graph axis, I was unable to solve this due to time constraints.

The second listitem is a description of the rocket. This comes from the **Rocket** object, passed in as a parameter from **RocketsListPage.dart**.

The final listitems are launches that occurred for the rocket, the list is ordered by year. I was unable to add headers or sticky headers to the listview due to time constraints. I will continue to try to add this for my own learning about Flutter.

Unit Tests are added to cover much of the underlying logic. The tests use mocked abstract classes as dependencies to return stub data. I considered using mockito for this task, however thought adding a dependency to create mocks for a small app was unneeded.

I struggled to add UI tests using **flutter_driver**. I put this down to a lack of knowledge on how UI tests on Flutter works. I'll continue to learn more about this area so I understand it better in future. The UI tests written so far are included in the project, although they do not pass.

# Dependencies

I added the following dependencies to the app:

http: ^0.13.1 (Networking)
provider: ^4.3.3 (Observable support)
shared_preferences: ^2.0.5 (Android / iOS local storage support)
intl: ^0.17.0 (Date Formatting)
syncfusion_flutter_charts: ^18.4.49 (Line Chart Widget)

