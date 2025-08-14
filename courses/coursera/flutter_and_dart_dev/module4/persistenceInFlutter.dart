/* Module 4: Persistence in Flutter

What is data persistence?
  • Data outlasts the process that created it
  • Data remains accessible

Choosing a data persistence solution: (depends on your needs)
  • Evaluate the complexity of the data
  • Identify the targeted platforms
  • Determine the need for:
    • offline accessibility
    • cross-platform synchronization
  • ensures optimal performance
  • enhances user experience
  • contributes to cross-platform compatibility

Introduction to local storage options
  • Crucial for effective data management
    • Consider the data size
    • Evaluate the complexity of data structures
    • Assess the ability to read and write files
    • Choose for client-side operations
    • Offline data access

SharedPreferences/NSUserDefaults
  • SharedPreferences for Android
  • NSUserDefaults for iOS
  • Ideal for storing simple data in key-value pairs
    • reminds of of localStorage in web deb
  • Serves as browser-based local storage for:
    • User settings
    • App configurations

SQLite
  • Powerful database solution
  • Manager of complex data structures
  • Go-to database for Flutter
  • Compatibility with Android and iOS devices
  • Provider of a robust framework
  
Hive
  • Lightweight, NoSQL database
  • Dart-based implementation
  • No platform-specific library requirements
  • Fast read and write operation support
  • Compatibility with mobile and desktop apps

Files
  • Allows me to read and write to files
  • Is ideal for downloading, saving, and retrieving media
  • Offers maximum control over file handling
  • Demands careful attention to the management of:
    • File paths
    • Storage permissions

Production-grade storage options for those robust solutions like
advanced cloud-based databases
  • Cloud Firestore
    • Versatile and scalable solution
    • Seamless mobile, web, and server development
    • Real-time data synchronization
  • Postgres 
    • Is ideal for sophisticated applications
    • Offers strong transactional support
    • Is implemented using server-side or cloud-based
      solutions
    • Provides advanced relational database capabilities
  • Realm
    • Strong real-time capabilities
    • Offline-first architecture
    • Smooth synchronization with its cloud service
    • Robust support for handling complex data models

Platform-specific considerations and options
  • iOS
    • Consider Apple's specific guidlines
    • Use UserDefaults to handle simple data
    • Use CoreData to handle complex data
  • Android
    • Use SharedPreferences for lighweight storage
    • Use SQLite for managing more substantial data sets
    • Use Room for additional funtionality - an abstraction
      layer on top of sqlite  
  • Web
    • IndexedDB:
      • an Ideal solution for client-side storage
      • Greater flexibility than Local and Session Storage
      • May have inconsistent suport across browsers
  • Desktop
    • Use SQLite and direct file storage
    • Work similarly to mobile platforms for managing
      local data


Recap:
  • Analyze data persistence
  • Evaluate my app's specific needs
  • Evaluate factors for choosing local storage
    • Data size
    • Ability to read and write files
  • Evaluate different types of local storage
    • SharedPreferences for android / NSUserDefaults for iOS
    • SQlite
    • Hive
    • Files
  • Evaluate the different types of advance storage solutions
    • Cloud Firestore 
    • PostgreSQL
    • Realm
  • Assess platform-specific considerations to optimize storage and performance

*/
