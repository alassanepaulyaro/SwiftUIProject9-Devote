//
//  BlankView.swift
//  SwiftUIProject9-Devote
//
//  Created by Yaro Paul  on 19/12/2024.
//

import SwiftUI

struct BlankView: View {
        
    var body: some View {
        VStack {
             Spacer()
           }
           .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
           .background(Color.black)
           .opacity(0.5)
           .blendMode(.overlay)
           .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BlankView()
}
