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
                            GeometryReader { geometry in
                                Text(meal.title)
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal, 10)
                                    .font(.caption)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .background(Color.green)
                                    .cornerRadius(16)
                            }
                            .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                        }
                        .onDelete(perform: deleteItem) // Add the onDelete modifier to the ForEach view
                    }
                    .cornerRadius(16)
                }
                .frame(width: UIScreen.main.bounds.width * 0.95)
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
