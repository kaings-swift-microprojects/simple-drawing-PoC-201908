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
    var bazierPath: UIBezierPath = UIBezierPath()
    
    var testTapTarget: UIBezierPath!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = touches.first?.location(in: self)
//        print("lastPoint..... \(lastPoint!)")
        
        bazierPath.move(to: lastPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let newPoint = touches.first?.location(in: self) else {return}
        lines.append(Line(start: lastPoint, end: newPoint))
        
//        print("newPoint..... \(newPoint)")
        
        bazierPath.addLine(to: newPoint)
        
        lastPoint = newPoint
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tapTargetPath: CGPath = bazierPath.cgPath.copy(
            strokingWithWidth: bazierPath.lineWidth,
            lineCap: bazierPath.lineCapStyle,
            lineJoin: bazierPath.lineJoinStyle,
            miterLimit: bazierPath.miterLimit)
        print("tapTargetPath..... \(tapTargetPath)")
        
        let tapTarget: UIBezierPath = UIBezierPath(cgPath: tapTargetPath)
        print("tapTarget..... \(tapTarget)")
        
        testTapTarget = tapTarget
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
        path.lineWidth = 50
        path.lineCapStyle = CGLineCap.round
        path.stroke()
        
        guard let test = testTapTarget else {return}
        test.setLineDash([5.0,5.0], count: 10, phase: 0)
        test.lineWidth = 20
        UIColor.red.setStroke()
        test.stroke()
        
    }
 
}
