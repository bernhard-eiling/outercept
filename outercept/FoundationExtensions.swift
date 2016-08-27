//
//  FoundationExtensions.swift
//  outercept
//
//  Created by Bernhard Eiling on 27.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import Foundation

extension Bool {
    
    static var random: Bool {
        return arc4random_uniform(2) == 0
    }
    
}
