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

### Utilities

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
let currentVersion: String = currentApplicationVersion()
let needUpdate: Bool = isUpdateAvailable()
```

#### Validataion

```swift
let isEmail = "nobody@email.com".isValid(withType: .email)
let isEmail2 = "nobody@email.com".isValid(withRegEx: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}")
```

### UI

#### subview

```swift
//view with tag
view.label(100)?.text = "Hello World"
//image with tag
view.imageView(100)?image = nil
```

#### popup

```swift
if needUpdate {
    popupOkCancel(on: self, title: "업데이트", message: "업데이트가 필요합니다.", onOk: {
        let urlString = "itms-apps://itunes.apple.com/app/id0000000000"
        UIApplication.shared.openURL(URL(string: urlString)!)
    })
} else {
    popupOK(on: self, title: "업데이트", message: "최신버전입니다.")
}
```

#### Image Resize

```swift
let original = UIImage(named: "big_image")
let resized = original?.resized(maxSize: CGSize(width: 100, height: 100))
let resizedForScreen = original?.resizedToScreen()
```

### RxSwift

### GestureRecognizer

```swift
view.addTapGestureRecognizer()
    .subscribe(onNext: { (tapGusture : UITapGestureRecognizer) in
    })

view.addSwipeGestureRecognizer()
    .subscribe(onNext: { (tapGusture : UISwipeGestureRecognizer) in
    })
```

### Button

```swift
//dictinct double touched
view.button(100)?..whenTouchUpInside(thro)
    .subscribe(onNext: { button in
    })
```

### Keyboard Notification

```swift
whenKeyboardShowNotification()
    .subscribe(onNext: { (keyboardHeight: CGFloat, duration: TimeInterval) in
    })
    .disposed(by: disposeBag)

whenKeyboardHideNotification()
    .subscribe(onNext: { (duration: TimeInterval) in
    })
    .disposed(by: disposeBag)
```

#### Image Picker
```swift
pickImageFromAlbum(on: self, withEdit: true)
    .subscribe(onNext: {  self.imageView.image = $0 })
```


## Author

iamchiwon, iamchiwon@gmail.com

## License

CWUtils is available under the MIT license. See the LICENSE file for more info.
