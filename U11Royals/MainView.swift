//
//  ContentView.swift
//  U11Royals
//
//  Created by Harrison Reed on 05/08/2022.
//

import SwiftUI

extension Color {
    static let ui = Color.UI()
    struct UI {
        let darkmode = Color("color.darkmode")
    }
}

struct MainView: View {
    var body: some View {
            TabView {
                HomePage()
                    .tabItem{
                        Label("Home", systemImage:"house.fill")
                    }
                MatchesPresentView()
                    .tabItem{
                        Label("Matches", systemImage:"sportscourt.fill")
                    }
                StatsView()
                    .tabItem{
                        Label("Statistics", systemImage: "chart.bar.xaxis")
                    }

                SquadlistView()
                    .tabItem{
                        Label("Squad List", systemImage: "person.3.sequence.fill")
                    }
            }
            .foregroundColor(.white)
            .accentColor(.purple)

        }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
