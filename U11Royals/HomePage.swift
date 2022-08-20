//
//  HomePage.swift
//  U11Royals
//
//  Created by Harrison Reed on 05/08/2022.
//

import SwiftUI

struct HomePage: View {
    let league = "Blue 1"
    let teamstats : [String: String] = ["goal_difference":"30"]
    let lastfive : [String: String] = ["Winchester City Red":"L","Stoneham Pumas":"W","Stoneham Panthers":"D","Totton":"L","Southside":"D"]
    let lastcpotm = "Marcus"
    let lastppotm = "Tuula"
    let stat2 = "Franklyn (3)"
    @State private var isLoading = true
    @State var backmatch = [prevmatch]()
    @State var forwardmatch = [upcomingmatch]()
    @State var generalstats = [genstats]()
    var body: some View {
        VStack {
            if isLoading == true {
                Spacer()
                ProgressView()
                List {
                    
                }
                .task {
                    await loadHomePage()
                }
            }

            if isLoading == false {
            HStack {
                Image("stoneham")
                    .clipShape(Circle())
                VStack {
                    Text("AFC STONEHAM U11 ROYALS")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                    Text("Current League: \(generalstats[0].league)")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color.purple.ignoresSafeArea(edges: .top))
            
            HStack{
                Text("Recent Form")
                    .font(.system(size:20, weight:.semibold))
                    .frame(width:200, alignment: .leading)
                    .padding()
                ForEach(backmatch, id:\.log_id) {match in
                    Circle()
                        .fill(formColor(winlose: match.winlose))
                        .frame(width: 15, height: 15, alignment: .trailing)

                }
                
                
            }.padding(.trailing)

            VStack{
                Text("Upcoming Fixture")
                    .font(.system(size:18, weight:.semibold))
                    .frame(width:330, alignment: .leading)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.purple)
                    HStack {
                        Text("Opponents:")
                            .font(.system(size:18, weight:.bold))
                            .padding(.leading, 10)
                            Spacer()
                        Text("Winchester City Red")
                            .padding(.trailing, 10)
                        
                    }.frame(width: 330)
                        .offset(y:-30)
                    HStack {
                        Text("Date:")
                            .font(.system(size:18, weight:.bold))
                            .padding(.leading, 10)
                            Spacer()
                        Text("09/08/2022")
                            .padding(.trailing, 10)
                    }.offset(y:-10)
                    
                    HStack {
                        Text("Venue:")
                            .font(.system(size:18, weight:.bold))
                            .padding(.leading, 10)
                            Spacer()
                        Text("Stoneham Lane")
                            .padding(.trailing, 10)
                    }.offset(y:10)
                    
                    HStack {
                        Text("Kick Off:")
                            .font(.system(size:18, weight:.bold))
                            .padding(.leading,10)
                        Spacer()
                        Text("9:00AM")
                            .padding(.trailing, 10)
                    }.offset(y:30)
                    
                    HStack{
                        
                    }
                    
                }.frame(width:330,height:90)
                }
            
            
            
            Text("Last Match")
                .font(.system(size:18, weight:.semibold))
                .frame(width:330,alignment: .leading)
            ZStack{
                RoundedRectangle(cornerRadius:10)
                    .fill(deccolor())
                    .frame(width: 330, height:60)
                    .padding([.trailing, .leading])
                if (deccolor() == .red) {
                    Text("L")
                        .font(.system(size: 36, weight:.semibold))
                        .frame(width:90)
                        .opacity(0.3)
                } else { if (deccolor() == .green) {
                    Text("W")
                        .font(.system(size: 36, weight:.semibold))
                        .frame(width:90)
                        .opacity(0.3)
                } else {
                    Text("D")
                        .font(.system(size: 36, weight:.semibold))
                        .frame(width:90)
                        .opacity(0.3)
                    
                }
                }

                HStack{
                    Text("Opponents:")
                        .padding(.leading,25)
                        .font(.system(size:18,weight:.semibold))
                    Spacer()
                    Text("\(backmatch[0].team_name)")
                        .padding(.trailing,30)
                }
                .offset(y:-15)

                    HStack{
                    Text("Score: ")
                            .padding(.leading, 25)
                            .font(.system(size:18,weight:.semibold))
                    Spacer()
                        Text("\(backmatch[0].result)")
                            .padding(.trailing,30)

                    }
                    .offset(y:15)
            }
            .frame(width:330,height:60)
            .offset(y:-5)
            ZStack{
                RoundedRectangle(cornerRadius:10)
                    .fill(.gray)
                    .frame(width: 330, height:40)
                    .padding([.trailing, .leading])
                ZStack{
                Text("CPOTM: \(lastcpotm)")
                    .frame(width:310, height:40,alignment: .leading)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Spacer()
                Text("PPOTM: \(lastppotm)")
                    .frame(width:310, height:40, alignment: .trailing)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            }
                .frame(width:330,height:40)
                .offset(y:-8)
            
            Text("Team Stats")
                .font(.system(size:18, weight:.semibold))
                .frame(width:330, height: 30, alignment: .leading)
    
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius:15)
                        .fill(.purple)
                        .frame(width:105,height:105
                        )
                    Text("   Q With\nmost goals")
                        .font(.system(size:18,weight:.semibold))
                        .offset(y:-20)
                    Spacer()
                    Text("Q4")
                        .font(.system(size:20))
                        .offset(y:20)
                }
                ZStack{
                    RoundedRectangle(cornerRadius:15)
                        .fill(.purple)
                        .frame(width:105, height:105)
                    Text(" Most\nPOTM:")
                        .font(.system(size:18,weight:.semibold))
                        .offset(y:-20)
                    Text("\(stat2)")
                        .font(.system(size:fontsize(str:stat2)))
                        .offset(y:20)
                }
                ZStack{
                    RoundedRectangle(cornerRadius:15)
                        .fill(.purple)
                        .frame(width:105, height:105)
                    Text("      Goal\nDifference")
                        .font(.system(size:18, weight:.semibold))
                        .offset(y:-20)
                    Text("+20")
                        .font(.system(size:20))
                        .offset(y:20)
                }
            }
            Spacer()
                Button(action: {
                    Task {
                        await loadHomePage()
                    }
                }, label: {
                    Text("Refresh").font(.system(size: 18))
                        .padding()
                        .frame(width: 350, height:30)
                        .background(RoundedRectangle(cornerRadius:8).fill(Color.purple))
                        
                })
        }
        }
        .background(Color.ui.darkmode)
        .foregroundColor(.white)
        
    }
    
    func deccolor () -> Color {
        let _ = print(backmatch)
        if (backmatch[0].winlose == "w") {
            return .green
        } else { if (backmatch[0].winlose == "d") {
            return .gray
        } else {
            return .red
            }
                }
    }
    func gdcolor () -> Color {
        if ((teamstats["goal_difference"]?.contains("-")) != nil) {
            return .red
        } else {
            return .green
        }
    }

    func fontsize (str:String) -> Double {
        if (str.count > 10) {
            return 18
        } else {
            return 20
        }
    }
    
    struct homepage: Codable {
        let general : [genstats]
        let lastfive: [prevmatch]
        let upcoming_match: [upcomingmatch]
    }
    
    struct genstats : Codable {
        let league : String
    }
    
    struct prevmatch: Codable {
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
    
    struct upcomingmatch: Codable {
        let log_id : Int
        let team_name : String
        let date : String
        let kickoff : String
        let venue : String
        let homeside : String
    }
    
    
    func loadHomePage() async {
        isLoading = true
            guard let url = URL(string:"https://api.hreed.co.uk/homepage") else {
                return
            }
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                let DecodedResponse = try JSONDecoder().decode(homepage.self, from: data)
                    generalstats = DecodedResponse.general
                    backmatch = DecodedResponse.lastfive
                    forwardmatch = DecodedResponse.upcoming_match
                isLoading = false
            } catch let jsonError as NSError{
                print("JSON decode failed: \(jsonError.debugDescription)")
                return
            }
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

 
        }
        



struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
