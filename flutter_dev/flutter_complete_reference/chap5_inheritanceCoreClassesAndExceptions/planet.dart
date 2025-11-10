// planet.dart
// ignore_for_file: unused_import

import 'mixins.dart';
import 'dart:math';

class Satellite {}

class PlanetInfo {}

/* Original implementation...

abstract class Planet {
  bool get inSolarSystem;

  List<Satellite> getSatellite();
  PlanetInfo getPlanetDetails();

  double sphereVolume(double radius) {
    const constants = 4 / 3 * 3.14;
    return constants * pow(radius, 3);
  }

  String lowercase(String name) {
    return name.toLowerCase();
  }
}

*/

// mixin implementation
abstract class Planet with SphereUtils {
  bool get inSolarSystem;

  List<Satellite> getSatellites();
  PlanetInfo getPlanetDetails();
}
