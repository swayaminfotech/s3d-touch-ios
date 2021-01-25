//
//  Welcome.swift
//  S3DTouch
//
//  Created by Swayam Infotech on 28/09/20.
//  Copyright © 2020 Swayam Infotech. All rights reserved.
//

import UIKit

class Welcome: UIViewController {
    
    // to define label.
    let lblWelcome: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 30))
        lbl.text = "welcome".localized
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to set title
        self.title = "welcome".localized
        
        // to change default color to white of view.
        self.view.backgroundColor = UIColor.white
        
        // to add label.
        self.view.addSubview(lblWelcome)
        lblWelcome.center = self.view.center
    }
}
