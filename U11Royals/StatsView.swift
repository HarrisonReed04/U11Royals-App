//
//  StatsView.swift
//  U11Royals
//
//  Created by Harrison Reed on 05/08/2022.
//

import SwiftUI

struct StatsView: View {
    init() {
        UITableView.appearance().backgroundColor = .clear
        UISegmentedControl.appearance().selectedSegmentTintColor = .purple
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    let players = ["George", "Ethan", "Harry", "Franklyn", "Zain", "Noah", "Marcus", "Tuula", "Nate", "Taylor", "Lennon", "Darwin", "Owen"]
    let options = ["Goals", "Attendance", "General"]
    let ind = ["Team", "Individual"]
    @State private var option = "Goals"
    @State private var player = "Select Player"
    @State private var team = "Team"
    var body: some View {
        VStack{
            Form{
                Section{
                    Picker("View", selection: $team){
                        ForEach(ind, id:\.self) {
                            Text($0)
                                .font(.system(size:20, weight:.heavy))
                        }
                    }
                    .colorMultiply(.purple)
                }
                .pickerStyle(SegmentedPickerStyle())
                Section{
                    Picker("Stat:", selection: $option){
                        ForEach(options, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .colorMultiply(.purple)
                    
                }
                if (team == "Individual") {
                    Section{
                        Picker("Player", selection: $player) {
                            ForEach(players, id:\.self) { y in
                                Text(y)
                            }
                            
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width:300)
                    }
                    if (player != "Select Player") {
                        
                    }
                    
        }
            }.background(Color.ui.darkmode)
        }
    }
    
    func sortedamounts() {//-> //[String:Int] {
        return
    }
    
    
    
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
