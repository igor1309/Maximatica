//
//  QuestionQtyPicker.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct QuestionQtyPicker: View {
    @EnvironmentObject var settings: SettingsStore
    
    private var qty: [Int] {
        #if DEBUG
        return [2, 10, 20, 50, 100]
        #else
        return [10, 20, 50, 100]
        #endif
    }
    
    var body: some View {
        Picker("Количество вопросов", selection: $settings.questionQty) {
            ForEach(qty, id: \.self) { qty in
                Text("\(qty)").tag(qty)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .labelsHidden()
    }
}

struct QuestionQtyPicker_Previews: PreviewProvider {
    static var previews: some View {
        QuestionQtyPicker()
            .environmentObject(SettingsStore())
    }
}
