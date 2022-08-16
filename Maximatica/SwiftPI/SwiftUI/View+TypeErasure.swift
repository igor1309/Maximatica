//
//  View+TypeErasure.swift
//  
//
//  Created by Igor Malyarov on 15.11.2019.
//

import SwiftUI

@available(OSX 10.15, *)
extension View {
    /// Returns a type-erased version of the view.
    public var typeErased: AnyView { AnyView(self) }
    
    func erasedToAnyView() -> AnyView {
        AnyView(self)
    }
}
