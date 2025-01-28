//
//  FinalExamBrunoIOSApp.swift
//  FinalExamBrunoIOS
//
//  Created by english on 2024-12-10.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FinalExamBrunoIOSApp: App {
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
        }
    }
}
