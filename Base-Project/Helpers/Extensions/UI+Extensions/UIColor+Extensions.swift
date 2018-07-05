//
//  UIColor+Extensions.swift
//  Base-Project
//
//  Created by Wassim on 4/13/18.
//  Copyright © 2018 Tedmob. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /**
     Initialize a UIColor from RGB Ints
     
     - parameter red:   Red int Value
     - parameter green: Green int Value
     - parameter blue:  blue int Value
     */
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /**
     Extension to the UIColor class that will allow to initiate a color using hexadecimal number
     - parameter netHex: The Hexadecimal number
     */
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    /**
     Extension to the UIColor class that will generate a random color
     */
    static func randomColor() -> UIColor {
        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}