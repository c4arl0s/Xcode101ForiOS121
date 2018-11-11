//
//  SquareView.swift
//  SimpleLines
//
//  Created by Carlos Santiago Cruz on 13/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class SquareView: UIView {
    override func draw(_ rect: CGRect) {
       let aPath = UIBezierPath()
        aPath.lineWidth = 4
        aPath.move(to: CGPoint(x:10,y:0))
        aPath.addLine(to: CGPoint(x:frame.width-10,y:0))
        aPath.addQuadCurve(to: CGPoint(x: frame.width, y:10), controlPoint: CGPoint(x:frame.width,y:0))
        UIColor.black.set()
        aPath.stroke()
    }
}
