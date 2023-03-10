//
//  ContentView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/13/23.
//

import SwiftUI

var shoppingCart: [Meal] = []
var firstName = "Rahul"
var lastName = "Shah"
var currentDay: String = "Monday"
struct ContentView: View {
    @State var isActive:Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var health_facts: [String] = []
    var body: some View {
        NavigationStack {
            ZStack {
                if self.isActive {
                    if !isLoggedIn{
                        LoginView(isLoggedIn: $isLoggedIn)
                    }
                    else{
                        HomeView()
                    }
                } else {
                    Image("ME-color-logo.png")
                        .resizable()
                        .scaledToFit()
                }
            }
            .background(Color.black
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            
            .onAppear {
                // 6.
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    // 7.
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
        .environment(\.colorScheme, .light)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
