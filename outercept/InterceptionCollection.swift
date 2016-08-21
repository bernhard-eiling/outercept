//
//  StrokeCollection.swift
//  outercept
//
//  Created by Bernhard Eiling on 20.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import Foundation

class InterceptionCollection {
    
    var interceptions: [InterceptionSubtree] = []
    let maxNumber: Int = 3
    
    func addNode(interceptionSubtree: InterceptionSubtree) {
        guard interceptions.count < maxNumber else { return }
        interceptions.append(interceptionSubtree)
    }
    
    func update() {
        
        // TODO: fix filtering and remove old interception subtrees
        
        interceptions.filter { (interception) -> Bool in
            if interception.isInterceptionFinished {
                interception.removeFromParent()
                
            }
            return interception.isInterceptionFinished
        }
    }
}
