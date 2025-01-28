//
//  TaskListView.swift
//  FinalExamBrunoIOS
//
//  Created by english on 2024-12-10.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var TasklistModel: TaskListModel
    
    var body: some View {
        ZStack {
            if TasklistModel.items.isEmpty {
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(TasklistModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.easeOut(duration: 1.1)) {
                                    // Update item when tapped
                                    TasklistModel.update(item: item)
                                }
                            }
                    }
                    .onDelete(perform: TasklistModel.deleteItem)
                    .onMove(perform: TasklistModel.moveItem)
                }
            }
        }
        .navigationTitle("Todo List 🖌")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
            .environmentObject(TaskListModel())
    }
}
