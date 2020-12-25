<p align="center">
 <img width=300px  src="src/Logo.gif" alt="Project logo"></a>
</p>

<h3 align="center">🌬CMFloatingTextField🌬</h3>

<div align="center">

![License](https://img.shields.io/github/license/CM-Material/CMLoadingButton?style=for-the-badge)
![Release](https://img.shields.io/github/v/release/CM-Material/CMLoadingButton?style=for-the-badge)


</div>

---

<p align="center"> 
    Pure SwiftUI Simple Loading Animation Button
    <br> 
</p>

## 📹 Preview

<p align="center">
    <img src="src/Preview-zoom.gif" width="40%" />
</p>

## 🏁 Getting Started

### Requirements
* Xcode 11+
* SwiftUI
* iOS 14+
* macOS 10.15+

### Installaion
#### Swift Package Manager(SPM)
    File ➜ Swift Packages ➜ Add Package Dependancy..

```Swift
.package(url: "https://github.com/CM-Material/CMLoadingButton", from: "1.0.1")
```

## 🎈Usage
```Swift
CMLoadingButton(action: { }, isLoading: <Binding>Bool, style: CMButtonStyle) {
    // View on the button
    // style is optional parameter
```
* `action` : Actions to do when button clicked
* `isLoading` : `<Binding>Bool` type. you can control loading status with this.
* `style`(Optional) : Custom style with `CMButtonStyle`

#### 🛠Custom Modifiers
```Swift
CMButtonStyle(width: CGFloat, 
              height: CGFloat,
              cornerRadius: CGFloat,
              backgroundColor: Color,
              loadingColor: Color,
              strokeWidth: CGFloat,
              strokeColor: Color)

// All of the parameter is optional
```
* `width`(Optional) : Width of button
* `height`(Optional) : Height of button
* `cornerRadius`(Optional) : Corner radius of button
* `backgroundColor`(Optional) : Background color of button
* `loadingColor`(Optional) : Background color of button when `Loading`, default is 50% opacity of `backgroundColor`
* `strokeWidth`(Optional) : Circle loading indicator stroke width
* `strokeColor`(Optional) : Circle loading indicator stroke Color(default: gray)

## Example
#### 👶 Simple
```Swift
import SwiftUI
import CMLoadingButton

struct ContentView: View {
    @State var isLoading: Bool = false
    
    var body: some View {
        CMLoadingButton(action: {
            // Your Action here
        }, isLoading: $isLoading) {
            Text("CMLoadingButton").foregroundColor(Color.white)
        }
    }
}
```
### Result
<img src="src/Example-1.png" height="100">
<img src="src/Example-1-1.png" height="100">

### 💅🏻 Applying Fully Custom Style
```Swift
import SwiftUI
import CMLoadingButton

struct ContentView: View {
    @State var isLoading: Bool = false
    var style = CMButtonStyle(width: 312,
                              height: 54,
                              cornerRadius: 27,
                              backgroundColor: .orange,
                              loadingColor: Color.orange.opacity(0.5),
                              strokeWidth: 5,
                              strokeColor: .gray)
    
    var body: some View {
        CMLoadingButton(action: {
            // Your Action here
        }, isLoading: $isLoading, style: style) {
            Text("Styled CMLoadingButton").foregroundColor(Color.white)
        }
    }
}
```
### Result
<img src="src/Example-2.png" height="100">
<img src="src/Example-2-1.png" height="100">

### 💅🏻 Appling Style Only Needs
```Swift
import SwiftUI
import CMLoadingButton

struct ContentView: View {
    @State var isLoading: Bool = false
    
    var body: some View {
        CMLoadingButton(action: {
            // Your Action here
        }, isLoading: $isLoading, style: CMButtonStyle(cornerRadius: 27, backgroundColor: .orange)) {
            Text("Styled CMLoadingButton").foregroundColor(Color.white)
        }
    }
}
```
### Same Result
<img src="src/Example-2.png" height="100">
<img src="src/Example-2-1.png" height="100">


## ✅ TODO
- [ ] End animation(normal, shake(when fail), expand)
- [ ] Support gradient background color

## 📜 License

CMLoadingButton is available under the MIT license. See the `LICENSE` file for more info.

## ✍️ Author

- [🇰🇷@Changemin](https://github.com/kylelobo)
