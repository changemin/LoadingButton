<p align="center">
 <img width=300px  src="imgs/Logo.gif" alt="Project logo"></a>
</p>

<h3 align="center">🔄 SwiftUI LoadingButton 🔄</h3>

<div align="center">

![License](https://img.shields.io/github/license/Changemin/LoadingButton?style=for-the-badge)
![Release](https://img.shields.io/github/v/release/Changemin/LoadingButton?style=for-the-badge)


</div>

---

<p align="center"> 
    Simple Loading Animation Button for SwiftUI
    <br> 
</p>

## 📹 Preview

<p align="center">
    <img src="imgs/Preview-zoom.gif" width="40%" />
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
.package(url: "https://github.com/Changemin/LoadingButton", from: "1.1.1")
```

## 🎈Usage
```Swift
LoadingButton(action: { }, isLoading: <Binding>Bool, style: LoadingButtonStyle) {
    // View on the button
    // style is optional parameter
```
* `action` : Actions to do when button clicked
* `isLoading` : `<Binding>Bool` type. you can control loading status with this.
* `style`(Optional) : Custom style with `LoadingButtonStyle`

#### 🛠Custom Modifiers
```Swift
LoadingButtonStyle(width: CGFloat, 
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
import LoadingButton

struct ContentView: View {
    @State var isLoading: Bool = false
    
    var body: some View {
        LoadingButton(action: {
            // Your Action here
        }, isLoading: $isLoading) {
            Text("LoadingButton").foregroundColor(Color.white)
        }
    }
}
```
### Result
<img src="imgs/Example-1.png" height="100">
<img src="imgs/Example-1-1.png" height="100">

### 💅🏻 Applying Fully Custom Style
```Swift
import SwiftUI
import LoadingButton

struct ContentView: View {
    @State var isLoading: Bool = false
    var style = LoadingButtonStyle(width: 312,
                              height: 54,
                              cornerRadius: 27,
                              backgroundColor: .orange,
                              loadingColor: Color.orange.opacity(0.5),
                              strokeWidth: 5,
                              strokeColor: .gray)
    
    var body: some View {
        LoadingButton(action: {
            // Your Action here
        }, isLoading: $isLoading, style: style) {
            Text("Styled LoadingButton").foregroundColor(Color.white)
        }
    }
}
```
### Result
<img src="imgs/Example-2.png" height="100">
<img src="imgs/Example-2-1.png" height="100">

### 💅🏻 Styling Only Needs
```Swift
import SwiftUI
import LoadingButton

struct ContentView: View {
    @State var isLoading: Bool = false
    
    var body: some View {
        LoadingButton(action: {
            // Your Action here
        }, isLoading: $isLoading, style: LoadingButtonStyle(cornerRadius: 27, backgroundColor: .orange)) {
            Text("Styled LoadingButton").foregroundColor(Color.white)
        }
    }
}
```
### Same Result
<img src="imgs/Example-2.png" height="100">
<img src="imgs/Example-2-1.png" height="100">


## ✅ TODO
- [ ] End animation(normal, shake(when fail), expand)
- [ ] Support gradient background color

## 📜 License

LoadingButton is available under the MIT license. See the `LICENSE` file for more info.

## ✍️ Author

- Byun Kyung Min ➜ [🇰🇷@Changemin](https://github.com/Changemin)
