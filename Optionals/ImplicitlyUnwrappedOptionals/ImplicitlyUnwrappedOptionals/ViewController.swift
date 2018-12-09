//
//  ViewController.swift
//  ImplicitlyUnwrappedOptionals
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // an object cannot be initialized until all of its non-optional properties are given a value
    // but in some cases, particularly with iOS development, some properties are nil for just a moment
    // until the value can be specified after initialization.
    // for example you have used Interface Builder to create outlets so that you can access a particular piece
    // of the interface in code.

    @IBOutlet weak var label: UILabel!
    
    // if you were the developer of this class, you would know that anytime a ViewController is created and presented to the user there will always be a label on the screen, because you added it in the storyboard.
    // but in iOS development, the storyBoards elements are not connected to their corresponding outlets until after initialization takes place.
    // therefore, label must be allowed to be nil for a brief period.

    // what about using a regular optional, UILabel?, for the type ?, The standard optional will require the if-let syntax to constantly unwrap the value, providing a safely mechanism for data that may not exist. But you know the label will have a value after the storyboard connects the outlets, so unwrapping an optional that is not really "optional" feels cumbersome.
    // To get around this issue, Swift provides syntax for an implicitly unwrapped optional, using the exclamation mark !, insted the question mark ?. As the name suggest, this type of optional unwraps automatically, whener it is used in code. This allows you to use label as though it were not an optional, while allowing the ViewController to be initialized without it.
    
    // implicitly unwrapped optionals should be used in one special case: when you need to initialize an object without supplying the value , but you know you will be giving the object a value very soon afterwards. It might seem convinient to reach for the implicitly unwrapped optional to save yourself from using if-let syntax, but by doing so you would remove one of the most important safety features of the language.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

