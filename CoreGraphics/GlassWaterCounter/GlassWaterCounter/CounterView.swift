//
//  CounterView.swift
//  GlassWaterCounter
//
//  Created by Carlos Santiago Cruz on 13/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit
@IBDesignable

class CounterView: UIView {
    @IBInspectable var counterColor: UIColor = UIColor.orange
    private struct Constants {
        static let numberOfGlasses = 8
    }
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                // the view needs to be refreshed
                setNeedsDisplay()
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
    
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - 76/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = 76
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        let arcLenghtPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        let outlineEndAngle = arcLenghtPerGlass * CGFloat(counter) + startAngle
        
        let outLinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 4, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        outLinePath.addArc(withCenter: center, radius: bounds.width/2 - 76 + 4, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        outLinePath.close()
        UIColor.blue.setStroke()
        outLinePath.lineWidth = 8
        outLinePath.stroke()
    }
    
    

}
