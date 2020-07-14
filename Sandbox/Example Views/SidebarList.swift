//
//  SidebarList.swift
//  Sandbox
//
//  Created by Lizz Clark on 14/07/2020.
//

import Foundation
import SwiftUI

// MARK: - Sidebar list style and inset grouped list style - play around with this on iPad portrait and landscape, as well as iPhone, to see different styles

struct SecondaryView: View {
    let group: Int
    let id: Int

    var body: some View {
        Text("Group \(group), id \(id)")
    }
}

struct SupplementaryView: View {
    @State private var selection: Int?
    let id: Int

    var body: some View {
        List(0..<100, selection: $selection) { i in
            NavigationLink(
                destination: SecondaryView(group: id, id: i),
                label: {
                    Text("Row \(i)")
                })
        }
        .navigationTitle("Notes")
        .listStyle(InsetGroupedListStyle())
    }
}

struct PrimaryView: View {
    @State private var selection: Int?

    var body: some View {
        List(0..<5, selection: $selection) { i in
            NavigationLink(
                destination: SupplementaryView(id: i),
                label: {
                    Text("Row \(i)")
                })
        }
        .listStyle(SidebarListStyle())
    }
}

struct SidebarList: View {

    var body: some View {
        NavigationView {
            PrimaryView()
            SupplementaryView(id: 0)
            SecondaryView(group: 0, id: 0)
        }
    }
}
