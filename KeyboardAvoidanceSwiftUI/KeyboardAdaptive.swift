//
//  KeyboardAdaptive.swift
//  KeyboardAvoidanceSwiftUI
//
//  Created by Vadim Bulavin on 3/27/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI
import Combine

/// Note that the `KeyboardAdaptive` modifier wraps your view in a `GeometryReader`, 
/// which attempts to fill all the available space, potentially increasing content view size.
struct KeyboardAdaptive: ViewModifier {
    private let rerender: AnyPublisher<Any, Never>
    @State private var bottomPadding: CGFloat = 0
    
    init(rerender: AnyPublisher<Any, Never>? = nil) {
        var publishers = [Publishers.keyboardHeight.map { arg -> Any in arg }.eraseToAnyPublisher()]
        if let rerender = rerender {
            publishers.append(rerender)
        }
        self.rerender = Publishers.MergeMany(publishers).eraseToAnyPublisher()
    }
    
    private func bottomPadding(forGeometry geometry: GeometryProxy) -> CGFloat {
        let keyboardTop = geometry.frame(in: .global).height - Publishers.keyboardHeight.value
        var focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
        focusedTextInputBottom += bottomPadding / 2
        return 2 * max(0, focusedTextInputBottom - keyboardTop - geometry.safeAreaInsets.bottom)
    }
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, self.bottomPadding)
                .onReceive(self.rerender, perform: { _ in
                    self.bottomPadding = self.bottomPadding(forGeometry: geometry)
                })
                .animation(.easeOut(duration: 0.16))
        }
    }
}

extension View {
    func keyboardAdaptive(rerender: AnyPublisher<Any, Never>? = nil) -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive(rerender: rerender))
    }
}
