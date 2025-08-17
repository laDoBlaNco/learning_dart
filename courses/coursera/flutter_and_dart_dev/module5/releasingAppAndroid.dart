/*Module 5 - Releasing an App on Android

Introduction
  ▪ Publishing on Google Play is like opening a store on the busiest street
    in the world
    ▪ Attracts a diverse and vast global audience
    ▪ Provides opportunities for app success and growth
  ▪ Steps include:
    ▪ Publishing my app
    ▪ Setting up app signing
    ▪ Building an AAB (Android App Bundle)
    ▪ Preparing my app for submission
    ▪ Uploading my app's binary file
    
App Signing - Like getting a barcode or identifer for my app
  ▪ Verifies my app's identity
  ▪ Grants access to Google Play
  ▪ Helps the store prioritize security and user trust
  ▪ Protects users from harmful software
  ▪ Efficient key management is vital to ensure security of my app
    ▪ Play App Signing Service:
      ▪ Allows Google to manage my key
      ▪ Prevents vital loss or compromise
    ▪ Keystore file:
      ▪ Configures a keystore file in my app
      ▪ Safeguards my keystore to prevent unauthorized access
      
Generating a keystore
  keytool -genkey -v -keystore release-key.jks -keyalg RSA -keysize 2048
  -validity 10000 -alias key
  
  android {
    signingConfigs{
      release{
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile file(keystoreProperties['storeFile'])
        storePassword keystoreProperties['storePassword']
      }
    }
    buildTypes{
      release{
        signingConfig signingConfigs.release
      }
    }
  }

  flutter build appbundle --release

AABs vs APKs
  ▪ AABs
    ▪ Distributes apps in Google's preferred format
    ▪ Helps Google Play generate APKs for the device
    ▪ Improves installation times with smaller packages
    ▪ Ensures a better user experience
  ▪ APKs
    ▪ Represents the traditional app packaging format
    ▪ Remains supported but is less practical
    ▪ Results in large file sizes
    ▪ Impacts app performance

Google Play Console overview
  ▪ Helps manage my app
  ▪ Guides the app submission process
  ▪ Sets up metadata
  ▪ Configures distribution and pricing
  ▪ Offers performance tracking and testing
  ▪ Manages updates, in-app purchases, and user behavior

CI/CD Integration
  ▪ Streamline development workflow
    ▪ Automate repetitive tasks 
  ▪ CI (Continuous Integration)
    ▪ Merges updated  code into a shared repository
    ▪ Automates testing of each integration
    ▪ Runs tests and provides alerts with Jenkins or GitHub Actions
  ▪ CD (Continuous Deployment)
    ▪ Releases my app automatically to users
    ▪ Rolls out bug fixes and new features
    ▪  Deploys my app to the Google Play Store

Post-release management
  ▪ Monitor and optimize my app
  ▪ Track app issues and user feedback
  ▪ Track user behavior, downloads, and app performance
  ▪ Roll out new features and fix bugs
  ▪ Make frequent app updates

Common Resources and tools:
  ▪ Google Play Console:
    ▪ App submission
    ▪ Performance analytics
    ▪ in-app purchases
  ▪ CI/CD:
    ▪ Jenkins
    ▪ GitHubActions
    ▪ App creation, testing, and deployment

Recap:
  ▪ Publish my app through steps, including app signing and building AAB
  ▪ Differentiate between AABs and APKs
  ▪ Use Google Play Console for managing app updates
  ▪ Use CI/CD tools to automate repetitive tasks
  ▪ Perform post-release management
  ▪ Use the Google Play Console and CI/CD tools as resources for the app
  */
