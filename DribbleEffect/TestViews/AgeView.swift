//
//  AgeView.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class ExpandedAgeView: UIView {

     /*
        // Only override draw() if you perform custom drawing.
        // An empty implementation adversely affects performance during animation.
        override func draw(_ rect: CGRect) {
            // Drawing code
        }
        */
    
    var dayLabel: UILabel  = {
       let label =  UILabel()
       label.backgroundColor = .white
       label.textColor = .black
       label.translatesAutoresizingMaskIntoConstraints = false
       label.text = "day"
       return label
    }()
    
    
    var monthLabel: UILabel  = {
            let label =  UILabel()
            label.backgroundColor = .white
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Month"
            return label
         }()
        
        var yearLabel: UILabel = {
            let label =  UILabel()
            label.backgroundColor = .white
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Year"
            return label
        }()
        
        var dayTextField: UITextField  = {
           let textField =  UITextField()
            textField.borderStyle = .roundedRect
           return textField
         }()
        
        var monthTextField: UITextField = {
            let textField =  UITextField()
            textField.borderStyle = .roundedRect
           return textField
        }()
    
        var yearTextField: UITextField = {
            let textField =  UITextField()
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
    
        let thirdRowStackView: UIStackView = {
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
            dayTextField.delegate = self
            monthTextField.delegate = self
            yearTextField.delegate = self
            
            firstRowStackView.addArrangedSubview(dayLabel)
            firstRowStackView.addArrangedSubview(dayTextField)

    //
            secondRowStackView.addArrangedSubview(monthLabel)
            secondRowStackView.addArrangedSubview(monthTextField)
            
            thirdRowStackView.addArrangedSubview(yearLabel)
            thirdRowStackView.addArrangedSubview(yearTextField)
            
            containerStackView.translatesAutoresizingMaskIntoConstraints = false
            
            let headerLabel = UILabel(frame: .zero)
            headerLabel.backgroundColor = .cyan
            headerLabel.text = "Age Section"
            
            containerStackView.addArrangedSubview(headerLabel)
            containerStackView.addArrangedSubview(firstRowStackView)
            containerStackView.addArrangedSubview(secondRowStackView)
            containerStackView.addArrangedSubview(thirdRowStackView)
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

extension ExpandedAgeView : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


class CollapsedAgeView: UIView {
    var data: String? {
        didSet {
            label.text = self.data
        }
    }
    
     var label: UILabel  = {
        let label =  UILabel()
        label.backgroundColor = .cyan
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add Age"

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
