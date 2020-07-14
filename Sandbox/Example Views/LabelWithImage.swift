//
//  LabelWithImage.swift
//  Sandbox
//
//  Created by Lizz Clark on 14/07/2020.
//

import Foundation
import SwiftUI

// MARK: - Labels with images, plus adding environment stuff to the preview struct
// this also adjusts nicely with dynamic font sizes

struct LabelWithImage: View {
    var body: some View {
        List(0..<100) { _ in
            Label("Super long title with some system image", systemImage: "house")
        }
    }
}

struct LabelWithImage_Previews: PreviewProvider {
    static var previews: some View {
        LabelWithImage()
            .environment(\.sizeCategory, .accessibilityExtraLarge)
    }
}

