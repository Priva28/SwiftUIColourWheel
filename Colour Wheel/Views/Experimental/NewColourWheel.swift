//
//  NewColourWheel.swift
//  Colour Wheel
//
//  Created by Christian P on 11/6/20.
//  Copyright © 2020 Christian P. All rights reserved.
//

import SwiftUI

/// The actual colour wheel view.
struct NewColourWheel: View {
    
    /// Draws at a specified radius.
    var radius: CGFloat
    
    /// The RGB colour. Is a binding as it can change and the view will update when it does.
    @Binding var rgbColour: RGB
    
    var body: some View {
        
        /// Geometry reader so we can know more about the geometry around and within the view.
        GeometryReader { geometry in
            ZStack {
                
                /// The colour wheel. See the definition.
                AngularGradientHueView(radius: self.radius)
                    /// Smoothing out of the colours.
                    .blur(radius: 10)
                    /// The outline.
                    .overlay(
                        Circle()
                            .size(CGSize(width: self.radius, height: self.radius))
                            .stroke(Color("Outline"), lineWidth: 10)
                            /// Inner shadow.
                            .shadow(color: Color("ShadowInner"), radius: 8)
                    )
                    /// Clip inner shadow.
                    .clipShape(
                        Circle()
                            .size(CGSize(width: self.radius, height: self.radius))
                    )
                    /// Outer shadow.
                    .shadow(color: Color("ShadowOuter"), radius: 15)
                
                /// This *is* required for the saturation scale of the wheel. It actually makes the gradient less "accurate" but looks nicer. It's basically just a white radial gradient that blends the colours together nicer.
                RadialGradient(gradient: Gradient(colors: [.white, .black]), center: .center, startRadius: 0, endRadius: self.radius/2 - 10)
                    .blendMode(.screen)

                /// The little knob that shows selected colour.
                Circle()
                    .frame(width: 10, height: 10)
                    .offset(x: (self.radius/2 - 10) * self.rgbColour.hsv.s)
                    .rotationEffect(.degrees(-Double(self.rgbColour.hsv.h)))
                
            }
            /// The gesture so we can detect taps and drags on the wheel.
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onChanged { value in
                        
                        /// Work out angle which will be the hue.
                        let y = geometry.frame(in: .global).midY - value.location.y
                        let x = value.location.x - geometry.frame(in: .global).midX
                        
                        /// Use `atan2` to get the angle from the center point then convert than into a 360 value with custom function(find it in helpers).
                        let hue = atan2To360(atan2(y, x))
                        
                        /// Work out distance from the center point which will be the saturation.
                        let center = CGPoint(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).midY)
                        
                        /// Maximum value of sat is 1 so we find the smallest of 1 and the distance.
                        let saturation = min(distance(center, value.location)/(self.radius/2), 1)
                        
                        /// Convert HSV to RGB and set the colour which will notify the views.
                        self.rgbColour = HSV(h: hue, s: saturation, v: 1).rgb
                    }
            )
        }
        /// Set the size.
        .frame(width: self.radius, height: self.radius)
    }
}

struct NewColourWheel_Previews: PreviewProvider {
    static var previews: some View {
        NewColourWheel(radius: 350, rgbColour: .constant(RGB(r: 1, g: 1, b: 1)))
    }
}
