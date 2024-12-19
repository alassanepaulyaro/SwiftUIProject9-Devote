//
//  Constant.swift
//  SwiftUIProject9-Devote
//
//  Created by Yaro Paul  on 18/12/2024.
//

import SwiftUI

// date formater
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// UX

var backgroundGradient: LinearGradient {
  return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
