## Article related to this project

- [Keyboard Avoidance for SwiftUI Views](https://www.vadimbulavin.com/how-to-move-swiftui-view-when-keyboard-covers-text-field/).

---

# KeyboardAvoidanceSwiftUI

A sample project showing how to move SwiftUI view up when keyboard covers a text field.

Usage:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Enter something", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
        .keyboardAdaptive() // <--- Apply the view modifier
    }
}
````

Result:

<p align="center">
  <img src="https://github.com/V8tr/KeyboardAvoidanceSwiftUI/blob/master/demo.gif" alt="How to manage the iOS system keyboard when it covers a SwiftUI text field"/>
</p>
