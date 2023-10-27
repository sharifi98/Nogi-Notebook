//
//  MaterialView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 27/10/2023.
//

import SwiftUI

struct MaterialView: View {
    private var selectedMaterial: Color = .blue // assuming Material is a Color

    var body: some View {
        ZStack {
            Image("Ventura")

            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .foregroundStyle(.primary)
                .padding(.all, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16.0, style: .continuous)
                        .fill(selectedMaterial)
                )
        }
    }
}

#Preview {
    MaterialView()
}
