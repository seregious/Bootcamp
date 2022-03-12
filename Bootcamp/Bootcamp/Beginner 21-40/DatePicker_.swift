//
//  DatePicker_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 15.02.2022.
//

import SwiftUI

struct DatePicker_: View {
    
    @State var selectedDate : Date = Date()
    let startingDate : Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate : Date = Date()
    
    var dateFormater : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        VStack{
            
            Spacer()
            
        DatePicker("Select a date", selection: $selectedDate)
            .datePickerStyle(.automatic)
            
            
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
            
            DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate)
            
            Spacer()
            
            Text("Selected date is:")
            Text(dateFormater.string(from: selectedDate))
            
            Spacer()
            
            
            
        }
    }
}

struct DatePicker__Previews: PreviewProvider {
    static var previews: some View {
        DatePicker_()
    }
}
