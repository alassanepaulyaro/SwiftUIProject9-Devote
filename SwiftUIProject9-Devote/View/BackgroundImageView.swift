//
//  BackgroundImageView.swift
//  SwiftUIProject9-Devote
//
//  Created by Yaro Paul  on 19/12/2024.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
             .antialiased(true)
             .resizable()
             .scaledToFill()
             .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}
