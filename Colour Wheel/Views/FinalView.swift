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
    @State var brightness: CGFloat = 1
    
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
            ColourWheel(radius: 300, rgbColour: $rgbColour, brightness: $brightness)
                .padding()
            
            /// The slider shows the selected colour and allows control of the brightness/value. Cannot have value at 0 otherwise we lose the RGB value.
            CustomSlider(rgbColour: $rgbColour, value: $brightness, range: 0.001...1)
                .padding()
            
            /// If you don't want a brightness/value slider then remove it and use this instead to show the current colour.
            //ColourShowView(rgbColour: $rgbColour)
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}

