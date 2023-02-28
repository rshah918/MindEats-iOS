//
//  MealDetailView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/22/23.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    @State private var selectedTab = 0
    @State private var cartCount = shoppingCart.count

    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Display the meal name and image
                    Text(meal.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .lineLimit(3)
                        .minimumScaleFactor(0.4)
                    
                    ZStack {
                        Color.white
                        VStack(spacing: 20) {
                            HStack(alignment: .center){
                                AsyncImage(url: URL(string: meal.image)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width - 62, height: 200)
                                        .clipped()
                                        .cornerRadius(16)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: UIScreen.main.bounds.width - 62, height: 200)
                                }
                            }
                            
                            // Display either the list of ingredients or the recipe,
                            // depending on which tab is selected
                            Picker("", selection: $selectedTab) {
                                Text("Ingredients").tag(0)
                                Text("Recipe").tag(1)
                                Text("Health Facts").tag(2)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            

                            
                            if selectedTab == 0 {
                                // Display the list of ingredients
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Ingredients:")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    ForEach(meal.ingredients, id: \.self) { ingredient in
                                        Text("\u{2022} " + ingredient)
                                            .font(.body)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                            }
                            
                            else if selectedTab == 1{
                                // Display the recipe
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Recipe:")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    ForEach(meal.instructionsList, id: \.self) { instruction in
                                        Text(instruction)
                                            .font(.body)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                            }
                            else{
                                // Display the list of nutrients
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Nutrition Facts:")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    ForEach(meal.nutrients, id: \.self) { nutrient in
                                        Text("\u{2022} " + nutrient)
                                            .font(.body)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                            }
                                
                            HStack(alignment: .center) {
                                NavigationLink(destination: MealPlanView()) {
                                    Text("Add to Cart (\(cartCount))")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .frame(width: 220, height: 40)
                                        .background(Color.green)
                                        .cornerRadius(15)
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    shoppingCart.append(meal)
                                    cartCount = shoppingCart.count // Update the cart count when the shoppingCart array is modified
                                })
                            }
                        }
                        .background(Color.white)
                        .padding()
                        .ignoresSafeArea()
                    }
                    .cornerRadius(16)
                    }
            }
            .cornerRadius(20)
            .padding()
        }
    }
}

struct Previews_MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
