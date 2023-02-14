//
//  ContentView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("ME-color-logo.png")
                .resizable()
                .scaledToFit()
                .background(Color.green)

        }.background(Color.green
            .edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
