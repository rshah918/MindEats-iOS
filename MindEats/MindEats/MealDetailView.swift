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
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Display the meal name and image
                    Text(meal.title)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                    
                    ZStack {
                        Color.white
                        VStack(spacing: 20) {
                            HStack(alignment: .center){
                                let imageUrls = ["fish.png", "knuckle-sandwhich.png", "cheeto.jpeg", "broccoli.png", "varun.JPG"]
                                let imageUrl = imageUrls.randomElement() ?? "broccoli.png"
                                Image(imageUrl)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.7)
                                    .cornerRadius(10)
                                    .padding(.bottom, 20)
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
                                        Text("- " + ingredient)
                                            .font(.body)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                            } else {
                                // Display the recipe
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Recipe:")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    Text(meal.instructions)
                                        .font(.body)
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                }
                            }
                            HStack(alignment: .center){
                                Button("Add to Cart") {}
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .frame(width: 220, height: 40)
                                    .background(Color.green)
                                    .cornerRadius(15)
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
