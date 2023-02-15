//
//  CategoriesView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/14/23.
//

import SwiftUI

struct CategoryView: View {
    let categories: [Category]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
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
                            ZStack {
                                Rectangle()
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.white)
                                    .cornerRadius(15.0)
                                VStack{
                                    Image(category.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.white)
                                        .cornerRadius(15.0)
                                    
                                    Text(category.category)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                }
            }
        }
        }
    }
struct Category: Decodable {
    let category: String
    let image: String
}

struct CategoriesView: View {
    @State var categories: [Category] = []
    
    var body: some View {
        CategoryView(categories: categories)
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

