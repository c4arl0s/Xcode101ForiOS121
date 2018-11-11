//
//  SimpleView.swift
//  SimpleLines
//
//  Created by Carlos Santiago Cruz on 13/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class SimpleView: UIView {
    override func draw(_ rect: CGRect) {
        // context es el lienzo de pintado.
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2)
        context?.move(to: CGPoint(x: 0, y: 0))
        context?.addLine(to: CGPoint(x: 100, y: 100))
        context?.setStrokeColor(UIColor.black.cgColor)
    
        context?.addLine(to: CGPoint(x: 100, y: frame.height))
        context?.strokePath()
    }
}
