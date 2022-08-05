//
//  CustomButton.swift
//  SwiftUIFB
//
//  Created by VTechnoZ on 28/07/22.
//

import SwiftUI



struct CustomButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline.bold())
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 55)
            .background(.red.opacity(0.3), in: RoundedRectangle(cornerRadius: 15, style: .continuous))
            .opacity(configuration.isPressed ? 0.5 : 1)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
}
