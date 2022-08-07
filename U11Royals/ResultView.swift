//
//  ResultView.swift
//  U11Royals
//
//  Created by Harrison Reed on 06/08/2022.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        VStack{
        Rectangle()
            .fill(.red)
            .frame(width: 315, height:60, alignment: .center)
        Text("Hello!")
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
