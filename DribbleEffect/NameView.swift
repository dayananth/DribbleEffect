//
//  NameView.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class NameView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

class NameViewPreview: UIView {
    
    var data: String? {
        didSet {
            label.text = self.data
        }
    }
    
     var label: UILabel  = {
            let label =  UILabel()
            label.backgroundColor = .white
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false

            return label
          }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
    //        self.backgroundColor = .red
            self.addSubview(label)
            NSLayoutConstraint.activate([
               self.leadingAnchor.constraint(equalTo: self.label.leadingAnchor),
               self.trailingAnchor.constraint(equalTo: self.label.trailingAnchor),
               self.topAnchor.constraint(equalTo: self.label.topAnchor),
               self.bottomAnchor.constraint(equalTo: self.label.bottomAnchor)
            ])
           }
           
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
}
