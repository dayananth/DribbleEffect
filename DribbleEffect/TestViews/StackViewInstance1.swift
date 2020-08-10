//
//  StackViewInstance1.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import Foundation
import UIKit

class PreviewView1: UIView {
    var label: UILabel  = {
        let label =  UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ImageSet"

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


class DetailView1: UIView {
    
    let imageView1:UIImageView = {
        return UIImageView(image: UIImage(named: "Test2"))
    }()
    
    let imageView2:UIImageView = {
        return UIImageView(image: UIImage(named: "ImageTest1"))
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8.0
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
       
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(imageView2)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
           ])
        }
          
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
}
