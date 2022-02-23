//
//  TimerOnReceive.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 23.02.2022.
//

import SwiftUI

struct TimerOnReceive: View {
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
// Current Time
/*
    @State var currentDate : Date = Date()
    var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
*/
    
    //Countdown
    /*
    @State var count = 10
    @State var finishedText : String? = nil
     */
    
    
    //Countdown to date
    /*
    @State var timeRemaining = ""
    let futureDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour):\(minute):\(second)"
    }
     */
    
    // Animation counter
    @State var count = 1

    
    var body: some View {
                
        ZStack {
            RadialGradient(
                colors: [.teal, .blue],
                center: .center,
                startRadius: 5,
                endRadius: 500)
                .ignoresSafeArea()
            
            TabView (selection: $count) {
                Rectangle()
                    .tag(1)
                    .foregroundColor(.red)
                
                Rectangle()
                    .tag(2)
                    .foregroundColor(.mint)
                
                Rectangle()
                    .tag(3)
                    .foregroundColor(.yellow)
                
                Rectangle()
                    .tag(4)
                    .foregroundColor(.purple)
                
                Rectangle()
                    .tag(5)
                    .foregroundColor(.orange)
            }
            .cornerRadius(25)
            .shadow(radius: 10)
            .tabViewStyle(.page)
            .padding()
            
            
//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 150)
//            .foregroundColor(.white)
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()){
                count = count == 5 ? 1 : count + 1
            }
        }
    }
}

struct TimerOnReceive_Previews: PreviewProvider {
    static var previews: some View {
        TimerOnReceive()
    }
}
