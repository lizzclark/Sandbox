//
//  ToolbarItemView.swift
//  Sandbox
//
//  Created by Lizz Clark on 15/07/2020.
//

import Foundation
import SwiftUI

struct ToolbarItemView: View {
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            Text("hello world")
                .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.bottomBar, content: {
                        Button {
                            print("tapped")
                        } label: {
                            Image(systemName: "circle.fill")
                        }
                    })
                }
        }
    }
}
