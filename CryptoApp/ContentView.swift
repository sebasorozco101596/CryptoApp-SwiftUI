//
//  ContentView.swift
//  CryptoApp
//
//  Created by Juan Sebastian Orozco Buitrago on 4/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
