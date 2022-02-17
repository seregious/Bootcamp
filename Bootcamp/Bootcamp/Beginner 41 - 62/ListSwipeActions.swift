//
//  ListSwipeActions.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 17.02.2022.
//

import SwiftUI

struct ListSwipeActions: View {
    
    @State var fruits = ["apple", "orange", "banana", "peach"]
    
    var body: some View {
        List{
            ForEach(fruits, id: \.self) {
                Text($0)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Archive") {
                            
                        }.tint(.yellow)
                        
                        Button("Save") {
                            
                        }.tint(.green)
                        
                        Button("Junk") {
                            
                        }
                    }
                        
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button("Share") {
                                
                            }.tint(.blue)
                        
                    }
            }
            .onDelete(perform: delete)
        }
    }
    
    func delete(indexSet: IndexSet) {
        
    }
}

struct ListSwipeActions_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActions()
    }
}
