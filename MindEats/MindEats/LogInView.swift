//
//  LogInView.swift
//  MindEats
//
//  Created by Rahul Shah on 2/14/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var isLoggedIn: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Image("AppIcon.png")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .cornerRadius(15.0)

                Text("Login")
                    .font(.largeTitle)
                    .padding()
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .colorScheme(.light)
                    
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .colorScheme(.light)
                
                Button(action: {
                    isLoggedIn.toggle()
                    // Handle login button press
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.white)
                        .cornerRadius(15.0)
                }
                Spacer()
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.white)
                    NavigationLink(destination: SignUpView(isLoggedIn: $isLoggedIn)) {
                        VStack{
                            Text("Sign up")
                                .foregroundColor(.white)
                                .underline()
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
