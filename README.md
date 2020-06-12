# SwiftUI Colour Wheel

A colour wheel made all in SwiftUI. 

There are 2 different colour wheels to choose from. 

- The first main one uses `CIHueSaturationValueGradient` `CIFilter` to draw itself, then uses `RadialGradient` and `.blur` to smooth it out. Named `ColourWheel` in code.
- The second one uses SwiftUI's `AngularGradient` with all 360 hues to draw the gradient, then a `RadialGradient` and `.blur` to smooth it out. Named `NewColourWheel` in code.

If you would like to use the slider to change brightness/value, use `ColourWheel`, as `NewColourWheel` does not support setting value at this point in time.

They both interact the same and output in [Red, Green, Blue] or [Hue, Saturation].

![previewjpg](https://raw.githubusercontent.com/Priva28/SwiftUIColourWheel/master/preview.jpg)

![preview](https://raw.githubusercontent.com/Priva28/SwiftUIColourWheel/master/preview.gif)
