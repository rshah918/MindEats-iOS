//
//  MealPlanView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/27/23.
//

import SwiftUI
import MobileCoreServices

struct MealPlanView: View {        
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Text("Shopping Cart:")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                VStack {
                    List {
                        ForEach(shoppingCart, id: \.id) { meal in
                            ZStack {
                                Color.green // Add a background color to the ZStack
                                Text(meal.title)
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal, 10)
                                    .font(.caption)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                            }
                            .cornerRadius(16)
                        }
                        .onDelete(perform: deleteItem) // Add the onDelete modifier to the ForEach view
                    }
                    .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)) // Add insets to the list rows to create spacing
                    .background(Color.white)
                    .cornerRadius(16)
                }
            }
        }
    }
    func deleteItem(at offsets: IndexSet) {
        shoppingCart.remove(atOffsets: offsets)
    }
}

struct MealPlanView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView(selectedIngredient: Binding.constant("fish"))
    }
}
