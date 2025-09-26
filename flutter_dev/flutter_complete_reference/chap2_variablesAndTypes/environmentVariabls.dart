// ignore_for_file: unused_local_variable

/*2.2.6 - DART'S ENVIRONMENT VARIABLES:

  Any Dart application can initialize strings, numbers, or bool values from vars
  being declared from 'outside' the program itself. The --define flag can be added
  to the dart run command to create environment variables. for example:

    dart run --define=api-key-abdefgh  🤔🤯🤓

  Using this command, I can read the content of the api-key variable from Dart using
  a special constructor called String.fromEnvironment
*/

void main() {
  final apiToken = String.fromEnvironment(
    'api-key',
    defaultValue: 'defaultKeyResult',
  );
  print(apiToken);

  /*In the same way, env vars can also be loaded from numbers and booleans.
    I can even define a default value in case the key wasn't associated to a
    value when running the code. Example of that working above now

  */
  final intValue1 = int.fromEnvironment('age', defaultValue: -1);
  final intValue2 = int.fromEnvironment('age2', defaultValue: -1);
  final boolValue = bool.fromEnvironment('status');
  print(intValue1);
  print(intValue2);
  print(boolValue);


  /*To define multiple Dart env vars at once, I just need to repeat the --define
    command with the same key-value format

    Hardcoding the strings into the app is no different and no less secure than 
    env vars. There is a Dart linter rule that suggests avoiding env vars since 
    they create a hidden global state, which leads to less readability and more
    challenging maintenance of the project. I recommend reading command-line
    arguments or reading data from a configuration file inside the application
    itself.
  */
}
