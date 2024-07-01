//
//  ContentView.swift
//  kwssip
//
//  Created by Rao Aaraf Younus on 2024-06-30.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertMessage: String = ""
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Image("kwssip")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120.0, height: 120.0)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(28.0)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(28.0)
                    .padding(.bottom, 20)
                
                Button(action: {
                    authenticateUser(username: username, password: password)
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(28.0)
                }
            }
            .padding()
            .navigationTitle("Login")
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Authentication Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }
            
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username.isEmpty || password.isEmpty {
            alertMessage = "Please enter both username and password."
            showingAlert = true
        } else {
            // Perform actual authentication logic here
            if username.lowercased() == "testuser" && password.lowercased() == "password123" {
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
