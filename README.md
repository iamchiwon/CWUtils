# CWUtils

[![Version](https://img.shields.io/cocoapods/v/CWUtils.svg?style=flat)](http://cocoapods.org/pods/CWUtils)
[![License](https://img.shields.io/cocoapods/l/CWUtils.svg?style=flat)](http://cocoapods.org/pods/CWUtils)
[![Platform](https://img.shields.io/cocoapods/p/CWUtils.svg?style=flat)](http://cocoapods.org/pods/CWUtils)

## Installation

CWUtils is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CWUtils'
```

## Dependancies

 - RxSwift

## Sample Code

#### Logs

```swift
DLog("log for debug build only")
ELog("error log for all build")
```

#### Device

```swift
runOnSimulatorOnly {
    print("running on simulator")
}
runOnDeviceOnly {
    print("running on device")
}
```

#### Version Check

```swift
let needUpdate: Bool = isUpdateAvailable()
```

### RxSwift Used

#### Image Picker
```swift
pickImageFromAlbum(on: self, withEdit: true)
    .subscribe(onNext: {  self.imageView.image = $0 })
```


## Author

iamchiwon, iamchiwon@gmail.com

## License

CWUtils is available under the MIT license. See the LICENSE file for more info.
