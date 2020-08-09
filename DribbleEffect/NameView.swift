//
//  NameView.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class ExpandedNameView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var firstNameLabel: UILabel  = {
        let label =  UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First Name"
        return label
     }()
    
    var lastNameLabel: UILabel = {
        let label =  UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Last Name"
        return label
    }()
    
    var firstNameTextField: UITextField  = {
       let textField =  UITextField()
//       textField.backgroundColor = .white
//       textField.textColor = .black
//       textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
       return textField
     }()
    
    var lastNameTextField: UITextField = {
        let textField =  UITextField()
//       textField.backgroundColor = .white
//       textField.textColor = .black
//       textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
       return textField
    }()
    
    let firstRowStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
//        stackView.spacing = 16.0
        return stackView
    }()
    
    let secondRowStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
//        stackView.spacing = 16.0
        return stackView
    }()
    
    let containerStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
//        stackView.spacing = 16.0
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        lastNameTextField.delegate = self
        firstNameTextField.delegate = self
        
        firstRowStackView.addArrangedSubview(firstNameLabel)
        firstRowStackView.addArrangedSubview(firstNameTextField)
//
        secondRowStackView.addArrangedSubview(lastNameLabel)
        secondRowStackView.addArrangedSubview(lastNameTextField)
        
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerStackView.addArrangedSubview(firstRowStackView)
        containerStackView.addArrangedSubview(secondRowStackView)
        addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
           ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("Laid out")
    }

}

extension ExpandedNameView : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class CollapsedNameView: UIView {
    
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
        label.text = "Add Name"

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
