//
//  MatchRow.swift
//  U11Royals
//
//  Created by Harrison Reed on 17/08/2022.
//

import SwiftUI

struct MatchRow: View {
    let match: Match
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(formColor(winlose: match.winlose))
                .frame(width:330, height:50)
            Text(match.team_name)
        }
    }
}
