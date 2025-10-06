// ignore_for_file: unused_local_variable, unused_field

/*4.2.1 - GENERATIVE CONSTRUCTORS

  A generative constructor is used to create new instances of a class. It consists of
  a name, a formal parameters list, and an optional body. Here's an example of a 
  generative constructor that initializes all of its members with the recommended
  INITIALIZING FORMAL syntax (Fraction1)

  Both numerator and denominator are immediately initialized, before the constructor
  body which is absent here) executes. To invoke this constructor and thus create 
  a Fraction1 object, I just make a normal assignment (Fraction1)

  From Dart 2.0 onwards, the new keyword shouldn't be used since its implicit. this is 
  valid for both generative and factory constructors. The INIITALIZER LIST syntax has
  the same effect as the initializing formal but doesn't require the constructor params
  to have the same name as the class members. Example below (Fraction2)

  Now this is usefule when I want to initialize some variables that shouldn't be 
  visible outside of the class scope. In the example, _num and _den are not visible
  from outside and they don't even appear in the parameters list. They are hidden,
  and the constructor initializes them before executing the body (if any). Regardless,
  initializing formals would have been fine as well (Fraction 3)

  One approach isn't better than the other; they have the same effect. It is up to 
  me to decide which one is better for me and what I'm doing. The initializing formal
  syntax is the most widely used, especially for Flutter.

    NOTE: All classes in Dart must always have a constructor. As such, if I don't 
          specify it, the compiler implicitly generates a default, generative, 
          parameter-less constructor.

  Constructors always have a body, which is executed after the initializion phase.
  When I don't give my constructor a body, the compiler automatically adds an empty
  oen for me. For example Fraction4

  The 'this' keyword is used to get a reference to the current instance. Since 
  'this' is always implicit, the Dart team recommends to ONLY use it when there
  is a name conflict, such as when I initialize variables in constructor bodies.
  Which is why vscode at times tells me that its not necessary to put 'this'.
  This is not always possible though! consider the example Fraction5

  In Fraction5 I get a compiler error because numerator and denominator are non-nullable
  variables so they must be initialized with a value. Since the constructor body is 
  executed AFTER the object initialization phase, this code tries to create non-nullable
  variables without setting a value (which is an error). To fix the issue, I could 
  make the fields nullable (Fraction5)

  The code no complies because numerator an denominator are first initialized with
  null and then, at a later point (when the constructor body is executed), they're 
  given the values I pass as parameters. There are two main problems here:

    1. I have converted variables to nullable types, even if they do NOT  need to be
       nullable for my use-case.
    
    2. I will have to constantly access variables with the bang ! operator since I know
       that they are not null in practice, even if their static type says otherwise.

  In general, i shoudl only work with nullable types when needed. A better solution to
  the problem could be making both variables 'late' so that they don't need an 
  immediate initialization Fraction6

  Variables are not nullable anymore but this still doesn't look quite right (Fraction6).
  I'll see later in Section 2.3 - "Constant constructors" the importance of const 
  constructors in classes. Since the body is only used to initialize variables and 
  has no other logic, at this point initializing formal or an initializer list are better
  choices. As a general guideline:

    1. I should use the initializing formal syntax whenever possible. If I want to 'hide'
       internal variable names, I can make them library-private and use the initializer
       list syntax. This is the preferred way of initializing instance variables of a 
       class.

    2. If my constructor doesn't have a body, just don't create it. The compiler will
       automatically create an empty one for me. I should try not to initialize instance 
       variables in the constructor body, unless they are nullable (or late) AND require
       additional logic (such as extra computations or sanity checks)

    3. The constructor body is executed AFTER the variable initialization phase. It's a
       great place to implement "startup logic", such as throwing exceptions if variables
       haven't been initialized with correct values or calling functions.

  The parameters of a constructor follows the same rules that were covered in Chapter 3 - 
  Section 4.3 "Optional parameters" for function parameters. They can be optional named
  or positional (Fraction 7 & 8)

  I cannot define a named optional parameter with a library-private variable. For 
  exaample, the 'required this._numerator' syntax is wrong since library-private 
  variables cannot start with an underscore.
*/
class Fraction1 {
  int numerator;
  int denominator;

  Fraction1(this.numerator, this.denominator);
}

class Fraction2 {
  int _num;
  int _den;

  Fraction2(int numerator, int denominator)
    : _num = numerator,
      _den = denominator;
}

class Fraction3 {
  int _num;
  int _den;
  Fraction3(this._num, this._den);
}

class Fraction4 {
  int numerator;
  int denominator;

  // constructor with an empty body
  // Fraction4(this.numerator, this.denominator);

  // same as before but {} is not needed since the compiler already adds it
  // Fraction4(this.numerator, this.denominator) {}

  // constructor with a non-empty body
  Fraction4(this.numerator, this.denominator) {
    checkDenominator();
    doSomethingElse();
  }

  void checkDenominator() {}
  void doSomethingElse() {}
}

class Fraction5 {
  int? numerator;
  int? denominator;
  Fraction5(int numerator, int denominator) {
    // compiler error
    this.numerator = numerator;
    this.denominator;
  }
}

class Fraction6 {
  late int numerator;
  late int denominator;

  Fraction6(int numerator, int denominator) {
    this.numerator = numerator;
    this.denominator = denominator;
  }
}

class Fraction7 {
  int numerator;
  int denominator;

  Fraction7({required this.numerator, this.denominator = 0});
}

class Fraction8 {
  int numerator;
  int denominator;

  Fraction8(this.numerator, [this.denominator = 0]);
}

void main() {
  final example1 = Fraction1(2, 5); // this is OK
  final exaample2 = new Fraction1(2, 5); // Also ok but 'new' is redundant
}
