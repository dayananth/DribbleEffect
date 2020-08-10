//
//  AddressView.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 10/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class ExpandedAddressView: UIView {

    var AddressLine1: UILabel  = {
          let label =  UILabel()
          label.backgroundColor = .white
          label.textColor = .black
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text = "Address Line 1"
          return label
       }()
       
       
       var AddressLine2: UILabel  = {
               let label =  UILabel()
               label.backgroundColor = .white
               label.textColor = .black
               label.translatesAutoresizingMaskIntoConstraints = false
               label.text = "AddressLine 2"
               return label
            }()
           
           var Pincode: UILabel = {
               let label =  UILabel()
               label.backgroundColor = .white
               label.textColor = .black
               label.translatesAutoresizingMaskIntoConstraints = false
               label.text = "Pincode"
               return label
           }()
    var city: UILabel = {
        let label =  UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "City"
        return label
    }()
    var state: UILabel = {
        let label =  UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "State"
        return label
    }()
           
           var addressLine1Text: UITextField  = {
              let textField =  UITextField()
               textField.borderStyle = .roundedRect
              return textField
            }()
           
           var addressLine2Text: UITextField = {
               let textField =  UITextField()
               textField.borderStyle = .roundedRect
              return textField
           }()
       
           var pinCodeText: UITextField = {
               let textField =  UITextField()
               textField.borderStyle = .roundedRect
              return textField
           }()
    
    var cityText: UITextField = {
        let textField =  UITextField()
        textField.borderStyle = .roundedRect
       return textField
    }()
    var stateText: UITextField = {
        let textField =  UITextField()
        textField.borderStyle = .roundedRect
       return textField
    }()
       
       
           let firstRowStackView: UIStackView = {
               let stackView = UIStackView(frame: .zero)
               stackView.translatesAutoresizingMaskIntoConstraints = false
               stackView.distribution = .fillEqually
               stackView.axis = .horizontal
               return stackView
           }()
           
           let secondRowStackView: UIStackView = {
               let stackView = UIStackView(frame: .zero)
               stackView.translatesAutoresizingMaskIntoConstraints = false
               stackView.distribution = .fillEqually
               stackView.axis = .horizontal
               return stackView
           }()
       
           let thirdRowStackView: UIStackView = {
               let stackView = UIStackView(frame: .zero)
               stackView.translatesAutoresizingMaskIntoConstraints = false
               stackView.distribution = .fillEqually
               stackView.axis = .horizontal
               return stackView
           }()
    
    let fourthRowStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    let fifthRowStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
           
           let containerStackView: UIStackView = {
               let stackView = UIStackView(frame: .zero)
               stackView.translatesAutoresizingMaskIntoConstraints = false
               stackView.distribution = .fillEqually
               stackView.axis = .vertical
               return stackView
           }()
           
           override init(frame: CGRect) {
               super.init(frame: frame)
               addressLine1Text.delegate = self
               addressLine2Text.delegate = self
               pinCodeText.delegate = self
            stateText.delegate = self
            cityText.delegate = self
               
               firstRowStackView.addArrangedSubview(AddressLine1)
               firstRowStackView.addArrangedSubview(addressLine1Text)

       //
               secondRowStackView.addArrangedSubview(AddressLine2)
               secondRowStackView.addArrangedSubview(addressLine2Text)
               
               thirdRowStackView.addArrangedSubview(Pincode)
               thirdRowStackView.addArrangedSubview(pinCodeText)
            
            fourthRowStackView.addArrangedSubview(city)
            fourthRowStackView.addArrangedSubview(cityText)
            
            fifthRowStackView.addArrangedSubview(state)
            fifthRowStackView.addArrangedSubview(stateText)
               
               containerStackView.translatesAutoresizingMaskIntoConstraints = false
               
               let headerLabel = UILabel(frame: .zero)
               headerLabel.backgroundColor = .black
               headerLabel.text = "Address Section"
            headerLabel.textColor = .white
               
               containerStackView.addArrangedSubview(headerLabel)
               containerStackView.addArrangedSubview(firstRowStackView)
               containerStackView.addArrangedSubview(secondRowStackView)
               containerStackView.addArrangedSubview(thirdRowStackView)
            containerStackView.addArrangedSubview(fourthRowStackView)
            containerStackView.addArrangedSubview(fifthRowStackView)
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

extension ExpandedAddressView : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


class CollapsedAddressView: UIView {
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
           label.text = "Add Address"

               return label
             }()
           
           override init(frame: CGRect) {
               super.init(frame: frame)
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
