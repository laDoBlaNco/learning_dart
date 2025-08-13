/* Module 4: Using Plugins in Flutter

Introduction: Flutter's Plugin System
  • simplifies application development process
  • Offers pre-built solutions for native features
  • Allows integration of functionalities
  • Accelerates feature implementation across different
    devices

Overview of plugins in Flutter
  • Features
    • Provide access to device and platform-specific functionalities
    • Bridge the Flutter code and the underlying platform code
    • Allow use of native features
    • Avoid the need to write platform-specific code

Benefits of plugins
  • Benefits of plugins
    • Simplified development
      • Allow reusing code for standard functionalities
    • Cross-platform integration
      • Offer consistent API across both iOS and Android
    • Community support
      • Are community-driven, well-tested, and maintained.

Communonly used plugins
  • http
    • For making HTTP requests
  • shared_preferences
    • For storing simple data persistently
  • firebase_core
    • To integrate Firebase backend into my app
  • sqlite
    • For using SQLitein my app
  • google_maps_flutter
    • To integrate Google Maps

How to use plugins in Flutter
  • Step 1: Finding plugins
    • Locate Flutter plugins in pub.dev, the official
      Dart package repo
    • Search for plugins by keywords or categories
  • Step 2: Adding plugins to my project
    • Add a suitable plugin to my pubspec.yaml file
      Example
      dependencies:
        flutter:
          sdk: flutter
        url_launcher: ^6.0.3
      • after which run 'flutter pub get' or 'dart pub get' to install
  • Step 3: Importing the plugin
    • Import the plugin into your dart code
      Example
      import 'package:url_launcher/url_launcher.dart';
  • Step 4: Using the imported plugin
    •  For exaample with url_launcher plugin to launch a URL
      1. Create a function
        void _launchURL() async {
          const url = 'https://flutter.dev';
          if(await canLaunch(url)){
            await launch(url);
          }else{
            throw 'Could not launch $url';
          }
        }
      2. Call the function with a button press or any other manner determined
        ElevatedButton(
          onPressed: _launchURL,
          child: Text('Open Flutter Website'),
        );

Creating my on Plugins when I can't find what I need:
  • Step 1: Create a new plug-in using the Flutter CLI
    syntax: flutter create --template=plugin my_plugin
  • Step 2: Write platform-specific code by navigating to
    iOS and Android folders in the my_plugin directory
  • Step 3: Implement platform channels to communicate
    between Dart and native code
  • Step 4: After testing, publish my plugin to pub.dev

Managing plugin compatibility
• Managing version constraints
  • Ensure compatiblity with my Flutter and Dart versions
  • Specify version constraints in the pubspect.yaml file
  • Example: 
    dependencies:
      url_launcher: '>=6.0.0 <7.0.0
• Resolving dependency conflicts
  • Dependency resolver finds a compatible version automatically
  • Resolve conflicts manually by specifying exact versions
• Testing on multiple platforms
  • Test the application on iOS and Android devices or
    emulators
  • Ensure proper working order of the application/plugin

Troubleshooting:
  • Plugin Not found
    • Ensure adding the plugin correctly in pubspec
    • Run Flutter/Dart pub get
  • Version Conflicts
    • Update all dependencies
    • Consult plugin documentation for compatiblilty guidelines
  • Platform-specific Issues
    • Test the application on both platforms
    • Refer to plugin documentation for any platform-specific
      setup

Best pratices for using Flutter plugins
  • Keep dependencies updated
  • Review the plugin documentation
  • Test application thoroughly

Recap:
  • Plugins provide access to device and platform-specific
    functionalities
  • They help in simplified development, cross-platform
    integration, and community support
  • The steps to use plugins in Flutter include:
    • Finding the plugins in pub.deb
    • Adding suitable plugins to my project
    • Importing the plugin into my Dart code
  • To manage plugin compatibility, consider:
    • Managing version constraints
    • Resolving dependency conflicts
    • Testing on multiple platforms
  • Troubleshoot common plugin issues by adopting some best
    practices:
    • Keeping dependencies updated
    • Reading documentation
    • Thorough testing
*/
