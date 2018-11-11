//
//  ActionButton.swift
//  GlassWaterCounter
//
//  Created by Carlos Santiago Cruz on 13/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit
@IBDesignable

class ActionButton: UIButton {
    
    @IBInspectable var isAddButton: Bool = true
    @IBInspectable var fillColor: UIColor = UIColor.green
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusWidth: CGFloat = min(bounds.width, bounds.height)*0.6
        let halfPlusWidth = plusWidth / 2
        let plusPath = UIBezierPath()
        plusPath.lineWidth = 5.0
        
        
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHeight))
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth, y: halfHeight))
        
        if isAddButton {
            plusPath.move(to: CGPoint(x: halfWidth, y: halfWidth-halfPlusWidth))
            plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHeight+halfPlusWidth))
        }
        UIColor.white.setStroke()
        plusPath.stroke()
        
    }
}
