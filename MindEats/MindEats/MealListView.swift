//
//  MealListView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/21/23.
//

import SwiftUI
import Combine

struct Meal: Codable {
    let name: String
    let description: String
    let price: Double
    let imageName: String
    let ingredients: [String]
    let recipe: String
}

class MealLoader: ObservableObject {
    @Published var meals: [Meal] = []
    var totalMealCount = 0
    private var offset = 0
    
    func loadMeals(offset: Int) {
        guard let url = Bundle.main.url(forResource: "meals", withExtension: "json") else {
            fatalError("Unable to find meals.json")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let loadedMeals = try decoder.decode([Meal].self, from: data)
            
            DispatchQueue.main.async {
                if offset == 0 {
                    self.meals = loadedMeals
                } else {
                    self.meals.append(contentsOf: loadedMeals)
                }
                
                self.offset = self.meals.count
                self.totalMealCount += self.meals.count
            }
        } catch {
            fatalError("Unable to decode meals.json")
        }
    }
}


struct MealRow: View {
    let meal: Meal
    
    var body: some View {
        NavigationLink(destination: MealDetailView(meal: meal)){
            VStack(alignment: .leading) {
                Image(meal.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 62, height: 200)
                    .clipped()
                    .cornerRadius(16)
                
                Text(meal.name)
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .padding(.top, 8)
                
                Text(meal.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 4)
                
                Spacer()
                
                HStack {
                    Text("$\(meal.price, specifier: "%.2f")")
                        .font(.headline)
                    Spacer()
                    Text("Prep Time: 10 minutes")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
                .frame(width: UIScreen.main.bounds.width - 62)

            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 5)
        }
    }
}

struct MealListView: View {
    @StateObject var mealLoader = MealLoader()
    @State private var reachedEnd = false
    @Binding var selectedIngredient: String
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
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
                    ForEach(mealLoader.meals, id: \.name) { meal in
                        MealRow(meal: meal)
                            .frame(width: UIScreen.main.bounds.width - 60, height: UIScreen.main.bounds.width - 60)
                            .padding(.bottom, 20)
                           
                    }
                    
                    if mealLoader.meals.isEmpty {
                        ProgressView()
                            .padding(.vertical, 32)
                    } else if !reachedEnd {
                        ProgressView()
                            .padding(.vertical, 32)
                            .onAppear {
                                mealLoader.loadMeals(offset: mealLoader.meals.count)
                            }
                    }
                }
            }
            .background(Color.green)
            .onAppear {
                mealLoader.loadMeals(offset: 0)
            }
            .onChange(of: mealLoader.meals.count) { newValue in
                if newValue == mealLoader.totalMealCount {
                    reachedEnd = true
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
