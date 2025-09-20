/*2.1.2 NULLABILITY AND NON-NULLABILITY*/

void main() {
  /*As I can deduce from the name, a nullable variable can either be null or have a 
    value of its type. On the other side, a non-nullable variable can never hold 
    the null value
  */
  int? age = 25; // a 'nullable' variable (because it COULD be 'null')
  age = null;
  print(age);

  String? name; // 'name' is automatically initialized with 'null'
  String? name2 = null; // This is redundant but allowed
  print('$name $name2');
  

}
