//
//  HomeView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/14/23.
//

import SwiftUI

struct HomeView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    var body: some View {
        ZStack{
            VStack{
                Text("Welcome, " + firstName)
                    .font(.title)
                    .foregroundColor(Color.white)
                    
                    
                Spacer()
                    .frame(height: 100)
                
                Image("Home-Page.png")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 250)
                Text("Health Fact of the Day!")
                Spacer()
                    .frame(height: 20)
                
                Text("A dick a day keeps the doctor away!")
                
                Spacer()
                    .frame(height: 20)
                
                Button(action: {

                }){
                Text("Find your next Meal!")
                        
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.white)
                        .cornerRadius(15)
                        
                }
                Spacer()
                    .frame(height:190)
                
                
                TabView {
                
                    Button(action:{}){}
                        .tabItem {
                            Image(systemName: "phone.fill")
                            Text("Home")
                        }
                    Button(action:{}){}
                        .tabItem {
                            Image(systemName: "tv.fill")
                            Text("History")
                        }
                    Button(action:{}){}
                        .tabItem {
                            Image(systemName: "tv.fill")
                            Text("Categories")
                        }
                    Button(action:{}){}
                        .tabItem {
                            Image(systemName: "tv.fill")
                            Text("Profile")
                        }
                }
                .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .bottom)
                .cornerRadius(15)
                .position(CGPoint(x: UIScreen.main.bounds.width/2,y:40))

                    
            }
            .background(Color.green
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        var firstName = "Rahul"
        var lastName = "Shah"
        HomeView(firstName: Binding.constant(firstName), lastName: Binding.constant(lastName))
    }
}
