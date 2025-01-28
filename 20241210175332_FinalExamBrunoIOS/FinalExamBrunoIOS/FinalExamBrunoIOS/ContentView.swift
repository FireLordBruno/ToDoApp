//
//  ContentView.swift
//  FinalExamBrunoIOS
//
//  Created by english on 2024-12-10.
//

import SwiftUI
import FirebaseFirestore


struct ContentView: View {
    @StateObject var taskListModel = TaskListModel()
    var body: some View {
        NavigationView {
            TabView {
                AddView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .environmentObject(taskListModel)
                
                TaskListView()
                    .tabItem {
                        Label("Tasks", systemImage: "list.bullet.clipboard")
                    }
                    .environmentObject(taskListModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskListModel()) // Inject the TaskListModel for preview
    }
}
