/*5.1.7 - THE COVARIANT KEYWORD

  In some rare cases, I may need to override a class member (method, getter, or setter)
  and replace a type with a subtype. To better understand this use case, I'll use a 
  simple hierarchy (DomesticAnimal, Rabbit, Dog):

  Here its expected that a dog chases a rabbit. With the current hierarchy, I can pass
  'Rabbit' to the 'Dog.hunt' method, however, I can also pass a Dog object to that same
  method and have a dog that chases another dog. For example (in main):

  I could try to change the method signature in the Dog class, but that's isn't allowed.
  In other words, I can't do this (Dog2):

  To correctly compile the code, I have to use the 'covariant' keyword before the type
  name. For example (Dog3):

  Using covariant, I can override a method and REPLACE the parameter type witha subtype.
  With this change, a Dog object can ONLY chase Rabbit objects and its subclasses (if any).
  If I try to pass a Dog object to hunts I'll get a compile-time error (dog3, rabbit3):

  I could have achieved a similar result using a runtime check, but it would have been
  less efficient. While 'covariant' works at compile-time, casts and type checks are 
  executed at runtime. This is how I could have handled this use-case without 'covariant'
    
    @override
    void hunts(DomesticAnimal mammal){
      if(mammal is! Rabbit){
        throw Exception('message');
      }
      // execute my code
    }

  Even if the final result is similar, the behavior is entirely different since the
  method here throws an exception.

  If I placed the 'covariant' keyword in the superclass, then it would inherited by all
  subclasses along the hierarchy. (DomesticAnimal4, Rabbit4, Dog4, etc):

  The superclass usually is the best place to define 'covariant' parameters since all 
  subclasses inherit the behavior. 

*/

abstract class DomesticAnimal {
  const DomesticAnimal();
  void hunts(DomesticAnimal mammal);
}

class Rabbit extends DomesticAnimal {
  const Rabbit();

  @override
  void hunts(DomesticAnimal mammal) {}
}

class Dog extends DomesticAnimal {
  const Dog();

  @override
  void hunts(DomesticAnimal mammal) {}
}

// class Dog2 extends DomesticAnimal {
//   const Dog2();

//   @override
//   void hunts(Rabbit mammal) {} // Compiler error: not a valid override
// }

class Dog3 extends DomesticAnimal {
  const Dog3();

  @override
  void hunts(covariant Rabbit mammal) {} // now it works
}

abstract class DomesticAnimal4 {
  const DomesticAnimal4();

  // since 'covariant' is here, all subclasses will inherit it
  void hunts(covariant DomesticAnimal4 mammal);
}

abstract class SomeDomesticAnimalSubclass4 extends DomesticAnimal4 {
  const SomeDomesticAnimalSubclass4();
}

class Rabbit4 extends DomesticAnimal4 {
  const Rabbit4();

  @override
  void hunts(SomeDomesticAnimalSubclass4 mammal) {} // inherited covariance!
}

class Dog4 extends DomesticAnimal4 {
  const Dog4();

  @override
  void hunts(Rabbit4 mammal) {} // inherited covariance!
}

void main() {
  const dog = Dog();
  const rabbit = Rabbit();

  // this complies and it's what I want
  dog.hunts(rabbit);

  // Hmm... This complies, but not really want I want
  dog.hunts(dog);

  const dog3 = Dog3();
  const rabbit3 = Rabbit();

  // this one is ok as normal
  dog3.hunts(rabbit3);

  // now this gives us the expected compiler error
  // dog3.hunts(dog3);
}
