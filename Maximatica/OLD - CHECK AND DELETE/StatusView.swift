//
//  StatusView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 31.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct StatusView: View {
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Достижения")
                        .fontWeight(.bold)
                    Spacer()
                    Text("sdvsd")
                }
                .font(.largeTitle)
                
                Text("тут мне нравится синий заголовок на желтом фоне")
                    .font(.title)
                    .foregroundColor(.black)
            }

            Spacer()
                .frame(height: 100)
            
            CustomButton(action: {
                
            }) {
                Text("Могу лучше!".uppercased())
            }
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                HistoryGradient()
                
                StatusView()
            }
            .navigationBarTitle("Maximatica")
        }
        .environmentObject(UserData())
        .environmentObject(SettingsStore())
    }
}
