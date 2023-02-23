//
//  MealDetailView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/22/23.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Display the meal name and image
                Text(meal.name)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                
                Image(meal.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                
                // Display the list of ingredients
                Text("Ingredients:")
                    .font(.headline)
                
                ForEach(meal.ingredients, id: \.self) { ingredient in
                    Text("- " + ingredient)
                        .padding(.leading, 20)
                }
                
                // Display the recipe
                Text("Recipe:")
                    .font(.headline)
                
                Text(meal.recipe)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
            }
            .padding()
        }
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .padding()
    }
}
