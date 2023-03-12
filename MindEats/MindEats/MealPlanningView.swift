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
                NavBarView()
                NavigationView {
                    ScrollView {
                        Text("Meal Planning")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.top, 15)
                        
                        Text("Select a day of the week:")
                            .font(.headline)
                            .padding(.top, 5)
                        
                        // List of expandable sections for each day of the week
                        VStack {
                            ZStack{
                                Color(.systemGray5)
                                VStack{
                                    ForEach(daysOfWeek, id: \.self) { day in
                                        ZStack{
                                            Color.white
                                            VStack(alignment:.leading){
                                                Section(header: Text(day).fontWeight(.semibold)) {
                                                    MealList(dayOfWeek: day)
                                                }
                                                .padding(5)
                                            }
                                        }
                                        .cornerRadius(10)
                                    }
                                }
                                .padding()
                            }
                            .cornerRadius(10)
                            
                            HStack{
                    
                                
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
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
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
                        Text("\u{2022} " + meal.title)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Divider()
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
