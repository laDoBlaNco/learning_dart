/* Module 4: Using Local Storage with Flutter

 Understanding local storage in Flutter
  ▪ Equips my app to save data on device
  ▪ Retains user settings and state
  ▪ Caches data for offline functionality
  ▪ Improves performance by reducing load times

Integrating local storage in Flutter
  ▪ Requires understanding data flow and persistence
  ▪ Involves knowing how to store data
  ▪ Involves managing data during app operations

  ▪ SharedPreferences
  ▪ SQLite
  ▪ Hive
  ▪ Files
  ▪ LocalStorage

Initialization is important
  ▪ Set up your chosen storage method
  ▪ Ensure the app is ready to manage data
  ▪ Initialize storage early in the app lifecycle
  ▪ Provide immediate access to stored information
  Example code, initializing SharedPreferences before we start all the coding

  final prefs = await SharedPreferences.getInstance();
  // then we work with 'prefs'

CRUD Operations
  ▪ A set a functions to manage data dedicated to
    ▪ Create
    ▪ Read
    ▪ Update
    ▪ Delete

    Code example

    // Saving data (create)
    prefs.setInt('counter',10);

    // Retrieving data (read)
    int counter = prefs.getInt('counter') ?? 0;

    // Deleting data (delete)
    prefs.remove('counter');

Serialization and Deserialization
  ▪ Ensure proper data storage and retrieval
  ▪ Utilize json format for encoding and decoding
  ▪ Apply this approach with LocalStorage or files
  ▪ Implement seamless seialization and deserialization of data

  Example code for serialization/deserialization
  import 'dart:convert';
  Map userMap = jsonDecode(jsonString);
  var user = User.fromJson(userMap);

Integrating with state management 
  ▪ Incorprate Flutter's state management solutions
    ▪ Provider, Riverpod, Bloc, etc
  ▪ Enhance interaction with local storage
  ▪ Create a reactive architecture
  ▪ Ensure immediate reflection of data changes

  Example code using UserProvider package

  class UserProvider with ChangeNotifier{
    User _user;

    User get user => _user;

    void loadUser(){
      String userJson = storage.getItem('user');
      _user = User.fromJson(jsonDecode(userJson));
      notifyListeners();
    }
  }

Best practices for using local storage
  ▪ Always encrypt sensitive data
  ▪ Ensure data remains protected
  ▪ Safeguard against unauthorized access
    ▪ classic mistake is when people use plain text and dont
      encrypt
  ▪ Efficiency
    ▪ Only store necessary data
    ▪ Minimize read/write cycles
    ▪ Optimize data storage
    ▪ Enhance app performance
    ▪ Improve overall user experience
    ▪ Address devices with limited storage capacity
  ▪ Consistency
    ▪ Maintain a consisten schema for stored data
    ▪ Handle migrations properly
    ▪ Allow for smooth updates
    ▪ Ensure accurate interpretation
    ▪ Facilitate seamless interaction with stored
      data
    
Recap
  ▪ Asses the importance of local storage
  ▪ Use initialization code
  ▪ Implement CRUD operations
  ▪ Perform serialization and deserialization
  ▪ Integrate state management solutions
  ▪ Apply best practices for local storage



*/
