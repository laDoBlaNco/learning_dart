import 'dart:io';

main() {
  print('===============================================================');
  print('Pizza Price "Small: 5 USD, Medium: 7 USD, Large: 10 USD"');
  print('Please enter your pizza size (small, medium, or large):');

  String? pizza_size = stdin.readLineSync();
  print('How many pizzas do you want of $pizza_size');

  int? qty = int.parse(
      stdin.readLineSync().toString()); // but this isn't null safe now
  // this works for now but its definitely not the dart way since I need to kill
  // the null safety to get it to compile by changing input to .toString() from String?
  var price = null;

  if (pizza_size == 'small') {
    price = 5;
    var total = price * qty;
    print('Your Total Payment is: $total');
  } else if (pizza_size == 'medium') {
    price = 7;
    var total = price * qty;
    print('Your Total Payment is: $total');
  } else if (pizza_size == 'large') {
    price = 10;
    var total = price * qty;
    print('Your Total Payment is: $total');
  } else {
    (pizza_size == null);
    print('Invalid Pizza Size Input. Please run this program again!!');
  }
}
