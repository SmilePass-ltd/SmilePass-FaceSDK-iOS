# SmilePass FaceSDK iOS

### Introduction

SmilePass is a face detection and autoselfie SDK for Android. This repo is the sample which demonstrate how to use SmilePass Face SDK in your app.

**SmilePass Face SDK can be used:**

* To detect whether a person is real or it's a still image or video which is called liveness detection.
* To detect face of a person.
* To capture a person's image automatically.
* To detect different gestures of a person i.e. smile, blink, wink.
* The minimum iOS version required to use this SDK is iOS 10.0

# Get Started
This guide is a quick start to add SmilePass Face SDK to an iOS app.

## Prerequisites
### SmilePass API key
Your application needs an API key to access the features of SmilePass Face SDK. You can use it with any of your applications that use SmilePass Mobile SDKs and External APIs. It supports an unlimited number of users. To get API KEY, [Contact SmilePass](https://smile-pass.com/contact).

## Add Face SDK to your app
### Step 1. Add SmilePass dependency
Add the following to your Podfile (inside the target section):

`pod 'SmilePassFaceDetector'`

then run

`pod install`

### Step 2. Instantiate SmilePassFaceDetector object

You can create an object of `SmilePassFaceDetector` like this :

    let faceDetector = SmilePassFaceDetector(accessKey: "API_KEY", withCameraDelegate: self)

here the initializers method will take `accessKey` as parameter to validate API key. You also need to confirm `SmilePassFaceDetectorDelegate`

After creating the object of `SmilePassFaceDetector` you need to present the Camera to automatically capture selfie like this 

    faceDetector.presentViewController(onViewController: self, smilePassFaceDetectorConfig: faceDetectorConfig, completion: { (error) in
            if error != nil {
               print(error)
            }
    })

the above method will take 2 parameters. One is the object of `UIViewController` on which you need to present the camera and another one is the object of `SmilePassFaceDetectorConfig`

For more details about `SmilePassFaceDetectorConfig`, please visit our wiki page for tutorials

### Step 3. Handle Delegate method 

There are 2 delegate methods defined in `SmilePassFaceDetectorDelegate`:

    public func didTakeImage(image: UIImage)

    public func didPressBack()

### Documents

For the detailed information on how to configure different options in SmilePass Face SDK, read our detailed documents-

[SDK Setup](https://github.com/SmilePass-ltd/SmilePass-FaceSDK-iOS/wiki/Face-SDK-Setup)

[Tutorials](https://github.com/SmilePass-ltd/SmilePass-FaceSDK-iOS/wiki/Face-SDK-Tutorials)

[Troubleshooting](https://github.com/SmilePass-ltd/SmilePass-FaceSDK-iOS/wiki/Troubleshooting)

### Libraries Used

The core of this library is developed using [Google Vision](https://github.com/googlesamples/ios-vision).

### License
SmilePass Face SDK sample application is licensed with the SmilePass License. For more details, see LICENSE.
