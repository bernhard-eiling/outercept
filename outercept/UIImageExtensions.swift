//
//  UIImageExtensions.swift
//  outercept
//
//  Created by Bernhard Eiling on 03.09.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func circle(withDiameter diameter: CGFloat, andColor color: UIColor) -> UIImage {
        let size = CGSize(width: diameter, height: diameter)
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fillEllipse(in: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
}
