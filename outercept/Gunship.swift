//
//  Gunship.swift
//  outercept
//
//  Created by Bernhard Eiling on 04.09.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

protocol Gunship {
    
    func gun(followsNode node: SKNode)
    func fireGun(atNode node: SKNode)
    func resetGun()
    
}
