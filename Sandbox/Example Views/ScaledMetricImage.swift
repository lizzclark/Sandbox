//
//  ScaledMetricImage.swift
//  Sandbox
//
//  Created by Lizz Clark on 14/07/2020.
//

import Foundation
import SwiftUI

// MARK: - @ScaledMetric allows images to resize with dynamic font, up to a point
// plus you can manually limit it with max(n, min(a, b))

struct ScaledMetricImage: View {
    @ScaledMetric var frame: CGFloat = 100

    var body: some View {
        TabView {
            VStack {
                Text("Hello")
                    .font(.largeTitle)
                Image("Spain")
                    .resizable()
                    .aspectRatio(2, contentMode: .fit)
                    .frame(width: max(90, min(frame, 120)))
            }
        }
        .tabItem {
            Image(systemName: "star")
            Text("Star")
        }
    }
}
