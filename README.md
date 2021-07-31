# Find Pet

![coverage][flutter_version]
![coverage][dart_version]
![coverage][bloc_version]
![coverage][override_bloc_version]
![coverage][sentry_io]
![coverage][dio]
![coverage][development] ![coverage][staging] ![coverage][production]
![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

---

# Getting Started 🚀

In this project we will discuss:

- ✅ [Problem](#problem)
- ✅ [Solution](#solution)
- ✅ [Flavours](#flavours-)
- ✅ [Dependencies](#dependencies)
- 🔲 [Translation](#working-with-translations-)
- 🔲 [Tests](#tests-)

## Problem 💥

Develop a pet finder app with Flutter (iOS and Android) based on the DOG-CEO API. With the help of the app the user
should be able to find pets and can view detail.

This application should have two (2) screens

- [x] Dashboard (List of pets)
- [x] Pet detail (It should show Pet detail once user click on any pet). 

You can use following api to fetch data:
https://dog.ceo/dog-api/

<table>
  <tr>
    <td> <img src="https://user-images.githubusercontent.com/24449076/127727636-a444687b-23ec-4068-b9d1-b901c28c66c7.jpg" title="Pets" width="180" height="350" /></td>
    <td> <img src="https://user-images.githubusercontent.com/24449076/127727638-094ce5d8-f99d-4a51-8d13-e59a05597c4b.jpg" title="Pet detail" width="180" height="350" /></td>
  </tr> 
</table>

## Solution 💪

The solution is designed so a user can access load available pets from the internet. The detail is given below:

- `lib` will contains view(pages, widgets, components), BLoC, configuration, etc.
- `packages` will keep network, database, and repository layer

### State management

![coverage][state_management] ![coverage][bloc_version] ![coverage][override_bloc_version]

- We have used `BLoC's 7.0.0` version as State management library. But as `Bloc` team is working
  on [newer version](https://github.com/felangel/bloc/tree/feat/replace-mapEventToState-with-on%3CE%3E)
  that will help to remove boilerplate of writing `mapEventsToSate` and bloc will look like this:
  ```dart 
  class AlbumsBloc extends Bloc<DashboardEvent, DashboardState> {
      AlbumsBloc(): super(AlbumsInitial()) {
          // Load tavailable dogs
          on<LoadDogs>(_loadDogs);
      }
      
      // perform your action here
      void _loadDogs(LoadDogs event, Emit<DashboardState> emit) async {
          // your business logic will be here to handle state and event
      }
  }
  ```
### Log controller

![coverage][sentry_io]

- We have used [Sentry.io](https://sentry.io/welcome/) to log all errors and issues in a server.


### Flavours 🚀

This project contains 3 flavors:

![coverage][development] ![coverage][staging] ![coverage][production]

Before run application you need to create `.env` file in app directory and add these varaibles:

```dotenv
#Logs Controller --  create your key (https://sentry.io/welcome/) and add
SENTRY_IO=

API_URL=https://dog.ceo/dog-api/
```

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Find Pet works on iOS, Android, and Web._

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:find_pet/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

---

## Tests 🧪

This section is under development and will be continue after a break.


[flutter_version]: https://img.shields.io/badge/flutter-2.2.3-1389FD.svg

[dart_version]: https://img.shields.io/badge/Dart-2.13.4-1389FD.svg

[state_management]: https://img.shields.io/badge/State_Management-42b983.svg

[bloc_version]: https://img.shields.io/badge/BLoC-7.0.0-42b983.svg

[override_bloc_version]: https://img.shields.io/badge/Override_BLoC-upcoming_version-42b983.svg

[sentry_io]: https://img.shields.io/badge/Sentry-5.1.0-362d59.svg

[dio]: https://img.shields.io/badge/dio-4.0.0-4334eb.svg

[production]: https://img.shields.io/badge/Production-0bbf5c.svg

[development]: https://img.shields.io/badge/Development-b6d91c.svg

[staging]: https://img.shields.io/badge/Staging-edd013.svg

[coverage_badge]: coverage_badge.svg

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html

[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
