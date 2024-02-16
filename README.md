# locateme

A new Flutter project.

# What is Flutter?
Flutter has three core capabilities.

Fast to develop: Build your Android and iOS applications in milliseconds with Stateful Hot Reload.
Expressive and flexible: Quickly ship features with a focus on native end-user experiences.
Native performance on both iOS and Android: Flutter's widgets incorporate all critical platform differences — such as scrolling, navigation, icons, and fonts — to provide full native performance.

# Google Maps has:

99% coverage of the world: Build with reliable, comprehensive data for over 200 countries and territories.
25 million updates daily: Count on accurate, real-time location information.
1 billion monthly active users: Scale confidently, backed by Google Maps' infrastructure.

# Setup your flutter enviroment 
You need two pieces of software to complete this lab: the Flutter SDK, and an editor. This codelab assumes Android Studio, but you can use your preferred editor.

  # You can run this codelab using any of the following devices:

    A physical device (Android or iOS) connected to your computer and set to developer mode.
    The iOS simulator. (Requires installing Xcode tools.)
    The Android emulator. (Requires setup in Android Studio.)

# Adding Google Maps Flutter plugin as a dependency
    google_maps_flutter: ^2.0.6
    google_maps_flutter_platform_interface: ^2.2.0

# Adding Google Maps to the app
  # It's all about the API keys
  To use Google Maps in your Flutter app, you need to configure an API project with the [Google Maps Platform](https://mapsplatform.google.com/), following the [Maps SDK for Android's Using API key](https://developers.google.com/maps/documentation/android-sdk/get-api-key), [Maps SDK for iOS' Using API key](https://developers.google.com/maps/documentation/ios-sdk/get-api-key), and [Maps JavaScript API's Using API key](https://developers.google.com/maps/documentation/javascript/get-api-key). With API keys in hand, carry out the following steps to configure both Android and iOS applications.

  # Adding an API key for an Android app
  To add an API key to the Android app, edit the AndroidManifest.xml file in android/app/src/main. Add a single meta-data entry containing the API key created in the previous step inside the       application node.

    <manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.google_maps_in_flutter">
    <application
        android:label="google_maps_in_flutter"
        android:icon="@mipmap/ic_launcher">

        <!-- TODO: Add your Google Maps API key here -->
        <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR-KEY-HERE"/>

        <activity
            android:name=".MainActivity"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>

# Adding an API key for an iOS app
To add an API key to the iOS app, edit the **AppDelegate.swift** file in **ios/Runner**. Unlike Android, adding an API key on iOS requires changes to the source code of the Runner app. The AppDelegate is the core singleton that is part of the app initialization process.

Make two changes to this file. First, add an **#import** statement to pull in the Google Maps headers, and then call the **provideAPIKey()** method of the **GMSServices** singleton. This API key enables Google Maps to correctly serve map tiles.

    import UIKit
    import Flutter
    import GoogleMaps  // Add this import
  
    @UIApplicationMain
    @objc class AppDelegate: FlutterAppDelegate {
      override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
    
        // TODO: Add your Google Maps API key
        GMSServices.provideAPIKey("YOUR-API-KEY")
    
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    }



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
