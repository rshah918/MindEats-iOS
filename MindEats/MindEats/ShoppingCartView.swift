//
//  MealPlanView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/27/23.
//

import SwiftUI

struct ShoppingCartView: View {

    var body: some View {
        VStack {
            if shoppingCart.isEmpty {
                Text("Your cart is empty.")
                    .foregroundColor(.gray)
                    .font(.title)
                    .padding(.top, 50)
            } else {
                List {
                    ForEach(shoppingCart) { item in
                        CartItemRow(item: item)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
                .padding(.top, 20)
            }

            HStack {
                Text("Total:")
                    .font(.title2)
                    .fontWeight(.semibold)

                Spacer()

                Text("$\(34.97, specifier: "%.2f")")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 20)
            .background(Color.white)
            .foregroundColor(.black)

            if !shoppingCart.isEmpty {
                Button(action: placeOrder) {
                    Text("Place Order")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 220, height: 40)
                        .background(Color.green)
                        .cornerRadius(15)
                }
                .padding(.bottom, 20)
            }
        }
        .navigationBarTitle(" Shopping Cart")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white)
        .onAppear {
            UITableView.appearance().backgroundColor = UIColor.green
        }
    }

    func deleteItems(at offsets: IndexSet) {
        shoppingCart.remove(atOffsets: offsets)
    }

    func placeOrder() {
        // TODO: Implement order placing logic
    }
}

struct CartItemRow: View {
    let item: Meal
    @State private var showIngredients = false

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image(systemName: showIngredients ? "chevron.down.circle.fill" : "chevron.right.circle.fill")
                        .foregroundColor(.green)
                        .font(.body)
                VStack(alignment: .leading) {
                    Text(item.title)
                        .foregroundColor(.black)
                        .font(.body)
                        .lineLimit(3)

                    Text("\(item.count) x \(25.32, specifier: "%.2f")")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }

                Spacer()

                Text("$\(20.00, specifier: "%.2f")")
                    .fontWeight(.bold)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    showIngredients.toggle()
                }
            }
            
            if showIngredients {
                ForEach(item.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .padding(.leading, 30)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
        }
        .contextMenu {
            Button(action: {
                deleteItems(at: IndexSet(integer: 0))
            }) {
                Label("Delete", systemImage: "trash")
            }
        }
    }

    func deleteItems(at offsets: IndexSet) {
        // Call the parent function to handle deletion
    }
}

