/*Module 5 - Preparing a Flutter App for Publishing

Introduction - Preparing a Flutter app for release is as crucial
as setting up a new store. 
  ▪ proper labeling 
  ▪ packaging
  ▪ security checks
  ▪ updating versi ons
  ▪ configuring permissions
  ▪ thorough testing, etc  

Versioning
  ▪ Versioning is essential for updating and managing app versions
    Version number: pubspec.yaml file
    Vesion format: major.minor.patch+build
  ▪ Example:
    Current version: 1.0.0+1
    Next release: 1.0.1+2
    Update: 1.1.0+2

Updating App icons and splash screens
  ▪ Packages help customize app icons and splash screens
    custom app icons: flutter_launcher_icons
    Splash screens :
      Flutter_native_splash
  ▪ Visuals help in branding and user experience
  ▪ To set up my app icon, add the following to my pubspec.yaml file:
    dev_dependencies:
      flutter_launcher_icons: ^0.9.2
    flutter_icons:
      android: true
      ios: true
      image_path: "assets/icon/icon.png"
  ▪ Then run the command:
    flutter pub run flutter_launcher_icons:main

    For splash screens, use the flutter_native_splash package:
    dev_dependencies:
      flutter_native_splash: ^2.0.0

    flutter_native_splash:
      color: "#42a5f5"
      image: assets/splash.png
    Run:
    flutter pub run flutter_native_splash:create

Configuring permissions
  ▪ App permissions help in:
    ▪ Transparency
    ▪ User security
  ▪ For Android: AndroidManifest.xml file
    ▪ Example: <uses-permission android:name="android.permission.INTERNET"/>
  ▪ For iOS: Info.plist file
    ▪ Example: 
      <key>NSCameraUsageDescription</key>
      <string>We need access to your camera to take photos.</string>
  ▪ Suggested to only use necessary permissions to avoid user distrust or app rejection

Signing App
  ▪ Publishing apps on Google Play Store and Apple App Store needs app signatures
  ▪ App signatures authenticate the app, ensuring a reliable source
  ▪ For Android:
    Generate Keystore file
    Configure in build.gradle file
  ▪ For iOS:
    Manage through Xcode

Obfuscation
  ▪ Obfuscation helps in making code harderr to read and reverse-engineer
  ▪ It helps to:
    ▪ Publish apps with layer of protection
    ▪ Deny unauthorized use or copying of code
  ▪ Flutter provides built-in support during the build process
    ▪ Android
      Use command: flutter build apk --release --obfuscate --split-debug-info=/<directory>
    ▪ iOS
      Set up flags in Xcode
  
Testing and debugging
  ▪ Helps to run the app smoothly and without crashes to avoid bad reviews and UX
  ▪ Commands used:
    ▪ Flutter test: runs unit tests
    ▪ Firebase test lab: Integration testing
    ▪ CI/CD pipeline: incorporate testing

Building the release version
  ▪ Release build helps meet the performance and standards of targeted platforms
  ▪ Build for Android (AAB is the standard)
    ▪ apk = Android Package kit / aab = Android App Bundle
    flutter build apk -release 
  ▪ Build for iOS (IPA)
    ▪ ipa = iOS App Store Package
    flutter build appbundle -release

Submitting to App stores
  ▪ Continuous Deployment (CD)
    ▪ Automates deployment
    ▪ Ensures consistent release of updates
    ▪ Integrated CI/CD tools used to ensure consistent updates
    ▪ Saves time
    ▪ Reduces errors
  ▪ Use Google Play console 
    ▪ Upload build (apk or aab)
    ▪ Provide metadata configurations
    ▪ Submit for review
  ▪ Use Apple App Store connect
    ▪ Upload build (ipa)
    ▪ Complete teh required information
    ▪ Submit for review

  Recap:
    ▪ Preparing a Flutter app for release is like setting up a new store, requiring
      detailed attention
    ▪ Set and update the app version in pubspec.yaml to manage updates
    ▪ Use Flutter packages for app icons and splash screens and declare necessary
      permissions jin platform-specific files for security and transparency
    ▪ Sign my app for authenticity, obfuscate code to prevent reverse engineering, 
      and test thoroughly across devices for smooth performance
    ▪ Build the release version, set up continuous deployment, and submit to app 
      stores
 */
