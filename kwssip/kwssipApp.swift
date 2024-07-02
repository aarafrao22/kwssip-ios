//
//  kwssipApp.swift
//  kwssip
//
//  Created by Rao Aaraf Younus on 2024-06-30.
//

import SwiftUI

@main
struct kwssipApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                    
                }
            }.overlay(SplashView().opacity(1))
        }
    }
}
