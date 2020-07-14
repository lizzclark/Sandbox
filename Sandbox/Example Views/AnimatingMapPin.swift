//
//  AnimatingMapPins.swift
//  Sandbox
//
//  Created by Lizz Clark on 14/07/2020.
//

import Foundation
import MapKit
import SwiftUI

// MARK: - Animating map pins

struct City: Identifiable {
    var id: String { name }
    let name: String
    let location: CLLocationCoordinate2D

    static let london = City(name: "London", location: .init(latitude: 51.507, longitude: -0.1275))
    static let paris = City(name: "Paris", location: .init(latitude: 48.864, longitude: 2.349))
}

struct AnimatingPin: View {
    @State private var animation = 0.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.red, lineWidth: 2)
                .frame(width: 50, height: 50)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Image(systemName: "mappin")
                .imageScale(.large)
                .foregroundColor(.green)
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 1)
                            .repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct AnimatingMapPin: View {
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: City.london.location, span: .init(latitudeDelta: 0.5, longitudeDelta: 0.5))

    let annotations = [City.london, City.paris]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
            MapAnnotation(coordinate: annotation.location, anchorPoint: .init(x: 0.5, y: 1), content: AnimatingPin.init)
        }
    }
}
