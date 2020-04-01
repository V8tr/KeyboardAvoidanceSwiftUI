//
//  ContentView.swift
//  KeyboardAvoidanceSwiftUI
//
//  Created by Vadim Bulavin on 3/27/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

struct ContentView: View {
    var body: some View {
        TabView {
            OverlapDemo()
                .tabItem { Text("Overlap") }

            WithoutOverlapDemo()
                .tabItem { Text("No Overlap") }

        }
    }
}

struct OverlapDemo: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Enter something", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
        .keyboardAdaptive()
    }
}

struct WithoutOverlapDemo: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Enter something", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
        }
        .padding()
        .keyboardAdaptive()
    }
}
