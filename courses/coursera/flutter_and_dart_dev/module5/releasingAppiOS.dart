/*Module 5 - Releasing an App on iOS

Releasing my app
  ▪ Build and publish my Flutter app
  ▪ Set up certificates and provisioning profiles in Xcode
  ▪ Authenticates identity and ensures apps are signed

Certificates
  ▪ Development an distribution
  ▪ Create a certificate signing request (CSR)
    ▪ Open Keychain Access on device
    ▪ Go to Certificate Assistant
    ▪ Select "Request a certificate from a Certificate Authority"
    ▪ Follw the prompts to generate my CSR file (use this file to generate certs)
  ▪ Generate Certificates
    ▪ Log in to my Apple Developer Account
    ▪ Navigate to "Certificates, Identifiers, and Profiles"
    ▪ User my CSR file to create development and distribution certificates
  ▪ Add certificates to my keychain

Provisioning Profiles
  ▪ Link to my Apple Developer account
  ▪ Define the devices and features my app can use
  ▪ Create an App ID that matches the bundle identifier
  ▪ Generate a provisioning profile
    ▪ Select the App ID
    ▪ Choose my certificate
    ▪ Install the profile by moving into Xcode

My certiicates and provisioning profiles
  ▪ Keep them current
  ▪ Avoid misconfigurations
  ▪ Link correct bundle identifiers
  ▪ Include necessary entitlements

Using App Store Connect
  ▪ Manage my app's presence on the App Store
  ▪ Create an App Record to define my app's identity
  ▪ Archive my app in Xcode and upload it to App Store Connect
  ▪ Note: Xcode checks for issues and necessary entitlements

Using TestFlight
  ▪ Test before my app goes live
  ▪ Use TestFlight to gather input from testers
  ▪ Set up testing 
    ▪ Add a new build in TestFlight
    ▪ Invite users through email
    ▪ Manage internal and external testing
  ▪ Gather feedback
    ▪ View feedback, bug reports, and suggest improvements
    ▪ Identify issues before release

Streamline my development process
  ▪ Integrate continuous integration and continuous deployment (CI/CD) pipelines
  ▪ Automate building, testing, and deploying tasks
  ▪ Set up CI/CD for iOS
    ▪ Choose a tool like Bitrise, CircleCl, or GitHub Actions
    ▪ Use workflows for code linting, testing, building, and deploying

Post-release management
  ▪ Monitor performance and manage updates
  ▪ Use App Store Connect's analytics tools
  ▪ Monitor download numbers, user engagement, and crash reports
  ▪ Update my app regularly and consistently

Recap:
  ▪ To publish my Flutter app, set up certificates and provisioning profiles in 
    Xcode to authenticate and sign my app
  ▪ Generate development and distribution certificates and link provisioning profiles
    to my app's bundle identifier
  ▪ Prepare my app for submission using App Store Connect to create a record
  ▪ Test my app through TestFlight to gather user feedback
  ▪ Integrate continuous integration and continuous deployment (CI/CD) pipelines
    to automate building, testing, and deploying my app
  ▪ After release, monitor my app's performance and manage updates using App Store
    Connect


*/