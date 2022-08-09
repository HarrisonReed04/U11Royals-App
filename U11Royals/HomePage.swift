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
    let stat2 = "Franklyn (3)"
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
                    .font(.system(size:20, weight:.semibold))
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
                    Text("\(prevopps())")
                        .padding(.trailing,30)
                }
                .offset(y:-15)

                    HStack{
                    Text("Score: ")
                            .padding(.leading, 25)
                            .font(.system(size:18,weight:.semibold))
                    Spacer()
                    Text("\(prevscore())")
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
    func fontsize (str:String) -> Double {
        if (str.count > 10) {
            return 18
        } else {
            return 20
        }
    }
    
}



struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
