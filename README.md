# UIPOSTView

[![Swift 5](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org/)
[![Core Version](https://img.shields.io/badge/pod-1.8.4-blue.svg)](https://cocoapods.org/)
![Platform](https://img.shields.io/badge/platform-iOS-007CBD)

#### Index
* [安裝](#installation)
* [範例](#example)
* [調整樣式參數](#style-config-parameter)
* [代理方法](#delegate-method)
* [安裝](#installation)
* [需求](#requirements)

## Preview
<img src="https://i.imgur.com/LzKtwn9.png" alt="drawing" width="375" height="812"/>
## Example
#### 導入頭文件
```swift
import UIPOSTView
```
#### 初始化
```swift
//init
let postViewController = UIPOSTViewController()
postViewController.delegate = self

//config
let style = UIPOSTStyle()
style.maxInputCount = 100
postViewController.postViewStyle = style
```
## Style Config Parameter
```swift
/// 背景顏色
public var backgroundColor: UIColor

/// 標題顏色
public var titleLabelColor: UIColor

/// 內容文字顏色
public var contentTextColor: UIColor

/// 上方Bar顏色
public var topBarColor: UIColor

/// 取消按鈕圖片
public var cancelImage: UIImage

/// 送出按鈕圖片
public var sendImage: UIImage

/// 限制文字顏色
public var limitLabelColor: UIColor

/// 最大限制文字數量
public var maxInputCount: Int

/// 標題文字
public var titleText: String
```
## Delegate Method
```swift
extension ViewController: UIPOSTViewControllerDelegate {
    func onCanceled() {
        NSLog("已經取消")
    }
    func onSended(string: String) {
        NSLog("已經傳送")
    }
}
```
## Installation
```ruby
pod 'UIPOSTView'
```
## Requirements
- iOS 10以上

## Author

League2EB, League2EB@League2EB.com

## License

UIPOSTView is available under the MIT license. See the LICENSE file for more info.![]()
