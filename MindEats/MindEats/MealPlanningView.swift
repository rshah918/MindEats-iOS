//
//  MealPlanningView.swift
//  MindEats
//
//  Created by Rahul Shah on 3/11/23.
//

import SwiftUI

struct MealPlanningView: View {
    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack{
                    Spacer()
                    
                    HStack{
                        HStack{
                            NavigationLink( destination:HomeView().navigationBarBackButtonHidden(true)){
                                VStack{
                                    Image(systemName: "house.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color.black)
                                    Text("Home")
                                        .font(.title3)
                                        .foregroundColor(Color.gray)
                                    
                                }
                            }
                            Spacer()
                            NavigationLink( destination:MealPlanningView().navigationBarBackButtonHidden(false)){
                                VStack{
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color.black)
                                    Text("Meal Plan")
                                        .font(.title3)
                                        .foregroundColor(Color.gray)
                                    
                                }
                            }
                            Spacer()
                            NavigationLink( destination:CategoriesView().navigationBarBackButtonHidden(false)){
                                VStack{
                                    Image( "leaf.png")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    
                                    Text("Categories")
                                        .font(.title3)
                                        .foregroundColor(Color.gray)
                                }
                            }
                            Spacer()
                            NavigationLink( destination:ShoppingCartView().navigationBarBackButtonHidden(false)){
                                VStack{
                                    Image(systemName: "cart.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color.black)
                                    Text("Cart")
                                        .font(.title3)
                                        .foregroundColor(Color.gray)
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.85)
                    }
                    
                    .padding(10)
                    .padding(.bottom, 10)
                    .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .bottom)
                    .background(Color.white)
                    .cornerRadius(15)
                }
                .zIndex(1)
                .ignoresSafeArea()
                NavigationView {
                    VStack {
                        Text("Meal Planning")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.top, 15)
                        
                        Text("Select a day of the week:")
                            .font(.headline)
                            .padding(.top, 5)
                        
                        // List of expandable sections for each day of the week
                        List {
                            ForEach(daysOfWeek, id: \.self) { day in
                                Section(header: Text(day)) {
                                    MealList(dayOfWeek: day)
                                }
                            }
                            HStack{
                                Spacer()
                                    .frame(width: UIScreen.main.bounds.width * 0.2)
                                NavigationLink(destination: ShoppingCartView().navigationBarBackButtonHidden(false)) {
                                    Text("Shopping Cart")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.blue)
                                        .cornerRadius(8)
                                    
                                }
                                .frame(alignment: .center)
                            }
                            Spacer()
                        }
                        .clipped()
                        .cornerRadius(10)
                        .listStyle(.insetGrouped)
                        .padding(.horizontal, 16)
                    }
                    .background(Color.green)
                }
                
            }
        }
    }
}

struct MealList: View {
    let dayOfWeek: String
    @State private var meals = [Meal]()
    
    var body: some View {
            VStack(alignment: .leading) {
                if shoppingCart.filter { $0.dayOfWeek == dayOfWeek }.isEmpty {
                    Text("No meals")
                        .font(.title3)
                        .foregroundColor(.secondary)
                } else {
                    ForEach(shoppingCart.filter { $0.dayOfWeek == dayOfWeek }, id: \.title) { meal in
                        Text(meal.title)
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                }

                HStack{
                    Spacer()
                        .frame(alignment: .trailing)
                    NavigationLink(destination: CategoriesView().navigationBarBackButtonHidden(false)) {
                        Text("Add a Meal")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    
                }
                .listRowBackground(Color.clear)
            }
            .padding(.vertical, 8)
            .simultaneousGesture(TapGesture().onEnded{
                print(dayOfWeek)
                currentDay = dayOfWeek
            })
        }
}

struct AddMealView: View {
    var body: some View {
        Text("Add Meal View")
            .navigationTitle("Add a Meal")
    }
}

struct MealPlanningView_Previews: PreviewProvider {
    static var previews: some View {
        MealPlanningView()
    }
}
