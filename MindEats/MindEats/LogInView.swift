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
                Image("leaf.png")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .foregroundColor(.clear)
                    .cornerRadius(15.0)


                Text("Log In")
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
                NavigationLink(destination: HomeView(firstName: Binding.constant(""), lastName: Binding.constant(""))
                    .navigationBarBackButtonHidden(true)
                    .onAppear{isLoggedIn.toggle()}) {
                    Text("Log In")
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
