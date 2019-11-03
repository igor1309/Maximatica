//
//  MissionOptionsSelector.swift
//  Maximatica
//
//  Created by Igor Malyarov on 31.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct MissionOptionsSelector: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            //            Text("Выбери миссию".uppercased())
            //                .font(.headline)
            //                .foregroundColor(.white)
            Picker("Миссия", selection: $userData.missionMode
                .animation(Animation.easeOut(duration: 0.5))) {
                    
                    ForEach(MissionMode.allCases, id: \.self) { mission in
                        Text(mission.id.uppercased()).tag(mission)
                    }
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            
            if userData.missionMode == .qty {
                MissionQtySelector()
            } else {
                MissionTimeSelector()
            }
        }
    }
}

struct MissionQtySelector: View {
    @EnvironmentObject var userData: UserData
    private var qtyArray: [Int] {
        #if DEBUG
        return [2, 10, 20, 50, 100]
        #else
        return [10, 20, 50, 100]
        #endif
    }
    
    var body: some View {
        Picker("Количество вопросов", selection: $userData.questionQty.animation()) {
            ForEach(qtyArray, id: \.self) { qty in
                Text("\(qty)").tag(qty)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .labelsHidden()
        .onAppear {
            if self.userData.questionQty == 0 {
                self.userData.questionQty = 10 }
        }
    }
}

struct MissionTimeSelector: View {
    @EnvironmentObject var userData: UserData
    
    private var timeArray: [Int] {
        #if DEBUG
        return [1, 5, 10, 15]
        #else
        return [5, 10, 15, 20]
        #endif
    }
    
    var body: some View {
        Picker("Время миссии", selection: $userData.missionTime.animation()) {
            ForEach(timeArray, id: \.self) { item in
                Text("\(item) минут").tag(TimeInterval(item * 60))
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .labelsHidden()
        .onAppear {
            if self.userData.missionTime == 0 {
                //  10 minutes = 600 seconds
                self.userData.missionTime = 600
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
        .environmentObject(UserData())
        .environmentObject(SettingsStore())
    }
}
