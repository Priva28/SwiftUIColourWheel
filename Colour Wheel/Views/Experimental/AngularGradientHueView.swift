//
//  AngularGradientHueView.swift
//  Colour Wheel
//
//  Created by Christian P on 11/6/20.
//  Copyright © 2020 Christian P. All rights reserved.
//

import SwiftUI

struct AngularGradientHueView: View {
    
    var colours: [Color] = {
        let hue = Array(0...359).reversed()
        return hue.map {
            Color(UIColor(hue: CGFloat($0) / 359, saturation: 1, brightness: 1, alpha: 1))
        }
    }()
    var radius: CGFloat
    
    var body: some View {
        AngularGradient(gradient: Gradient(colors: colours), center: UnitPoint(x: 0.5, y: 0.5))
            .frame(width: radius, height: radius)
            .clipShape(Circle())
    }
}

struct AngularGradientHueView_Previews: PreviewProvider {
    static var previews: some View {
        AngularGradientHueView(radius: 350)
    }
}
