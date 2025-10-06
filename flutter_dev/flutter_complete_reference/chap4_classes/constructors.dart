/*4.2 - CONSTRUCTORS

  A constructor is a particular function that MUST have the same name as the class
  and is used to CREATE or INSTANTIATE the object. Any Dart constructor is either 
  'generative' or 'factory', with the following being the difference:

    ▪ a GENERATIVE constructor always creates a new instance of the class it 
      belongs too;

    ▪ a FACTORY constructor is a sort of "static function" whose return type can 
      be a type or a subtype of the class. It does NOT always return a new instance
      of its class

  On a practical side, factory constructors have the 'factory' keyword at the front
  while generative constructors don't have any keyword at all. Both can be prefixed,
  where possible, with the 'const' keyword and thus become CONSTANT generative or
  factory constructors. The next sections cover a detailed breakdown of all
  constructor types and variants.

*/
