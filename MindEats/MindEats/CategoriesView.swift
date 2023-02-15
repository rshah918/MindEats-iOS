//
//  CategoriesView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/14/23.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        ZStack{
           Color.green.ignoresSafeArea()
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
                HStack{
                    NavigationLink(destination: FocusView()){
                        ZStack{
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .foregroundColor(.white)
                                .cornerRadius(15.0)
                            VStack{
                                Image("focus.png")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .cornerRadius(15.0)
                                
                                Text("Focus")
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(width: 30)
                    ZStack{
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.white)
                            .cornerRadius(15.0)
                        VStack{
                            Image("anti-stress.png")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .cornerRadius(15.0)
                            
                            Text("Anti Stress")
                                .fontWeight(.bold)
                        }
                    }
                    
                }
                Spacer()
                    .frame(height:20)
                HStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.white)
                            .cornerRadius(15.0)
                        VStack{
                            Image("energy.png")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .cornerRadius(15.0)
                            
                            Text("Energy")
                                .fontWeight(.bold)
                        }
                    }
                    
                    Spacer()
                        .frame(width: 30)
                    ZStack{
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.white)
                            .cornerRadius(15.0)
                        VStack{
                            Image("mood-lifting.png")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .cornerRadius(15.0)
                            
                            Text("Mood Lifting")
                                .fontWeight(.bold)
                        }
                    }
                }
                Spacer()
                .frame(height:20)
                HStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.white)
                            .cornerRadius(15.0)
                        VStack{
                            Image("immunity.png")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .cornerRadius(15.0)
                            
                            Text("Immunity")
                                .fontWeight(.bold)
                        }
                    }
                    Spacer()
                        .frame(width: 30)
                    ZStack{
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.clear)
                            .cornerRadius(15.0)
                        VStack{
                            Image("")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .cornerRadius(15.0)
                            
                            Text("")
                                .fontWeight(.bold)
                        }
                    }
                    
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
