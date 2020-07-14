//
//  ListWithChildren.swift
//  Sandbox
//
//  Created by Lizz Clark on 14/07/2020.
//

import Foundation
import SwiftUI

// MARK: - List with nested children
// NB: children needs to be an optional array and the same type as parent for this to work properly

struct Person: Identifiable {
    var id: String { name }
    let name: String
    var children: [Person]?
}

struct ListWithChildren: View {
    var people: [Person] {
        let sophie = Person(name: "Sophie")
        let lottie = Person(name: "Lottie")
        let john = Person(name: "John")
        let paul = Person(name: "Paul", children: [sophie, lottie])
        let andrew = Person(name: "Andrew", children: [john])
        let terry = Person(name: "Terry", children: [paul, andrew])
        return [terry]
    }

    var body: some View {
        List(people, children: \.children) { person in
            if person.children != nil {
                Text(person.name)
                    .font(.headline)
            } else {
                Image(systemName: "person.circle")
                Text(person.name)
            }
        }

// OutlineGroup is "a two-dimensional ForEach" - more customisable than List, but not as nice looking out of the box

//        OutlineGroup(people, children: \.children) { person in
//            if person.children != nil {
//                Text(person.name)
//                    .font(.headline)
//            } else {
//                Image(systemName: "person.circle")
//                Text(person.name)
//            }
//        }
    }
}
