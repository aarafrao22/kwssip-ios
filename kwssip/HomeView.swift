//
//  HomeView.swift
//  kwssip
//
//  Created by Rao Aaraf Younus on 2024-07-01.
//

import SwiftUI

struct HomeView: View {
    @State private var isSheetPresented = false
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented: Bool = false
    
    var body: some View {
        
        
        VStack{
            Spacer()

            Text("Welcome,")
                .foregroundColor(Color(hex: "#21637D")).bold()
            
            Text("Ahmed").font(.title)             .foregroundColor(Color(hex: "#3EB3E0")).bold()

            Spacer()
            VStack{
                HStack{
                    ImageCardView(selectedImage:selectedImage)
                    ImageCardView(selectedImage:selectedImage)
                }
                HStack{
                    ImageCardView(selectedImage:selectedImage)
                    ImageCardView(selectedImage:selectedImage)
                    ImageCardView(selectedImage:selectedImage)
                }
            }.padding(28)
            
//            Spacer()
            Button(action: {
                        // Action to perform when the button is pressed
                
                isImagePickerPresented=true
                        //TODO
                        clickPictures()
                    }) {
                        Text("Take Pictures of Work Site")
                            .padding()
                            .background(Color(hex:"#007B9A"))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
            Spacer()
            HStack{
                CardViewInd(index:"1")
                CardViewInd(index:"2")
                CardViewInd(index:"3")
                CardViewInd(index:"4")
                CardViewInd(index:"5")

                
            }
            
            Spacer()

            
            
            VStack {
                        Button(action: {
                            isSheetPresented.toggle()
                        }) {
                            Text("Upload Images")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(hex:"#007B9A"))
                                .foregroundColor(.white)
                                .cornerRadius(30)
                        }
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        BottomSheetView()
                            .presentationDetents([.medium, .large])
                    }
                    .padding()
            
            Spacer()


        }.background(
            Image("kw")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped().opacity(0.1)
            
        ).sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isImagePickerPresented)
        }
        
        
    }
    
    func clickPictures(){
        isImagePickerPresented = true
        print("isImagePickerPresented \(isImagePickerPresented)")

    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8 * 17) & 0xF, (int >> 4 * 17) & 0xF, int & 0xF * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ImageCardView: View {
    var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            Image(systemName: "photo")
        }
        .frame(width: 100, height: 100)
        .background(Color(white: 0.94)) // equivalent to #f0f0f0
        .cornerRadius(10)
    }
}

struct ImageCard: View {
    var path:String
    var body: some View {
        VStack {
            Image(path)
        }
        .frame(width: 60, height: 60)
        .clipped()
        .blendMode(.multiply)
//        .background(Color(white: 0.94)) // equivalent to #f0f0f0
        .cornerRadius(40)
    }
}


struct BottomSheetView: View {
    @State private var name: String = ""

    var body: some View {
        VStack {
            Spacer()
            Text("Give Ahmed a Rating!")
                .font(.title3)
                .padding()
                .foregroundColor(Color(.white)).bold()

//            Divider()
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

                        print("Button pressed")
                
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

    }
}


struct CardViewInd: View {
    var index: String

    var body: some View {
        VStack {
            Text(index)
                .font(.headline)
                .foregroundColor(.black)
        }
        .frame(width: 40, height: 40)
        .background(Color(white: 0.94)) // equivalent to #f0f0f0
        .cornerRadius(50)
    }
}

#Preview {
    HomeView()
}
