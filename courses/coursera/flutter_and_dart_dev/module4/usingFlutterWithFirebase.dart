/* Module 4: Using Flutter with Firebase

If Flutter were a chef in a kitchen creating tasty dishes, Firebase
would be the well-stocked kitchen with ingredients and kitchenware.
  Dishes = Mobile Apps
  Ingredients = Services
  Kitchenware = Tools

Setting up Flutter with Firebase
  • Gives access to:
  • Back-end services
  • Data asynchronization
  • Analytics
  • Reporting
  • First create a new Firebase project
    • Go to the Firebase console
    • Click 'Add project'
    • Set up a project
    • Proceed to the project dashboard
  • Add my app to the project
    • Click the Android or iOS icon
    • Provide a package name (for Android) or bundle ID
      (for iOS)
    • Download google-services.json (for Android) or
      GoogleService-Info.plist (for iOS) and add to 
      the project
  • Configure my Flutter project
    • Add dependencies
    • Initialize Firebase in the app
    • Connect the app to the Firebase project

Using Firebasea services in my app
  • User authentication
    • Ensures secure login using email credentials
  • Cloud Firestore
    • Stores, queries, and synces app data in real-time
  • Cloud Storage
    • Stores user-generated videos and photos
  • Firebase Analytics
    • Provides useful user insights
  • Firebase Cloud Messaging (FCM)
    • Enables push notifications

Best practices: Integrating Firebase with Flutter
  • Project setup
    • use the latest compatible Firebase packages
  • Security
    • Create robust security routes to protect the data
  • Authentication
    • Use Firebase Authentication for secure sign-up
      or sign-in
  • Data management
    • use Riverpod or Provider to manage Firebase data
  • Performance optimization
    • Deploy batch writes to reduce the rate of network calls
  • Error handling
    • Use try-catch-finally blocks to manage Firebase exceptions
  • Firebase Crashlytics
    • Analyze app errors
  • Firebase Analytics
    • Track user activity to boost user experience
  • Firebase performance monitoring
    • Idntify bottlenecks in my app
  • Testing
    • Conduct unit or integration tests for Firebase functions and
      services
  • Modular code
    • Adopt a modular approach to keep code well-organized
  • Firebase cloud messaging (FCM)
    • Facilitate timely push notifications

Recap:
  • Set up Flutter with Firebase
  • Configure a Flutter project by adding dependencies
  • Use various Firebase services such as Cloud Firestore,
    Cloud Storage, Firebase Analytics, and Firebase Cloud
    Messaging (FCM)
  • Use Flutter and Firebase best practices such as Firebase
    Authentication and Firebase Crashlytics
*/