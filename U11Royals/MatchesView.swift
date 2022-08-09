//
//  MatchesView.swift
//  U11Royals
//
//  Created by Harrison Reed on 05/08/2022.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var log_id : Int
    var first_name : String
    var last_name : String
    var played_qs : Int
    var available_qs : Int
    var goals : Int
    var penalties : Int
    var penalty_goals : Int
    var q1goals : Int
    var q2goals : Int
    var q3goals : Int
    var q4goals : Int
    var cpotm_count : Int
    var ppotm_count : Int
}


struct MatchesView: View {
    @State private var results = [Result]()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func loadData() async {
        
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
    }
}
