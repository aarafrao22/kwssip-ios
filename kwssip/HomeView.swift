//
//  HomeView.swift
//  kwssip
//
//  Created by Rao Aaraf Younus on 2024-07-01.
//

import SwiftUI

struct HomeView: View {
    @State private var isSheetPresented = false
    
    @State private var imageIndex :Int = 0
    
    @State private var image1: UIImage?
    @State private var image2: UIImage?
    @State private var image3: UIImage?
    @State private var image4: UIImage?
    @State private var image5: UIImage?
    
    @State private var isImagePickerPresented1 = false
    @State private var isImagePickerPresented2 = false
    @State private var isImagePickerPresented3 = false
    @State private var isImagePickerPresented4 = false
    @State private var isImagePickerPresented5 = false
    
    var body: some View {
        
        
        VStack{
            Spacer()
            
            Text("Welcome,")
                .foregroundColor(Color(hex: "#21637D")).bold()
            
            Text("Ahmed").font(.title)
                .foregroundColor(Color(hex: "#43a5e4")).bold()
            
            Spacer()
            VStack(spacing:12){
                HStack(spacing:12){
                    ImageCardView(selectedImage:image1).onTapGesture {
                        isImagePickerPresented1 = true
                        imageIndex=imageIndex+1
                    }
                    ImageCardView(selectedImage:image2).onTapGesture {
                        isImagePickerPresented2 = true
                        imageIndex=imageIndex+1
                    }
                }
                HStack(spacing:12){
                    ImageCardView(selectedImage:image3).onTapGesture {
                        isImagePickerPresented3 = true
                        imageIndex=imageIndex+1
                    }
                    ImageCardView(selectedImage:image4).onTapGesture {
                        isImagePickerPresented4 = true
                        imageIndex=imageIndex+1

                        
                    }
                    ImageCardView(selectedImage:image5).onTapGesture {
                        isImagePickerPresented5 = true
                        imageIndex=imageIndex+1

                    }
                }
            }.padding(28)
            
            Spacer()
            HStack{
                switch imageIndex{
                    case 1:
                        CardViewInd(index:"1",isTrue:true)
                        CardViewInd(index:"2",isTrue:false)
                        CardViewInd(index:"3",isTrue:false)
                        CardViewInd(index:"4",isTrue:false)
                        CardViewInd(index:"5",isTrue:false)
                    case 2:
                        CardViewInd(index:"1",isTrue:true)
                        CardViewInd(index:"2",isTrue:true)
                        CardViewInd(index:"3",isTrue:false)
                        CardViewInd(index:"4",isTrue:false)
                        CardViewInd(index:"5",isTrue:false)
                        
                    case 3:
                        CardViewInd(index:"1",isTrue:true)
                        CardViewInd(index:"2",isTrue:true)
                        CardViewInd(index:"3",isTrue:true)
                        CardViewInd(index:"4",isTrue:false)
                        CardViewInd(index:"5",isTrue:false)
                        
                    case 4:
                        CardViewInd(index:"1",isTrue:true)
                        CardViewInd(index:"2",isTrue:true)
                        CardViewInd(index:"3",isTrue:true)
                        CardViewInd(index:"4",isTrue:true)
                        CardViewInd(index:"5",isTrue:false)
                    case 5:
                        CardViewInd(index:"1",isTrue:true)
                        CardViewInd(index:"2",isTrue:true)
                        CardViewInd(index:"3",isTrue:true)
                        CardViewInd(index:"4",isTrue:true)
                        CardViewInd(index:"5",isTrue:true)
                        
                    default:
                        CardViewInd(index:"1",isTrue:false)
                        CardViewInd(index:"2",isTrue:false)
                        CardViewInd(index:"3",isTrue:false)
                        CardViewInd(index:"4",isTrue:false)
                        CardViewInd(index:"5",isTrue:false)
                    
                }
                
                
            }
            
            Spacer()
            VStack {
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    
                    if (imageIndex==5){
                        
                        Text("Upload Images")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(hex:"#007B9A"))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
                    
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                BottomSheetView()
                    .presentationDetents([.medium, .large])
            }
            .padding()
            
            Spacer()
            
            
        } .sheet(isPresented: $isImagePickerPresented1) {
            ImagePicker(selectedImage: $image1, isPresented: $isImagePickerPresented1)
        }
        .sheet(isPresented: $isImagePickerPresented2) {
            ImagePicker(selectedImage: $image2, isPresented: $isImagePickerPresented2)
        }
        .sheet(isPresented: $isImagePickerPresented3) {
            ImagePicker(selectedImage: $image3, isPresented: $isImagePickerPresented3)
        }
        .sheet(isPresented: $isImagePickerPresented4) {
            ImagePicker(selectedImage: $image4, isPresented: $isImagePickerPresented4)
        }
        .sheet(isPresented: $isImagePickerPresented5) {
            ImagePicker(selectedImage: $image5, isPresented: $isImagePickerPresented5)
        }
        
        
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
        VStack (){
            if let selectedImage = selectedImage {
                
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .padding()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
            }
        }
        .background(Color(white: 0.94)) // equivalent to #f0f0f0
        .cornerRadius(12)
        
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
        .cornerRadius(40)
    }
}

struct CardViewInd: View {
    var index: String
    var isTrue: Bool
    
    var body: some View {
        
        if isTrue{
            VStack {
                Text(index)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(width: 40, height: 40)
            .background(Color(hex:"#21637D")) // equivalent to #f0f0f0
            .cornerRadius(50)
        }else{
            VStack {
                Text(index)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .frame(width: 40, height: 40)
            .background(Color(white: 0.94)) // equivalent to #f0f0f0
            .cornerRadius(50)
        }
    }
}

#Preview {
    HomeView()
}
