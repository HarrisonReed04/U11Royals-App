//
//  StatsView.swift
//  U11Royals
//
//  Created by Harrison Reed on 05/08/2022.
//

import SwiftUI


///
/// MOST GOALS
struct MostResponse: Codable {
    let topgoals : [MostGoals]
}

struct MostGoals: Codable {
    let log_id : Int
    let first_name : String
    let goals : Int
}

///MOST ATTENDANCE
struct AttendanceResponse : Codable {
    let topattendance : [MostAttendance]
}

struct MostAttendance : Codable {
    let log_id : Int
    let first_name : String
    let playtimepercent : Int
    let played_qs : Int
    let available_qs : Int
}

///GENERAL PLAYER CALL
struct Response: Codable {
    let results: [Result]
}

struct Result : Codable {
    let log_id : Int
    let first_name : String
    let last_name : String
    let played_qs : Int
    let available_qs : Int
    let goals : Int
    let penalties : Int
    let penalty_goals : Int
    let q1goals : Int
    let q2goals : Int
    let q3goals : Int
    let q4goals : Int
    let cpotm_count : Int
    let ppotm_count: Int
}

struct StatsView: View {
        
    init() {
        UITableView.appearance().backgroundColor = .clear
        UISegmentedControl.appearance().selectedSegmentTintColor = .purple
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    let playerslist = ["George", "Ethan", "Harry", "Franklyn", "Zain", "Noah", "Marcus", "Tuula", "Nate", "Taylor", "Lennon", "Darwin", "Owen"]
    let options = ["Goals", "Attendance", "General"]
    let ind = ["Team", "Individual"]
    @State private var option = "Goals"
    @State private var playerc = "Select Player"
    @State private var teamz = "Team"
    @State private var results = [Result]()
    @State private var topgoals = [MostGoals]()
    @State private var topattendance = [MostAttendance]()
    @State private var isLoading = false
    var body: some View {
        VStack{
            Picker("View", selection: $teamz){
                ForEach(ind, id:\.self) {
                    Text($0)
                        .font(.system(size:50, weight:.heavy))
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("Stat:", selection: $option){
                ForEach(options, id:\.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())


            if (teamz == "Team") {
                if option == "Goals" {
                    if isLoading == true{
                        Spacer()
                        ProgressView()
                    }
                    List(topgoals, id: \.log_id) {xy in
                        VStack(alignment: .leading) {

                                Text(xy.first_name)
                                Text("\(xy.goals)")
                            }
                            
                        }
                    .task{
                        await loadData(sorted: "most", what: "goals")
                    }
                    }

                else {if option == "Attendance" {
                    if isLoading == true {
                        Spacer()
                        ProgressView()
                    }
                    
                    List(topattendance, id :\.log_id) {xx in
                        VStack(alignment:.leading) {
                            Text("\(xx.first_name) has played \(String(xx.played_qs)) / \(String(xx.available_qs)) (\(String(xx.playtimepercent))%)")
                        }
                    }
                .task{
                    isLoading = true
                    await loadData(sorted: "most", what: "attendance")
                }
            }
            }
            }

    Spacer()
        }.background(Color.ui.darkmode)
        
        
        
        
        
        
//        List(results, id: \.log_id) {item in
//            VStack(alignment:.leading){
//                Text(item.first_name)
//            }
//        }.task{
//            await loadData()
//        }
        
        
        
        
        
    }
    
    func sortedamounts() {
        return
    }
    
    func loadData(sorted:String="false",what:String="None") async {
        isLoading = true
        if sorted == "most" {
            if what == "goals"{
            guard let url = URL(string:"https://api.hreed.co.uk/players/stats/most?stat=\(what)") else {
                return
            }
            var request = URLRequest(url:url)
            request.setValue("APP-CALL", forHTTPHeaderField: "who")
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                if let decodedResponse = try? JSONDecoder().decode(MostResponse.self, from: data) {
                    topgoals = decodedResponse.topgoals
                    isLoading = false
                }
            } catch {
                print("Decode error")
                return
            }}
            
            
            if what == "attendance" {
                guard let url2 = URL(string:"https://api.hreed.co.uk/players/stats/most?stat=attendance") else {
                    return
                }
                var request = URLRequest(url:url2)
                request.setValue("APP-CALL", forHTTPHeaderField: "who")
                do{
                    let (data2, _) = try await URLSession.shared.data(from: url2)
                    if let decodedResponse = try? JSONDecoder().decode(AttendanceResponse.self, from: data2) {
                        topattendance = decodedResponse.topattendance
                        isLoading = false
                    }
                } catch {
                    print("Decode error")
                    return
                }
                return
            }
            
            
        }

        

        
        
        
        guard let url = URL(string:"https://api.harrisonreed.uk/players") else {
            print("Invalid URL")
            return
        }
        
        var requestz = URLRequest(url:url)
        requestz.addValue("APP-CALL",forHTTPHeaderField: "requesting")
        
        
            do {
            let (data,_) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            return
        }
        }
    }
    
struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
