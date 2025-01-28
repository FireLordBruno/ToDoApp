import FirebaseFirestore
import SwiftUI

class TaskListModel: ObservableObject {
    @Published var items: [Data] = [] {
        didSet {
            saveItems() // Save tasks locally after updating
        }
    }
    
    let itemsKeys: String = "items_list"
    
    init() {
        getItems()
        fetchTasks() // Fetch tasks from Firestore when initializing
    }
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKeys)
        }
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKeys) else {
            return
        }
        
        guard let saveItems = try? JSONDecoder().decode([Data].self, from: data) else {
            return
        }
        
        self.items = saveItems
    }
    
    func addItem(inputText: String) {
        // Create the task data object
        let newTask = Data(id: UUID().uuidString, inputText: inputText, timestamp: Date())
        
        // Save to Firestore
        let db = Firestore.firestore()
        db.collection("tasks").addDocument(data: [
            "id": newTask.id,
            "inputText": newTask.inputText,
            "timestamp": newTask.timestamp
        ]) { error in
            if let error = error {
                print("Error adding task: \(error.localizedDescription)")
            } else {
                // If successfully added to Firestore, append it to local list
                self.items.append(newTask)
            }
        }
    }
    
    func fetchTasks() {
        let db = Firestore.firestore()
        db.collection("tasks").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching tasks: \(error.localizedDescription)")
            } else {
                let tasks = snapshot?.documents.compactMap { document -> Data? in
                    try? document.data(as: Data.self) // Decode the document into Data object
                }
                self.items = tasks ?? [] // Update the local items array with the fetched tasks
            }
        }
    }
    
    func update(item: Data) {
        // Update Firestore (not implemented yet)
    }
    
    func deleteItem(indexSet: IndexSet) {
        // Delete Firestore data (not implemented yet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        // Move Firestore data (not implemented yet)
    }
}
