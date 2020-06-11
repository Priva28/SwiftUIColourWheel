# SwiftUI Colour Wheel

A colour wheel made all in SwiftUI. 

There are 2 different colour wheels to choose from. 

- The first main one uses `CIHueSaturationValueGradient` `CIFilter` to draw itself, then uses `RadialGradient` and `.blur` to smooth it out.
- The second one uses SwiftUI's `AngularGradient` with all 360 hues to draw the gradient, then a `RadialGradient` and `.blur` to smooth it out.

They both interact the same and output in [Red, Green, Blue] or [Hue, Saturation].

![preview](https://raw.githubusercontent.com/Priva28/SwiftUIColourWheel/master/preview.gif)
