//
//  VibrationAndHaptic.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 19.02.2022.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct VibrationHaptic: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("success") {HapticManager.instance.notification(type: .success)}
            Button("error") {HapticManager.instance.notification(type: .error)}
            Button("warning") {HapticManager.instance.notification(type: .warning)}
            Divider()
            Button("soft") {HapticManager.instance.impact(style: .soft)}
            Button("light") {HapticManager.instance.impact(style: .light)}
            Button("medium") {HapticManager.instance.impact(style: .medium)}
            Button("heavy") {HapticManager.instance.impact(style: .heavy)}
            Button("rigid") {HapticManager.instance.impact(style: .rigid)}

        }
    }
}

struct VibrationAndHaptic_Previews: PreviewProvider {
    static var previews: some View {
        VibrationHaptic()
    }
}
