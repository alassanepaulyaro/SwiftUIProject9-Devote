//
//  CheckboxStyleswift.swift
//  SwiftUIProject9-Devote
//
//  Created by Yaro Paul  on 20/12/2024.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
    }
}

#Preview{
    VStack {
        Toggle("Option 1", isOn: .constant(true))
            .toggleStyle(CheckboxStyle())
        
        Toggle("Option 2", isOn: .constant(false))
            .toggleStyle(CheckboxStyle())
    }
    .padding()
    .background(Color.gray.opacity(0.1))
    
}
