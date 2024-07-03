//
//  kwssipApp.swift
//  kwssip
//
//  Created by Rao Aaraf Younus on 2024-06-30.
//

import SwiftUI

@main
struct kwssipApp: App {
    @State private var showContentView = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showContentView {
                    ContentView()
                } else {
                    SplashView()
                        .opacity(1)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    showContentView = true
                                }
                            }
                        }
                }
            }
        }
    }
}
