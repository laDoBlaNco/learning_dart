/* Module 4: Introduction to Native Mobile Features

The need for native features:
  • Flutter excels  at create appealing user interfaces
  • But there will be a need to interact with the OS
    • Device Hardware
    • APIs
  • This is where integration of native code comes in

Naive mobile features
  • Provide functionalities from the OS such as:
    • Camera
    • GPS
    • File systems
    • Sensors
  • Supported by Android and iOS platforms to use
    • Hardware
    • Software
  • Dependent on native capabilities sometimes in Flutter such as:
    • Device camera or
    • Notifications
  • Native features can enhance app performance and/or provided a 
    seamless user experience

Comman use cases for native features
  • Device hardware
    • Camera
      • capture images and videos
      • use some of the cameras features
    • GPS
      • obtain device location
      • track user movement
    • Bluetooth
      • to connect to other devices
      • transfer data
  • Platform-specific APIs
    • Share functionality
      • sharing content through native sharing options
    • In-app purchases
      • platform-specific stores
    • Push notifications
      •  using platform-specific services
    • Biometric authentications
      • fingerprint
      • facial recognition

Plugins for native mobile features
  • Plugins: Enhance functionality and user experience
  • Camera: Capture photos, videos, barcodes, and QR
    codes
  • Location: Determine location and nearby services
    such as a weather app
  • Sensor: Access the accelerometer and gyroscope
    for fitness apps, such as step counters
  • Push notifications: Sent real-time messages, such
    as breaking news

Adding plugins for native features
  • Provide access to the device
  • Using Camera, GPS, and/or sensors
  • First add plugin to pubspec.yaml
    dependencies:
      flutter:
        sdk: flutter
        camera: ^0.10.0+1
  • Then run 'flutter pub get'  

Request necessary camera permissions
  • Request permission to access the camera
  • Request in BOTH Android and iOS
  • In Android, for example, open the file:
    android/app/src/main/AndroidManifest.xml
  • Then add the camera permission code:
    <uses-permission android:name= "android.permission.CAMERA"/>

  • Sample code for adding camera to the application:
    import 'package:flutter/material.dart';
    import 'package:camera/camera.dart';

    void main() async{
      WidgetsFlutterBinding.ensureInitialized();
      final cameras await availableCameras();
      final firstCamera = cameras.first;
    
      runApp(MyApp(camera: firstCamera)); 
      // then add first camera to the app
    }

Camera Preview plugin:
  • Next lines of code tell the app to display what the cameras sees 
    to the deviices screen

    @override
    Widget build (BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Camera Example')),
          body: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return CameraPreview(_controller);
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      );
    }

    Example native code for floating action button:
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.camera_alt),
      onPressed: () async {
        try{
          await _intializeControllerFuture;
          final image = await _controller.takePicture();
          // do something with the captured image
        } catch(e) {
          print(e);
        }
      },
    ),


Recap:
  • Native mobile features are functionalities provided by a device's
    operating system
  • Flutter apps use plugins to access device cameras, GPS, and
    bluetooth
  • Native mobile plugins include using platform-specific APIs
  • Adding a plugin for native features include installing the plugin,
    requesting permission, intializing the controller, allowing the
    live feed, and capturing the picture

*/
