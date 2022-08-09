//
//  SquadlistView.swift
//  U11Royals
//
//  Created by Harrison Reed on 05/08/2022.
//

import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            Button("Dismiss Large") {
                presentationMode.wrappedValue.dismiss()
            }
            .background(Color.ui.darkmode)
            .foregroundColor(.white)
        }
        .background(Color.ui.darkmode, ignoresSafeAreaEdges: .all)
        
        
    }
}

struct SquadlistView: View {
    @State private var isPresented = false
    var body: some View {
        Button("Present Mode") {
            isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
    }
}

struct SquadlistView_Previews: PreviewProvider {
    static var previews: some View {
        SquadlistView()
    }
}
