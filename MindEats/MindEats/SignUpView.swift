//
//  SignUpView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/21/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @Binding var isLoggedIn: Bool
    @Binding var selection: Int
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            VStack{
                VStack{
                    
                    Image("AppIcon.png")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .cornerRadius(15.0)
                    
                    Text("Welcome to MindEats")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                    
                    Text("First Name:")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("First Name", text: $firstName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .colorScheme(.light)
                    
                    Text("Last Name:")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .colorScheme(.light)
                    
                    Text("Phone Number:")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Phone Number", text: $phoneNumber)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .colorScheme(.light)
                }
                VStack{
                    Text("Email:")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .colorScheme(.light)
                    
                    Text("Password:")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .colorScheme(.light)
                    
                    NavigationLink(destination: HomeView(firstName: $firstName, lastName: $lastName, selection: $selection)) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.green)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.white)
                            .cornerRadius(15.0)
                    }
                }
            }
            
        }
        .background(Color.green
        .edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        .padding()
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
