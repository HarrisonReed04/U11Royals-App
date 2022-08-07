//
//  HomePage.swift
//  U11Royals
//
//  Created by Harrison Reed on 05/08/2022.
//

import SwiftUI

struct HomePage: View {
    let league = "Blue 1"
    let prevmatch : [String : String] = ["Result":"3-1", "Team Name":"Winchester City Reds", "W/D/L":"L"]
    let teamstats : [String: String] = ["goal_difference":"30"]
    let lastfive : [String: String] = ["Winchester City Red":"L","Stoneham Pumas":"W","Stoneham Panthers":"D","Totton":"L","Southside":"D"]
    let lastcpotm = "Marcus"
    let lastppotm = "Tuula"
    var body: some View {
        
        VStack {
            HStack {
                Image("stoneham")
                    .clipShape(Circle())
                VStack {
                    Text("AFC STONEHAM U11 ROYALS")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                    Text("Current League: \(league)")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color.purple.ignoresSafeArea(edges: .top))
            
            HStack{
                Text("Recent Form")
                    .frame(width:200, alignment: .leading)
                    .padding()
                Circle()
                    .fill(.green)
                    .frame(width: 15, height: 15, alignment: .trailing)
                Circle()
                    .fill(.red)
                    .frame(width: 15, height: 15, alignment: .trailing)
                Circle()
                    .fill(.gray)
                    .frame(width: 15, height: 15, alignment: .trailing)
                Circle()
                    .fill(.green)
                    .frame(width: 15, height: 15, alignment: .trailing)
                Circle()
                    .fill(.red)
                    .frame(width:15, height: 15, alignment: .trailing)
                
                
            }.padding(.trailing)

            VStack{
                Text("Upcoming Fixture")
                    .frame(width:330, alignment: .leading)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.purple)
                        .frame(width:330, height:90)
                    HStack(alignment: .top) {
                        Text("Opponents:")
                            .frame(width:330/2 ,alignment: .trailing)
                            
                        Text("Testing Opps")
                        
                    }
                    }
                }
            
            
            
            Text("Last Match")
                .frame(width: 330, height: 30, alignment: .leading)
            ZStack{
                RoundedRectangle(cornerRadius:10)
                    .fill(deccolor())
                    .frame(width: 330, height:60)
                    .padding([.trailing, .leading])
                VStack{
                    HStack{
                    Text("Opponents: ")
                            .padding(.leading)
                            .frame(alignment: .leading)
                            .offset(x:20, y:-15)
                        Spacer()
                        Text("\(prevopps())")
                            .scaledToFit()
                            .offset(x:-40, y:-15)
                    }
                }
                VStack{
                    HStack{
                    Text("Score: ")
                        .padding(.leading)
                        .frame(alignment: .leading)
                        .offset(x:20, y:15)
                    Spacer()
                    Text("\(prevscore())")
                            .padding(.leading)
                            .frame(alignment:.leading)
                            .offset(x:-40, y:15)
                    }
                }
                }
            .offset(y:8)
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
            
            Text("Team Stats")
                .frame(width:330, height: 30, alignment: .leading)
                .padding([.top])
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius:15)
                        .fill(.purple)
                        .frame(width:105,height:105
                        )
                    Text("Goals\n  For:")
                        .offset(y:-20)
                    Spacer()
                    Text("32")
                        .offset(y:20)
                }
                ZStack{
                    RoundedRectangle(cornerRadius:15)
                        .fill(.purple)
                        .frame(width:105, height:105)
                    Text("  Goals\nAgainst:")
                        .offset(y:-20)
                    Text("12")
                        .offset(y:20)
                }
                ZStack{
                    RoundedRectangle(cornerRadius:15)
                        .fill(.purple)
                        .frame(width:105, height:105)
                    Text("     Goal\nDifference")
                        .offset(y:-20)
                    Text("+20")
                        .offset(y:20)
                }
            }
            Spacer()
        }
        
        .background(Color.ui.darkmode)
        .foregroundColor(.white)
    }
    
    func deccolor () -> Color {
        if (prevmatch["W/D/L"] == "W") {
            return .green
        } else { if (prevmatch["W/D/L"] == "D") {
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
    func prevscore () -> String {
        if (prevmatch["Result"] != nil) {
            let prevscores:String? = prevmatch["Result"]
            return prevscores!
        } else {
            return "Errored"
        }
    }
    func prevopps () -> String {
        if (prevmatch["Team Name"] != nil) {
            let prevopponentsname:String? = prevmatch["Team Name"]
            return prevopponentsname!
        } else {
            return "Errored"
        }
    }
}



struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
