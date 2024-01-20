# Odyssey Notes
Simple note-taking app that support basic create, read, update, and delete features. This app currently support extra feature such as search notes. Every note you take in this app contain title, body, and time. If you want, you could also specify your current location while taking the app or you can fetch it directly using the refresh button next to the textformfield. In the next update, that feature will be used to categorize notes based on certain location you've take.

Please note that this app currently is developed for android use only.

## technology used
This app currently using Dart Flutter for building the user interface and using Hive for the database system.

## packages used
As you can see in pubspec.yaml, we are currently using these packages.
```  #hive
dependencies:
  hive: ^2.2.3
  hive_flutter: ^1.1.0

  #dateformat
  intl: ^0.19.0

  flutter_speed_dial: ^7.0.0
  geolocator: ^10.1.0
  geocoding: ^2.1.1

dev_dependencies:
  build_runner: ^2.4.8
  hive_generator: ^2.0.1
```
## how to install
To use this app, you can easily download and install it from the releases section. If you want to modified or debug it, you can clone or fork this repository, then run `flutter pub get` and `flutter run` in your terminal. 
