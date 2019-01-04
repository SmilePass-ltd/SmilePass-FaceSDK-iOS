Pod::Spec.new do |s|
s.name              = 'SmilePassFaceDetector'
s.version           = '1.0.0'
s.summary           = 'SmilePassFaceDetector is used to detect liveness and automatically captures image from camera'
s.description       = 'SmilePass is a face verification SDK for iOS. Using SmilePass, our clients can create unique and secure biometric profiles for each of their customers as they begin their journey together. Any future transactions or events that contain risk are verified against this profile.'
s.homepage          = 'http://smile-pass.com/'

s.author            = { 'Name' => 'SmilePass' }
s.license           = 'SmilePass'

s.platform          = :ios
s.source = { :git => 'https://github.com/SmilePass-ltd/SmilePass-FaceSDK-iOS.git' }

s.ios.deployment_target = '11.0'
s.ios.vendored_frameworks = 'FaceDetectorTest/SmilePassFaceDetector.framework'


end 
