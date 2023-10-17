//
//  GlassmorphismBackground.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 17/10/2023.
//

import SwiftUI

struct GlassmorphismBackground: ViewModifier {
    var minWidth: CGFloat
    var maxHeight: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding([.top, .bottom])
            .frame(minWidth: minWidth, maxHeight: maxHeight)
            .background(
                Color.gray.opacity(0.25) // Soften the background to get that glass effect
            )
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white.opacity(0.2), lineWidth: 3) // Subtle white border
            )
            .shadow(color: Color.black.opacity(0.1), radius: 5) // Reduced shadow opacity for a softer look
    }
}

extension View {
    func glassmorphismBackground(minWidth: CGFloat = 350, maxHeight: CGFloat = 50) -> some View {
        self.modifier(GlassmorphismBackground(minWidth: minWidth, maxHeight: maxHeight))
    }
}


import SwiftUI

struct GlassmorphismBackground_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("Default Values")
                .glassmorphismBackground()
                .padding()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Default Values")
            
            Text("Custom Values")
                .glassmorphismBackground(minWidth: 400, maxHeight: 100)
                .padding()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Custom Values")
        }
    }
}

