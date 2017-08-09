//
//  LocationListView.swift
//  ECommeia
//
//  Created by HyperThink Systems on 09/08/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class LocationListView: UIView {

    internal override init(frame: CGRect) {
        super.init(frame: frame)
        let myView = Bundle.main.loadNibNamed("LocationListView", owner: self, options: nil)?[0] as! UIView
        self.frame = frame
        myView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(myView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
}
