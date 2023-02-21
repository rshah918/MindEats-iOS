//
//  ContentView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var isActive:Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var firstName = "Rahul"
    @State private var lastName = "Shah"
    @State private var selection = 1
    @State private var health_facts: [String] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                if self.isActive {
                    if !isLoggedIn{
                        LoginView(isLoggedIn: $isLoggedIn, selection: $selection)
                    }
                    else{
                        if selection == 1{
                            HomeView(firstName: $firstName, lastName: $lastName, selection: $selection)
                        }
                        else if selection == 3{
                            CategoriesView()
                        }
                    }
                } else {
                    Image("ME-color-logo.png")
                        .resizable()
                        .scaledToFit()
                        .background(Color.green)
                    
                }
            }
            .background(Color.green
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
