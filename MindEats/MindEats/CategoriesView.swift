//
//  CategoriesView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/14/23.
//
import SwiftUI

struct Category: Decodable {
    let category: String
    let image: String
    let ingredients: [Ingredient]
}

struct Ingredient: Decodable {
    let name: String
    let image: String
}
struct CategoriesView: View {
    @State var categories: [Category] = []
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        
        NavigationView {
 
            ScrollView {
                VStack{
                    Image("AppIcon.png")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .cornerRadius(15.0)
                    
                    Text("Welcome to MindEats!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text("Current Categories")
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(categories, id: \.category) { category in
                            NavigationLink(destination: FocusView(category: category)) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 150, height: 150)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    VStack(spacing: 10) {
                                        Image(category.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                        Text(category.category)
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
                .padding(.horizontal)
            }.background(Color.green)
        }
        .onAppear {
            if let fileURL = Bundle.main.url(forResource: "categories", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: fileURL)
                    categories = try JSONDecoder().decode([Category].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}


struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}

