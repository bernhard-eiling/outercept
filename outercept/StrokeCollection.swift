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
    
    func addNode(strokeNode: StrokeNode) {
        strokes.append(strokeNode)
    }
}
