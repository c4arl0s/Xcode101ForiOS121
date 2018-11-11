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
        // context es el lienzo de pintado.
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(2)
        context?.move(to: CGPoint(x: 10, y: 0))
        context?.addLine(to: CGPoint(x: frame.width - 10, y: 0))
        context?.addQuadCurve(to: CGPoint(x: frame.width, y: 10), control: CGPoint(x:frame.width, y: 0))
        context?.strokePath()
    }
}
