// volleyball_team.dart
// ignore_for_file: unused_import

import 'dart:math';

import 'mixins.dart';

class Country {
  const Country();
}

class Player {}

/* Original implementation
abstract class VolleyballTeam {
  Country get country;

  List<Player> lineUp();

  double sphereVolume(double radius) {
    const constants = 4 / 3 * 3.14;
    return constants * pow(radius, 3);
  }

  String lowercase(String name) {
    return name.toLowerCase();
  }
}
*/

// had an error since this class 'Italy' need to return a 'Country'. so I extended
// Country making Italy a Country
class Italy extends Country {
  const Italy();
}

// The mixin version
abstract class VolleyballTeam with SphereUtils {
  Country get country;

  List<Player> lineup();
}

class SomeVolleyballTeam extends VolleyballTeam {
  @override
  Country get country => const Italy();

  @override
  List<Player> lineup() => const [];
}

void main()=>SomeVolleyballTeam().sphereVolume(10);
