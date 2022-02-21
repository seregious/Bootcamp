//
//  CoreData.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 20.02.2022.
//

import SwiftUI
import CoreData

//UI
//Model - data point
//ViewModel - manages the data for a view

class CoreDataViewModel : ObservableObject {
    
    let container : NSPersistentContainer
    @Published var savedEntities : [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { discription, error in
            if let error = error {
                print("Error loading core data: \(error)")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching \(error)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func saveData() {
        do{
        try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving \(error)")
        }
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
        
        
        }
    
    func updateFruit(entity: FruitEntity) {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
}

struct CoreData: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State var text = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add fruit here", text: $text)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color(hue: 0.5, saturation: 0.0, brightness: 0.804))
                    .cornerRadius(25)
                    .padding(.horizontal)
                    
                
                Button {
                    guard !text.isEmpty else {return}
                    vm.addFruit(text: text)
                    text = ""
                } label: {
                     Text("button")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                        .cornerRadius(25)
                        .padding(.horizontal)
                    
                }
                
                List{
                    ForEach(vm.savedEntities) {entity in
                        Text(entity.name ?? "No name")
                            .onTapGesture {
                                vm.updateFruit(entity: entity)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                
                Spacer()

            }
            .navigationTitle("Fruits")
        }
    }
}

struct CoreData_Previews: PreviewProvider {
    
    @StateObject var vm = CoreDataViewModel()
    
    static var previews: some View {
        CoreData()
    }
}
