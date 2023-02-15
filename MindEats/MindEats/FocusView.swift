//
//  FocusView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/14/23.
//

import SwiftUI

struct FocusView: View {
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            VStack{
                Image("AppIcon.png")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .cornerRadius(15.0)
                
                Text("You Selected: Focus")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Text("Select your main ingredient:")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
               
                HStack{
                    NavigationLink(destination: FocusView()){
                        ZStack{
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .foregroundColor(.white)
                                .cornerRadius(15.0)
                            VStack{
                                Image("fish.png")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .cornerRadius(15.0)
                                
                                Text("Fish")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
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
                            Image("broccoli.png")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .cornerRadius(15.0)
                            
                            Text("Broccoli")
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
    }
}

struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        FocusView()
    }
}
