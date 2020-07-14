//
//  ContentView.swift
//  Sandbox
//
//  Created by Paul Hudson on 10/07/2020.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $text)
                .foregroundColor(.black)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .navigationTitle("Text Editing")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

