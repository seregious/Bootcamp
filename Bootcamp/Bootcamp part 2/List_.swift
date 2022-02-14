//
//  List_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 13.02.2022.
//

import SwiftUI

struct List_: View {
    
    @State var fruits = ["apple", "orange", "banana", "peach"]
    @State var veggies = ["tomato", "potato", "carrot"]
    
    var body: some View {
        NavigationView {
            List {
                sectionType(name: "Fruits", type: &fruits)

                
                
                sectionType(name: "Veggies", type: &veggies)
                
            }
            
            .navigationTitle("Grossery list")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    addButton
                }
            }
            .listStyle(SidebarListStyle())
        }
        .accentColor(.purple)
    }
    
    var addButton : some View {
        Button("Add") {
            add()
        }
    }
    
    @ViewBuilder func sectionType (name: String, type: inout [String]) -> some View {
        Section(header: Text(name)) {
            ForEach(type, id: \.self) {type in
                Text(type.capitalized)
                    
                    .foregroundColor(.white)
            }
            .onDelete (perform: delete)
            .onMove(perform: move)
            .listRowBackground(Color.purple)
        }
    }
    
    func delete(IndexSet: IndexSet) {
        fruits.remove(atOffsets: IndexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func add() {
        fruits.append("Coconout")
    }
}

struct List__Previews: PreviewProvider {
    static var previews: some View {
        List_()
    }
}
