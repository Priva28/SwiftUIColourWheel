//
//  CIHueSaturationValueGradientView.swift
//  Colour Wheel
//
//  Created by Christian P on 9/6/20.
//  Copyright © 2020 Christian P. All rights reserved.
//

import SwiftUI

/// This UIViewRepresentable uses `CIHueSaturationValueGradient` to draw a circular gradient with the RGB colour space as a CIFilter.
struct CIHueSaturationValueGradientView: UIViewRepresentable {
    
    /// Radius to draw
    var radius: CGFloat
    
    func makeUIView(context: Context) -> UIImageView {
        let filter = CIFilter(name: "CIHueSaturationValueGradient", parameters: [
            "inputColorSpace": CGColorSpaceCreateDeviceRGB(),
            "inputDither": 0,
            "inputRadius": radius * 0.4,
            "inputSoftness": 0.8,
            "inputValue": 1
        ])!
        
        /// Output as UIImageView
        let image = UIImage(ciImage: filter.outputImage!)
        let imageView = UIImageView()
        imageView.image = image
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) { }
}
