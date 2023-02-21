//
//  MealListView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/21/23.
//

import SwiftUI

struct Meal: Decodable {
    let meal: String
    let image: String
    let ingredients: [String]
}

struct MealListView: View {
    @Binding var selectedIngredient: String
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            ScrollView {
            VStack{
                Image("ME-color-logo.png")
                    .resizable()
                    .frame(width: 300, height: 90)
                    .foregroundColor(.white)
                    .cornerRadius(15.0)
                
                Text("You Selected: \(selectedIngredient)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Text("Select your Meal:")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
               
                    LazyVGrid(columns: columns, spacing: 20) {
                        
                            NavigationLink(destination: MealListView(selectedIngredient: $selectedIngredient)) {
                                VStack {
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 150, height: 150)
                                            .foregroundColor(.white)
                                            .cornerRadius(15.0)
                                        VStack{
                                            Image("knuckle-sandwhich.png")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .scaledToFit()
                                                .foregroundColor(.white)
                                                .cornerRadius(15.0)
                                            
                                            Text("Knuckle Sandwich")
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.black)
                                            
                                        }
                                    }
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 150, height: 150)
                                            .foregroundColor(.white)
                                            .cornerRadius(15.0)
                                        VStack{
                                            Image("varun.JPG")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .scaledToFit()
                                                .foregroundColor(.white)
                                                .cornerRadius(15.0)
                                            
                                            Text("Varun the Snacc")
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.black)
                                            
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        let selectedIngredient = "spinach"
        MealListView(selectedIngredient: Binding.constant(selectedIngredient))
    }
}
