//
//  MatchesPresent.swift
//  U11Royals
//
//  Created by Harrison Reed on 16/08/2022.
//

import SwiftUI

struct MatchResponse: Codable {
    let matches: [Match]
}

struct Match : Codable {
    let log_id : Int
    let team_name : String
    let date : String
    let kickoff : String
    let venue : String
    let homeside : String
    let result : String
    let winlose: String
    let total_goals_for : Int
    let total_goals_against : Int
    let q1goalsfor : Int
    let q1goalsagainst : Int
    let q2goalsfor : Int
    let q2goalsagainst : Int
    let q3goalsfor : Int
    let q3goalsagainst : Int
    let q4goalsfor : Int
    let q4goalsagainst : Int
    let cpotm : String
    let ppotm: String
}


struct MatchesPresentView: View {
    
    @State private var matches = [Match]()

    @State private var isLoading = true
    
    @State private var tense = "Previous"
    
    @State private var offset = 0
    
    @State private var remaining = 0
    
    @State private var defined = false
    
    let tenses = ["Previous", "Future"]
    
    var body: some View {
        NavigationView{
        VStack{
            if isLoading {
                List{
                }
                    .task{
                        await loadPrevMatches()
                    }
            }
            if isLoading == false {
                Picker("Tense", selection: $tense){
                    ForEach(tenses, id:\.self) {
                        Text($0)
                            .font(.system(size:100, weight:.heavy))
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                
                
                
                
                
                
                ZStack (alignment: .leading){
                        RoundedRectangle(cornerRadius:8)
                            .fill(.purple)
                            .frame(width:330,height:30)
                            .padding([.leading,.trailing])
                    HStack{
                        Text("Recent Form")
                            .font(.system(size:20, weight:.light))
                            .frame(width:120,alignment: .leading)
                            .offset(x:20)
                        Spacer()
                            .frame(width:50)
                        Button(action: {
                            Task {
                                await loadPrevMatches()
                            }
                        }, label: {
                            Image(systemName: "arrow.2.squarepath")
                                .foregroundColor(Color.ui.darkmode)
                                .font(.system(size: 20, weight:.bold))
                        })
                        .offset(x:-10)
                        Spacer()
                            .frame(width:25)
                            ForEach(matches.dropLast(matches.count - 5), id:\.log_id) {match in
                                Circle()
                                    .fill(formColor(winlose: match.winlose))
                                    .frame(width: 15, height: 15, alignment: .trailing)
                            }
                        
                    }
                    }
                
                
                
                
                
                if (tense == "Previous") {
                    Spacer()
                        .frame(height:20)

                        Button("Load Sooner Matches") {
                            offset = offset - 1
                            remaining += 1
                        }
                        .foregroundColor(!(offset >= 1) ? .gray : .white)
                        .frame(width:330, height:30)
                        .background(Color.ui.darkmode)
                        .disabled(!(offset >= 1))
                    Spacer()
                        .frame(height:20)
                    
                    
                    
                    if offset >= 0 {
                        let droppedfirst = matches.dropFirst(offset)
                        let dropped = droppedfirst.dropLast(remaining)
                        
                    ForEach(dropped, id:\.log_id) {match in
                        NavigationLink (destination:ShowMatch(match:match)) {
                            MatchRow(match:match)
                                .frame(alignment:.center)
                        }
                        .navigationTitle("Recent Matches")
                    Spacer()
                            .frame(height:20)
                    }
                    }
                    
                    
                    Button("Load Earlier Matches") {
                        offset += 1
                        remaining -= 1
                    }
                    .foregroundColor(!(offset >= 0 && offset + 1 <= matches.count && remaining > 0) ? .gray : .white)
                    .frame(width:330, height:30)
                    .background(Color.ui.darkmode)
                    .disabled(!(offset >= 0 && offset + 1 <= matches.count && remaining > 0))
                }
                
                if (tense == "Future") {
                    Text("Upcoming Matches")
                        .font(.system(size:30,weight:.bold))
                    Spacer()
                

                }
       Spacer()
            }
    }        .background(Color.ui.darkmode)
        }

    }
    
        
    
        
        func loadPrevMatches() async {
            isLoading = true
                guard let url = URL(string:"https://api.hreed.co.uk/matches/previous?amount=all&dict=True") else {
                    return
                }
                do{
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let decodedResponse = try JSONDecoder().decode(MatchResponse.self, from: data)
                        matches = decodedResponse.matches
                        isLoading = false
                    if !defined{
                        remaining = matches.count - 5
                    }
                        defined = true
                    
                } catch let jsonERROR as NSError{
                        print("Big error \(jsonERROR.localizedDescription)")
                    }
                }
//    func loadFutureMatches() async {
//        isLoading = true
//        guard let url = URL(string:"https://api.hreed.co.uk/matches/upcoming")
//    }
//
    
}
                
        func formColor(winlose:String) -> Color {
            switch winlose{
            case "w":
                return .green
            case "d":
                return .gray
            case "l":
                return .red
            default:
                return .cyan
            
            }
                
            }

     
            
            
       

        
    
struct MatchesPresentView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
