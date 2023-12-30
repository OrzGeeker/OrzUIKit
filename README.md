# OrzUIKit

UI组件库

## 使用方式

### CocoaPods

```ruby

source 'https://github.com/OrzGeeker/Specs.git'

pod 'OrzUIKit'

```

### Swift Package Manager

```swift

.package(url: "https://github.com/OrzGeeker/OrzUIKit.git", from: "0.0.1")

```

## UIColor

组件通过 Swift 脚本 scripts/auto_generate.swift 从 Assets/Assets.xcassets 获取全部颜色集，自动生成配色方案接口文件 **UIColor+AutoGen.swift** 暴露给外部 `Swift`/`Objective-C` 组件调用

由于 Assets.xcassets 中的颜色集可以直接支持设置各种模式下对应的色值，所以 **天然支持暗黑模式**

### Objective-C 使用方式

```objc
@import OrzUIKit;

view.backgroundColor = UIColor.test4;

```

### Swift 使用方式

```swift
import OrzUIKit

view.backgroundColor = .test2

```

## UIImage

组件通过 Swift 脚本 scripts/auto_generate.swift 从 Assets/Assets.xcassets 获取全部颜色集，自动生成配色方案接口文件 **UIImage+AutoGen.swift** 暴露给外部 `Swift`/`Objective-C` 组件调用

由于 Assets.xcassets 中的图片集可以直接支持设置各种模式下对应的图片，所以 **天然支持暗黑模式**

### Objective-C 使用方式

```objc
@import OrzUIKit;

self.imageView.image = UIImage.test1;

```

### Swift 使用方式

```swift
import OrzUIKit

self.imageView.image = .test1

```

## UIFont

## UIView
