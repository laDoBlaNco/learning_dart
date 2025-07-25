/// ENUMS:
///
/// Enums are a way of enumberating a predefined set of values or instances
/// in a way which ensures that there can't be any other instances of that
/// type. Here is an example of a simple enum that defines a simple list of
/// predefined planet types

enum PlanetType { terrestial, gas, ice } // there is no ';' here 🤔

/// Here's an example of an enhanced enum declaration of a class describing
/// planets, with a defined set of constant instances, namely the planets of
/// our solar system.

enum Planet {
  mercury(planetType: PlanetType.terrestial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestial, moons: 0, hasRings: false),
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true),
  earth(planetType:PlanetType.terrestial,moons:1,hasRings:false);

  /// so its an enum class and here's the constructor.
  const Planet({
    required this.planetType, // note the order doesn't matter
    required this.moons,
    required this.hasRings,
  });

  /// all instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// enhanced enums support getters and other methods as well
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

// now using Planet enum

void main() {
  final yourPlanet = Planet.earth;

  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }
}

/// Lots of examples of automatically introduced properties, accessing enumerated
/// value names, etc.