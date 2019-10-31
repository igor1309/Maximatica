//
//  MissionOptionsSelector.swift
//  Maximatica
//
//  Created by Igor Malyarov on 31.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct MissionOptionsSelector: View {
    @EnvironmentObject var settings: SettingsStore
    
    var body: some View {
        VStack {
//            Text("Выбери миссию".uppercased())
//                .font(.headline)
//                .foregroundColor(.white)
            Picker("Миссия", selection: $settings.mission
                .animation(Animation.easeOut(duration: 0.5))) {
                    
                    ForEach(Mission.allCases, id: \.self) { mission in
                        Text(mission.id.uppercased()).tag(mission)
                    }
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            
            if settings.mission == .qty {
                MissionQtySelector()
            } else {
                MissionTimeSelector()
            }
        }
    }
}

struct MissionQtySelector: View {
    @EnvironmentObject var settings: SettingsStore
    
    private var qtyArray: [Int] {
        #if DEBUG
        return [2, 10, 20, 50, 100]
        #else
        return [10, 20, 50, 100]
        #endif
    }
    
    var body: some View {
        Picker("Количество вопросов", selection: $settings.questionQty.animation()) {
            ForEach(qtyArray, id: \.self) { qty in
                Text("\(qty)").tag(qty)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .labelsHidden()
        .onAppear {
            if self.settings.questionQty == 0 {
                self.settings.questionQty = 10 }
        }
    }
}

struct MissionTimeSelector: View {
    @EnvironmentObject var settings: SettingsStore
    
    private var timeArray: [Int] {
        [5, 10, 15, 20]
    }
    
    var body: some View {
        Picker("Время миссии", selection: $settings.missionTime.animation()) {
            ForEach(timeArray, id: \.self) { item in
                Text("\(item) минут").tag(item)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .labelsHidden()
        .onAppear {
            if self.settings.missionTime == 0 {
                self.settings.missionTime = 10
            }
        }
    }
}


struct MissionOptionsSelector_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                HistoryGradient()
                
                VStack {
                    MissionOptionsSelector()
                    Spacer()
                    
                    MissionTimeSelector()
                    MissionQtySelector()
                    Spacer()
                }
                .padding()
            }
        }
        .environmentObject(SettingsStore())
    }
}
