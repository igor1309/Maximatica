//
//  Buttons.swift
//  BondCashFlow
//
//  Created by Igor Malyarov on 03.09.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

#if !os(macOS)

import SwiftUI

@available(iOS 13, *)
public struct TrailingToggle: View {
    @Binding var isOn: Bool
    var iconOn: String = "text.bubble"
    var iconOff: String = "text.bubble.fill"
    
    public init(isOn: Binding<Bool>, iconOn: String = "text.bubble", iconOff: String = "text.bubble.fill") {
        self._isOn = isOn
        self.iconOn = iconOn
        self.iconOff = iconOff
    }
    
    public var body: some View {
        TrailingButtonSFSymbol(isOn ? iconOn : iconOff) {
            self.isOn.toggle()
        }
    }
}


/**
 Button with nice `padding` (EdgeInsets) for `trailing` location inside `navigationBarItems`. It has a name and `closure` to perform.
 
 - Parameters:
 - name: name of the Button
 - closure: closure to perform
 */
@available(iOS 13, *)
public struct TrailingButton: View {
    @Environment(\.presentationMode) var presentation
    var name: String
    var closure: () -> Void
    
    public var body: some View {
        Button(action: {
            self.closure()
        }) {
            Text(name)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
        }
    }
}

@available(iOS 13, *)
public extension TrailingButton {
    init(_ name: String, closure: @escaping () -> Void) {
        self.name = name
        self.closure = closure
    }
}

/// Button with nice `padding` (EdgeInsets) for `leading` location inside `navigationBarItems`.
/// It has a name and `closure` to perform.
///
/// - Parameters:
///     - name: name of the Button
///     - closure: closure to perform
@available(iOS 13, *)
public struct LeadingButton: View {
    @Environment(\.presentationMode) var presentation
    var name: String
    var closure: () -> Void
    
    public var body: some View {
        Button(action: {
            self.closure()
        }) {
            Text(name)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16))
        }
    }
}

@available(iOS 13, *)
public extension LeadingButton {
    init(_ name: String, closure: @escaping () -> Void) {
        self.name = name
        self.closure = closure
    }
}

@available(iOS 13, *)
public struct TrailingButtonSFSymbol: View {
    @Environment(\.presentationMode) var presentation
    var systemName: String
    var closure: () -> Void
    
    public var body: some View {
        Button(action: {
            self.closure()
        }) {
            Image(systemName: systemName)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
        }
    }
}

@available(iOS 13, *)
public extension TrailingButtonSFSymbol {
    init(_ systemName: String, closure: @escaping () -> Void) {
        self.systemName = systemName
        self.closure = closure
    }
}


@available(iOS 13, *)
public struct LeadingButtonSFSymbol: View {
    @Environment(\.presentationMode) var presentation
    var systemName: String
    var closure: () -> Void
    
    public var body: some View {
        Button(action: {
            self.closure()
        }) {
            Image(systemName: systemName)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16))
        }
    }
}

@available(iOS 13, *)
public extension LeadingButtonSFSymbol {
    init(_ systemName: String, closure: @escaping () -> Void) {
        self.systemName = systemName
        self.closure = closure
    }
    
}

#endif
