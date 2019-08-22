//
//  DrawView.swift
//  drawing-PoC-1
//
//  Created by Will on 22/8/19.
//  Copyright © 2019 Will. All rights reserved.
//

import UIKit

class DrawView: UIView {
    var lines: [Line] = [Line]()
    var lastPoint: CGPoint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = touches.first?.location(in: self)
//        print("lastPoint..... \(lastPoint!)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let newPoint = touches.first?.location(in: self) else {return}
        lines.append(Line(start: lastPoint, end: newPoint))
        
//        print("newPoint..... \(newPoint)")
        
        lastPoint = newPoint
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
//        print("drawing..... ")
        let path: UIBezierPath = UIBezierPath()
        
        for line in lines {
            path.move(to: line.start)
            path.addLine(to: line.end)
        }
        
        UIColor.purple.setStroke()
        path.stroke()
        
    }

}
