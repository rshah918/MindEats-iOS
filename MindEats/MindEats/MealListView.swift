//
//  MealListView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/21/23.
//

import SwiftUI
import Combine


struct Meal: Codable, Identifiable{
    let id = UUID()
    let author: String
    let canonical_url: String
    let category: String
    let cuisine: String
    let host: String
    let image: String
    let ingredients: [String]
    let instructions: String
    let instructionsList: [String]
    let language: String
    let nutrients: [String]
    let site_name: String
    let title: String
    let totalTime: Int
    let yields: String
    var count: Int
    var dayOfWeek: String
    
    // Define instructions_list as an empty array by default
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        author = try container.decode(String.self, forKey: .author)
        canonical_url = try container.decodeIfPresent(String.self, forKey: .canonical_url) ?? ""
        category = try container.decodeIfPresent(String.self, forKey: .category) ?? ""
        cuisine = try container.decodeIfPresent(String.self, forKey: .cuisine) ?? ""
        host = try container.decodeIfPresent(String.self, forKey: .host) ?? ""
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? "fish.png"
        ingredients = try container.decodeIfPresent([String].self, forKey: .ingredients) ?? []
        instructions = try container.decodeIfPresent(String.self, forKey: .instructions) ?? ""
        instructionsList = try container.decodeIfPresent([String].self, forKey: .instructionsList) ?? ["empty"]
        count = try
        container.decodeIfPresent(Int.self, forKey: .count) ?? 1
        
        
        language = try container.decodeIfPresent(String.self, forKey: .language) ?? ""
        nutrients = try container.decodeIfPresent([String].self, forKey: .nutrients) ?? []
        site_name = try container.decodeIfPresent(String.self, forKey: .site_name) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        totalTime = try container.decodeIfPresent(Int.self, forKey: .totalTime)
        ?? 20
        yields = try container.decodeIfPresent(String.self, forKey: .yields)
        ?? ""
        dayOfWeek = try container.decodeIfPresent(String.self, forKey: .dayOfWeek)
        ?? currentDay
    }
}




class MealLoader: ObservableObject {
    @Published var meals: [Meal] = []
    var totalMealCount = 0
    private var offset = 0
    
    func loadMeals(offset: Int) {
        guard let url = Bundle.main.url(forResource: "meals-us-west-2", withExtension: "json") else {
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
            print(error)
        }
    }
}


struct MealRow: View {
    let meal: Meal
    @State private var duration: UInt64 = 0

    var body: some View {
        NavigationLink(destination: MealDetailView(meal: meal)){
            VStack(alignment: .leading) {
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
                
                Text(meal.title)
                    .font(.headline)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color.black)
                    .padding(.top, 8)
                    .lineLimit(2)
                    
                
                Text(meal.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 2)
                
                Text("Communication with US-West-2 (Oregon) data center in \(String(format: "%.4f", Double(duration) / 1_000_000_000)) seconds")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(3)
                    .onAppear {
                        guard let url = URL(string: meal.image) else {
                            print("Invalid URL: \(meal.image)")
                            return
                        }
                        
                        downloadDuration(for: url) { duration in
                            self.duration = duration
                        }
                    }
                
                Spacer()
                
                HStack {
                    Text("Prep Time: \(meal.totalTime) minutes")
                        .font(.headline)
                    Spacer()
                    NavigationLink(destination:
                                    MealDetailView(meal: meal)){
                        Text("View Meal")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 62)

            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 5)
        }
    }
    func downloadDuration(for url: URL, completion: @escaping (UInt64) -> Void) {
        let start = DispatchTime.now().uptimeNanoseconds
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data,
               let image = UIImage(data: data) {
                let end = DispatchTime.now()
                let duration = end.uptimeNanoseconds - start
                print("Image downloaded in \(duration) nanoseconds")
                completion(duration)
            } else if let error = error {
                print("Error: \(error)")
                completion(0)
            }
        }.resume()
    }


}


struct MealListView: View {
    @StateObject var mealLoader = MealLoader()
    @State private var reachedEnd = false
    @Binding var selectedIngredient: String
    var currentDay: String="Monday"
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
                    
                    Text("Select Your Meal:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 45)
                    ForEach(mealLoader.meals, id: \.title) { meal in
                        MealRow(meal: meal)
                            .frame(width: UIScreen.main.bounds.width - 60, height: UIScreen.main.bounds.width - 60)
                            .padding(.bottom, 80)
                           
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
