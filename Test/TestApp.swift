//
//  TestApp.swift
//  Test
//
//  Created by Ульяна Гритчина on 12.04.2022.
//

import SwiftUI

@main
struct TestApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                    Label("Home", systemImage: "house")
                }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            
        }
    }
}
