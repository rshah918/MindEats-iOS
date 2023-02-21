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
        NavigationStack {
            ZStack{
                VStack{
                        Text("Welcome, " + firstName)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.top], 30)
                        
                        Spacer()
                            .padding()
                            .frame(height: 60)
                        
                        Image("Home-Page.png")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 250)
                        Text("Health Fact of the Day!")
                        
                        Spacer()
                            .frame(height: 20)
                        let health_facts = loadFact()
                        Text(health_facts.randomElement() ?? "")
                            .padding()
                            .lineLimit(10)
                            .fixedSize(horizontal: false, vertical: true)
                            .minimumScaleFactor(0.8)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        NavigationLink(destination: CategoriesView()){
                            
                            Text("Find your next Meal!")
                            
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color.white)
                                .cornerRadius(15)
                            
                        }
                    Spacer()
                        .frame(minHeight: 70, idealHeight:180, maxHeight: 200)
                        
                    
                    HStack{
                        NavigationLink( destination:HomeView(firstName: $firstName, lastName: $lastName).navigationBarBackButtonHidden(true)){
                            VStack{
                                    Image(systemName: "house.fill")
                                    Text("Home")
                                    .font(.title3)
                                    .foregroundColor(Color.gray)
                                
                            }
                        }
                        
                        NavigationLink( destination:HistoryView().navigationBarBackButtonHidden(false)){
                            VStack{
                                    Image(systemName: "arrow.counterclockwise")
                                    Text("History")
                                    .font(.title3)
                                    .foregroundColor(Color.gray)
                                
                            }
                        }
                        
                        NavigationLink( destination:CategoriesView().navigationBarBackButtonHidden(false)){
                            VStack{
                                Image(systemName: "square.on.square")
                                    
                                    Text("Categories")
                                    .font(.title3)
                                    .foregroundColor(Color.gray)
                                
                            }
                        }
                        
                        NavigationLink( destination:CategoriesView().navigationBarBackButtonHidden(false)){
                            VStack{
                                    Image(systemName: "person.fill")
                                Text("Profile")
                                    .font(.title3)
                                    .foregroundColor(Color.gray)
                                
                            }
                        }
                    }
                    
                    .padding(15)
                    .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .bottom)
                    .position(CGPoint(x: UIScreen.main.bounds.width/2,y: 70))
                    .background(Color.white)
                    .cornerRadius(15)
                    .ignoresSafeArea()
                }
            }
            .background(Color.green
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        }
    }
    func loadFact() -> [String] {
           guard let url = Bundle.main.url(forResource: "health_facts", withExtension: "json"),
                 let data = try? Data(contentsOf: url),
                 let colors = try? JSONDecoder().decode([String].self, from: data)
           else { return [] }
           return colors
       }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let firstName = "Rahul"
        let lastName = "Shah"
        HomeView(firstName: Binding.constant(firstName), lastName: Binding.constant(lastName))
    }
}
