//
//  BottomSheetView.swift
//  kwssip
//
//  Created by Rao Aaraf Younus on 2024-07-02.
//

import SwiftUI

struct BottomSheetView: View {
    @State private var name: String = ""
    @State private var isAlertShowing: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Give Ahmed a Rating!")
                .font(.title3)
                .padding()
                .foregroundColor(Color(.white)).bold()
            Spacer()
            HStack{
                ImageCard(path:"img1")
                ImageCard(path:"img2")
                ImageCard(path:"img3")
                ImageCard(path:"img4")
                ImageCard(path:"img5")
            }
            Spacer()
            Text("Leave a comment*")
                .font(.title3)
                .padding()
                .foregroundColor(Color(.white)).bold()
            Spacer()
            TextField("Enter your name", text: $name)
                .padding()
                .frame(height: 5 * 24)
                .foregroundColor(Color(hex: "#ffffff"))
                .background(Color(hex: "#ffffff"))
                .cornerRadius(22)
            
            Spacer()
            
            Button(action: {
                // Action to perform when the button pressed
                
                uploadImages()
            }) {
                Text("Upload")
                    .padding()
                    .background(Color(hex:"#007B9A"))
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            Spacer()
        }.padding(18)
            .background(Color(hex:"#3EB3E0"))
            .alert(isPresented: $isAlertShowing) {
                
                Alert(title: Text("Uploaded Successfully"),
                      message: Text("Thanks For Uplaoding Images\nAhmed"),
                      dismissButton: .default(Text("OK")))
                
            }
        
    }
    
    func uploadImages(){
        print("Uploaded Successfully")
        isAlertShowing = true
        
        
    }
}
