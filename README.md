# SCountLabel

<p align="center">
    <a href="http://swift.org">
        <img src="https://img.shields.io/badge/Swift-3.0-brightgreen.svg" alt="Language" />
    </a>
    <a href="https://raw.githubusercontent.com/shial4/SCountLabel/master/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License" />
    </a>
    <a href="https://cocoapods.org/pods/SCountLabel">
        <img src="https://img.shields.io/cocoapods/v/SCountLabel.svg" alt="CocoaPods" />
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat" alt="Carthage" />
    </a>
</p>

SCountLabel is an easy to use Swift extension counter for UILabel. There is no need to use custom class for your labels. :)
## 💊 Usage
You can count integer or floatingpoints values
```swift
UILabel().count(to: "11")
```
![int](https://github.com/shial4/SCountLabel/blob/master/Media/int.gif "int")

```swift
UILabel().count(to: "11.0")
```
![float](https://github.com/shial4/SCountLabel/blob/master/Media/float.gif "float")

You can have multiple variaitons including few counting numbers in same string.
```swift
UILabel().count(to: "11 and second number in same string -22.0")
```
The values can be negative or positive. Typed as `2.0` or `.2` what ever you like!
More over you can pass your own time interval between value changes in your string
```swift
UILabel().count(from: "down 11.0 up 7", to: "down 5.0 up 11", interval: 0.2)
```
For those who likes to play with strings format. Is it as well awaiable to modife for each number format passing it in array.
Remember the format array have to be the sime element count as the shortest strings `from` or `to` number count. And the format need to be specify for float values which means `"%f"`, ex:`"%.2f"` or `"%0.2f %%"` or any custom format you wont to add. 
```swift
UILabel().count(from: "down 11.0 up 7", to: "down 5.0 up 11", format: ["%0.2f", "%0.0f"])
```
![custom](https://github.com/shial4/SCountLabel/blob/master/Media/custom.gif "custom")

Full example:
```swift
UILabel().count(from: "down 11.0 up 7", to: "down 5.0 up 11", interval: 0.2, format: ["%0.2f", "%0.0f"])
```

## 🔧 Installation

**CocoaPods:**

Add the line `pod "SCountLabel"` to your `Podfile`

**Carthage:**

Add the line `github "shial4/SCountLabel"` to your `Cartfile`

**Manual:**

Clone the repo and drag the file `SCountLabel.swift` into your Xcode project.

**Swift Package Manager:**

Add the line `.Package(url: "https://github.com/shial4/SCountLabel.git", majorVersion: 0, minor: 1)` to your `Package.swift`

## ⭐ Contributing

Be welcome to contribute to this project! :)

## ❓ Questions

Just create an issue on GitHub.

## 📝 License

This project was released under the [MIT](LICENSE) license.
