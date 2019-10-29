//
//  HistoryTable.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct HistoryTable: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.history.results) { result in
                HistoryRow(result: result)
            }
            .onDelete(perform: delete)
        }
        .listStyle(GroupedListStyle())
    }
    
    func delete(at offsets: IndexSet) {
        if hapticsAvailable {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        
        withAnimation {
            userData.history.results.remove(atOffsets: offsets)
        }
    }
}


struct HistoryTable_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTable()
            .environmentObject(UserData())
    }
}
