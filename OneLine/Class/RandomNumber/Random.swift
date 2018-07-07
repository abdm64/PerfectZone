//
//  Random.swift
//  OneLine
//
//  Created by ABD on 17/11/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import Foundation
import CoreGraphics


public extension CGFloat {
    public static func randomBetweenNumbers(firstNumb: CGFloat , secondNumb : CGFloat)-> CGFloat {
        
        
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNumb - secondNumb) + firstNumb
    }
    
    
    
}
