//
//  FinalView.swift
//  Colour Wheel
//
//  Created by Christian P on 9/6/20.
//  Copyright © 2020 Christian P. All rights reserved.
//

import SwiftUI

/// The final view that presents everything.
struct FinalView: View {
    
    /// Source of truth of the colour that will be presented as well as controlled with the colour wheel.
    @State var rgbColour = RGB(r: 0, g: 1, b: 1)
    
    var body: some View {
        VStack {
            
            /// The text at the top.
            HStack {
                Text("Pick a colour.")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                Spacer()
            }
            /// The actual colour wheel.
            ColourWheel(radius: 300, rgbColour: $rgbColour)
                .padding()
            
            /// The view that shows the selected colour.
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.init(red: Double(rgbColour.r), green: Double(rgbColour.g), blue: Double(rgbColour.b)))
                .frame(width: 300, height: 50)
                /// The outline.
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Outline"), lineWidth: 5)
                )
                /// The outer shadow.
                .shadow(color: Color("ShadowOuter"), radius: 18)
                .padding()
                
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}

