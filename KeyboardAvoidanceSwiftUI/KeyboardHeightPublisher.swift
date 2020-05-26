//
//  KeyboardHeightPublisher.swift
//  KeyboardAvoidanceSwiftUI
//
//  Created by Vadim Bulavin on 3/27/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import Combine
import UIKit

fileprivate var keyboardUpdates: AnyCancellable?
fileprivate let keyboardHeightPublisher: CurrentValueSubject<CGFloat, Never> = {
    let subject = CurrentValueSubject<CGFloat, Never>(0)
    
    let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
        .map { $0.keyboardHeight }
    let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
        .map { _ in CGFloat(0) }
    keyboardUpdates = Publishers.MergeMany(willShow, willHide).assign(to: \.value, on: subject)

    return subject
}()

extension Publishers {
    static var keyboardHeight: CurrentValueSubject<CGFloat, Never> {
        keyboardHeightPublisher
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
