//
//  SplashView.swift
//  kwssip
//
//  Created by Rao Aaraf Younus on 2024-07-02.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Content
                VStack {
                    Image("white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140) // Adjust the image width according to the parent width
                    Text("KWSSIP")
                        .bold()
                        .font(.system(size: 38))
                        .foregroundColor(Color(hex: "#ffffff"))
                    
                    Text("Karachi Water and Sewerage Services \nImprovement Project")
                        .font(.system(size: 9))
                        .foregroundColor(Color(hex: "#ffffff"))
                        .multilineTextAlignment(.center)
                    

                }
                .padding(.top,200) // Optional: Add some padding at the bottom

                ZStack {
                    VStack() {
                        Text("POWERED BY")
                            .font(.system(size: 11))
                            .foregroundColor(.white)
                        
                        Text("iTecknologi")
                            .font(.system(size: 21))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top,240) // Optional: Add some padding at the bottom
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}



// Helper extension for hexadecimal color support

#Preview {
    SplashView()
}
