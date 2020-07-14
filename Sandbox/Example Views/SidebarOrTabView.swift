//
//  SidebarOrTabView.swift
//  Sandbox
//
//  Created by Lizz Clark on 14/07/2020.
//

import Foundation
import SwiftUI

// MARK: - Sidebars again but reading horizontal size class from environment to use tabs depending on width available

struct HomeView: View {

    var body: some View {
        Text("Home")
    }
}

struct StoreView: View {

    var body: some View {
        Text("Store")
    }
}

struct AccountView: View {

    var body: some View {
        Text("Account")
    }
}

struct SidebarNavigation: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: HomeView(),
                    label: {
                        Text("Home")
                    })
                NavigationLink(
                    destination: StoreView(),
                    label: {
                        Text("Store")
                    })
                NavigationLink(
                    destination: AccountView(),
                    label: {
                        Text("Account")
                    })

            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct TabNavigation: View {

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            StoreView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Store")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
        }
    }
}

struct SidebarOrTabView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        if sizeClass == .compact {
            TabNavigation()
        } else {
            SidebarNavigation()
        }
    }
}
