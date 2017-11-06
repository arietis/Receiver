# Kisi iOS Challenge (Swift)

This is a challenge project to assess familiarity with the iOS development environment, relevant iOS related frameworks and general coding best practices.

## How-to

In order to run the project:

1. Download or clone the repository.
1. Open the `Receiver.xcworkspace` file in Xcode.
1. Modify the bundle identifier and code signing settings in order for Xcode to automatically download required provisioning profiles.
1. Modify parameters inside `Receiver/Misc/Constants.swift` accordingly:
    - **accessURL** should point to the proper lock
    - **authToken** should be valid
    - **beaconUUID**, **beaconMajor** and **beaconMinor** should match iBeacon parameters
    - the rest of parameters is not required in order to run the demo
1. Run the application on a device. Make sure Bluetooth is turned on.

### Video

[https://youtu.be/Fta1-brRnic](https://youtu.be/Fta1-brRnic)
