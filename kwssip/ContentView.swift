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
    
    var body: some View {
        VStack {
            
            Image("kwssip").resizable().aspectRatio(contentMode: .fit).frame(width: 120.0, height: 120.0)

//            Text("Login to Continue")
            
            TextField("Username", text: $username)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(28.0)
                            .padding(.bottom, 20)
            TextField("Password", text: $username)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(28.0)
                            .padding(.bottom, 20)
            
            Button(action: {
                            // Perform login action here
                            if username.isEmpty || password.isEmpty {
                                showingAlert = true
                            } else {
                                // Proceed with login
                                print("Logging in...")
                            }
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
    }
}

#Preview {
    ContentView()
}
