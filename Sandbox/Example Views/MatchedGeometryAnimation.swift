//
//  MatchedGeometryAnimation.swift
//  Sandbox
//
//  Created by Lizz Clark on 14/07/2020.
//

import Foundation
import SwiftUI

// MARK: - MatchedGeometryEffect, @Namespace and AnyTransition extension to make a smooth animation when views are recreated

struct NamesView: View {
    let names = ["Chidi", "Eleanor", "Jason", "Tahani"]
    let animation: Namespace.ID

    var body: some View {
        ForEach(names, id: \.self) { name in
            Text(name)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .clipShape(Capsule())
                .matchedGeometryEffect(id: name, in: animation)
        }
    }
}

struct MatchedGeometryAnimation: View {
    @State private var isVertical = false
    @Namespace var animation

    var body: some View {
        if isVertical {
            VStack(spacing: 20) {
                NamesView(animation: animation)
            }
            .transition(.none)
            .onTapGesture {
                withAnimation(Animation.interactiveSpring(response: 0.4, dampingFraction: 0.7)) {
                    isVertical.toggle()
                }
            }
        } else {
            HStack {
                NamesView(animation: animation)
            }
            .transition(.none)
            .onTapGesture {
                withAnimation(Animation.interactiveSpring(response: 0.4, dampingFraction: 0.7)) {
                    isVertical.toggle()
                }
            }
        }
    }
}

extension AnyTransition {
    struct NoneModifier: ViewModifier {
        func body(content: Content) -> some View {
            return content
        }
    }

    static var none: AnyTransition {
        return AnyTransition.modifier(active: NoneModifier(), identity: NoneModifier())
    }
}

