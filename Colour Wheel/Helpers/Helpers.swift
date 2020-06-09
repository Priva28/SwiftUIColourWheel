//
//  Helpers.swift
//  color wheel
//
//  Created by Christian P on 9/6/20.
//  Copyright © 2020 Christian P. All rights reserved.
//

import SwiftUI

func atan2To360(_ angle: CGFloat) -> CGFloat {
    var result = angle
    if result < 0 {
        result = (2 * CGFloat.pi) + angle
    }
    return result * 180 / CGFloat.pi
}

func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
    let xDist = a.x - b.x
    let yDist = a.y - b.y
    return CGFloat(sqrt(xDist * xDist + yDist * yDist))
}
