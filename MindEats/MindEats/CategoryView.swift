//
//  FocusView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/14/23.
//

import SwiftUI

struct CategoryView: View {
    let category: Category
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @State var selectedIngredient = ""
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
                
                Text("You Selected: \(category.category)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 3)
                
                Text("Select your main ingredient:")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
               
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(category.ingredients, id: \.name) { ingredient in
                            NavigationLink(destination: MealListView(selectedIngredient: $selectedIngredient).onAppear {
                                selectedIngredient = ingredient.name
                            }) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 150, height: 150)
                                        .foregroundColor(.white)
                                        .cornerRadius(15.0)
                                    VStack{
                                        Image(ingredient.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .scaledToFit()
                                            .foregroundColor(.white)
                                            .cornerRadius(15.0)
                                        
                                        Text(ingredient.name)
                                            .font(.title2)
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


//struct FocusView_Previews: PreviewProvider {
//    static var previews: some View {
//        FocusView()
//    }
//}
