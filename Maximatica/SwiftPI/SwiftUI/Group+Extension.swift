//
//  Group+Extension.swift
//  RFin
//
//  Created by Igor Malyarov on 17.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

#if !os(macOS)
import SwiftUI

/// https://mecid.github.io/2019/10/09/dynamic-type-in-swiftui/
/// https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-different-layouts-using-size-classes
@available(iOS 13, *)
fileprivate struct EmbedInStack: ViewModifier {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    func body(content: Content) -> some View {
        if horizontalSizeClass == .compact {
            return AnyView(VStack { content })
        } else {
            return AnyView(HStack { content })
        }
    }
}

@available(iOS 13, *)
public extension Group where Content: View {
    func embedInStack() -> some View {
        ModifiedContent(content: self, modifier: EmbedInStack())
    }
}
#endif
