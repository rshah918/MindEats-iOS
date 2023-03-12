//
//  NavBarView.swift
//  MindEats
//
//  Created by Rahul Shah on 3/12/23.
//

import SwiftUI

struct NavBarView: View {
    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                HStack{
                    NavigationLink( destination:HomeView().navigationBarBackButtonHidden(true)){
                        VStack{
                            Image(systemName: "house.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.black)
                            Text("Home")
                                .font(.title3)
                                .foregroundColor(Color.gray)
                            
                        }
                    }
                    Spacer()
                    NavigationLink( destination:MealPlanningView().navigationBarBackButtonHidden(false)){
                        VStack{
                            Image(systemName: "calendar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.black)
                            Text("Meal Plan")
                                .font(.title3)
                                .foregroundColor(Color.gray)
                            
                        }
                    }
                    Spacer()
                    NavigationLink( destination:CategoriesView().navigationBarBackButtonHidden(false)){
                        VStack{
                            Image( "leaf.png")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            
                            Text("Categories")
                                .font(.title3)
                                .foregroundColor(Color.gray)
                        }
                    }
                    Spacer()
                    NavigationLink( destination:ShoppingCartView().navigationBarBackButtonHidden(false)){
                        VStack{
                            Image(systemName: "cart.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.black)
                            Text("Cart")
                                .font(.title3)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.85)
            }
            
            .padding(10)
            .padding(.bottom, 10)
            .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .bottom)
            .background(Color.white)
            .cornerRadius(15)
        }
        .zIndex(1)
        .ignoresSafeArea()
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}
