//
//  StackViewInstance.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 08/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import Foundation
import UIKit

class PreviewView: UIView {
    var label: UILabel  = {
        let label =  UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum"

        return label
      }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
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


class DetailView: UIView {
    
    let primaryTitle: UILabel = {
        
        let label = UILabel()
        label.text =
        "Show Matching Images Show Matching Images Show Matching Images Show Matching Images"
        label.textColor = UIColor(red: 170/255, green: 21/255, blue: 66/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
//        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    let secondaryTitle: UILabel = {
          let label = UILabel()
          label.text =
          "Tag"
        label.textAlignment = .center
        
        label.textColor = UIColor.darkGray
          label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
          return label
      }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 16.0
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        stackView.addArrangedSubview(primaryTitle)
        stackView.addArrangedSubview(secondaryTitle)
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
