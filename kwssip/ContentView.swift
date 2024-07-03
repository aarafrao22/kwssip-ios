//
//  ContentView.swift
//  kwssip
//
//  Created by Rao Aaraf Younus on 2024-06-30.
//

import SwiftUI

struct ContentView: View {
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertMessage: String = ""
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationStack {
            
            ZStack{
                VStack {
                    
                    VStack(spacing:0){
                        
                        Image("blue")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                        
                        Text("KWSSIP").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor((Color(hex: "#43a5e4")))
                        
                        Text("Karachi Water and Sewerage Services \nImprovement Project")
                            .font(.system(size: 9))
                            .foregroundColor(Color(hex: "#43a5e4"))
                            .multilineTextAlignment(.center)
                         
                    }.padding(.bottom,42)

                    TextField("Username", text: $emailAddress)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(28.0)
                        .padding(.bottom, 8)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(28.0)
                        .padding(.bottom, 28)
                    
                    Button(action: {
                        authenticateUser(emailAddress: emailAddress, password: password)
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background((Color(hex: "#43a5e4")))
                            .cornerRadius(28.0)
                    }
                }
                .padding()
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Authentication Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                
                .navigationDestination(isPresented: $isLoggedIn) {
                    HomeView()
                }
            }.background(Color(hex:"#ffffff"))

            
            
        }
    }
    
    func authenticateUser(emailAddress: String, password: String) {
        if emailAddress.isEmpty || password.isEmpty {
            alertMessage = "Please enter both username and password."
            showingAlert = true
        } else {
            // Perform actual authentication logic here
            if emailAddress.lowercased() == "testuser" && password.lowercased() == "password123" {
                print("Logging in...")
                isLoggedIn = true
                // Navigate
                // Proceed with login
            } else {
                alertMessage = "Invalid username or password."
                showingAlert = true
            }
        }
    }
}
#Preview {
    ContentView()
}
