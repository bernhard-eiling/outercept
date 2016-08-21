//
//  StrokeCollection.swift
//  outercept
//
//  Created by Bernhard Eiling on 20.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import Foundation

class StrokeCollection {
    
    var strokes: [StrokeNode] = []
    let maxNumber: Int = 3
    
    func addNode(strokeNode: StrokeNode) {
        guard strokes.count < maxNumber else { return }
        strokes.append(strokeNode)
    }
}
