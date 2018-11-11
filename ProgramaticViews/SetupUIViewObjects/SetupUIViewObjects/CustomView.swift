//
//  CustomView.swift
//  SetupUIViewObjects
//
//  Created by Carlos Santiago Cruz on 30/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class CustomView: UIView {
    // They have a initializer for each of these creation methods and we need to override both of them with our own custom initializer.
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    private func commonInit(){
        // we loaded the xib by name from memory.
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        // we added the content view that we’ve dragged in as an outlet as a subview of the view we’ve created.
        addSubview(contentView)
        contentView.frame = self.bounds
        // we’ve positioned the content view to take up the entire view’s appearance.
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    // We just overrode both UIView initializers and called our initializer named commonInit (you can call it whatever you want).

}
