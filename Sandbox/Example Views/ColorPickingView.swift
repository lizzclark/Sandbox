//
//  ColorPickingView.swift
//  Sandbox
//
//  Created by Lizz Clark on 15/07/2020.
//

import Foundation
import SwiftUI

struct ColorPickingView: View {
    @State private var background = Color.clear
    
    init() {
        let red = UserDefaults.standard.double(forKey: "red")
        let green = UserDefaults.standard.double(forKey: "green")
        let blue = UserDefaults.standard.double(forKey: "blue")
        var alpha = UserDefaults.standard.double(forKey: "alpha")
        if alpha == 0 { alpha = 1 } // sensible default
        _background = State(wrappedValue: Color(red: red, green: green, blue: blue))
    }
    
    var body: some View {
        VStack {
            Text("hello world")
                .padding()
                .background(background)
                .foregroundColor(.white)
                .clipShape(Capsule())
            
            ColorPicker("Change colour", selection: $background)
                .padding()
            
            Spacer()
        }
        .onChange(of: background) { color in
            // UIColor isn't codable, and the API for getting RGB from a UIColor is awful...
            let uiColor = UIColor(color)
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            UserDefaults.standard.set(red, forKey: "red")
            UserDefaults.standard.set(green, forKey: "green")
            UserDefaults.standard.set(blue, forKey: "blue")
            UserDefaults.standard.set(alpha, forKey: "alpha")
        }
    }
}
