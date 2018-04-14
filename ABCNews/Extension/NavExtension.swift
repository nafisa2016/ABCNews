//
//  NavExtension.swift
//  ABCNews
//
//  Created by Nafisa Rahman on 4/8/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask     {
        
        return [.portrait, .portraitUpsideDown]
    }
}


