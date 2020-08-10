//
//  TestController.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 08/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class TestController: UIViewController {
    var stackContainerView: SegmentContainerView?
    
    
    // This the test runner for the dribble framework
    func initializeTestViews() -> SegmentContainerView {
    
        // Stack 1 -> Test View
        let collapsedNameView = CollapsedNameView(frame: .zero)
        let expandedNameView = ExpandedNameView(frame: .zero)
        
        // Stack 2 -> Test View
        let collapsedAgeView = CollapsedAgeView(frame: .zero)
        let expandedAgeView = ExpandedAgeView(frame: .zero)
        
        // Stack 3 -> Test View
        let collapsedAddressView = CollapsedAddressView(frame: .zero)
        let expandedAddressView = ExpandedAddressView(frame: .zero)
        
        // CTA Button - Customizable CTA. Its optional if we dont need it
        let ctaButton = UIButton(frame: .zero)
        ctaButton.translatesAutoresizingMaskIntoConstraints = false
        ctaButton.backgroundColor = .green
        ctaButton.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        ctaButton.setTitleColor(.black, for: .normal)
        
        // Customizable Toggle buttons, if we dont pass our own toggle button, the default + or - toggle would be applied
        let arrowToggleButton = UIButton(frame: .zero)
        arrowToggleButton.setTitle("▼", for: .normal)
        arrowToggleButton.setTitleColor(.orange, for: .normal)
        
        let thinArrowButton = UIButton(frame: .zero)
        thinArrowButton.setTitle("↓", for: .normal)
        thinArrowButton.setTitleColor(.orange, for: .normal)
        
        return try! SegmentContainerView(segmentBundles: [
            // First Section with strong arrow
            SegmentBundle(expandedView: expandedNameView, collapsedView: collapsedNameView, ctaText: "Add Name", ctaActionCallback: {
                // Passing data back once the dettails are added
                 collapsedNameView.data = "Name: \(expandedNameView.firstNameTextField.text ?? "")  ,  \(expandedNameView.lastNameTextField.text ?? "")"
            }, toggleButton: arrowToggleButton, toggleButtonCallBack: { (state) in
                if state == SegmentState.collapsed {
                       arrowToggleButton.setTitle("▼", for: .normal)
                } else {
                    arrowToggleButton.setTitle("▲", for: .normal)
                }
            }),
            
            // Second Section with thin arrow
            SegmentBundle(expandedView: expandedAgeView, collapsedView: collapsedAgeView, ctaText: "Add Age", ctaActionCallback: {
                // Passing data back once the dettails are added
                collapsedAgeView.data = "Age: \(expandedAgeView.dayTextField.text ?? "") \(expandedAgeView.monthTextField.text ?? "" )/\(expandedAgeView.yearTextField.text ?? "")"
            }, toggleButton: thinArrowButton,toggleButtonCallBack: { (state) in
                
                if state == SegmentState.collapsed {
                    thinArrowButton.setTitle("↓", for: .normal)
                } else {
                    thinArrowButton.setTitle("↑", for: .normal)
                }
            }),
            
            // Third with default + and -
            SegmentBundle(expandedView: expandedAddressView, collapsedView: collapsedAddressView, ctaText: "Add Address", ctaActionCallback: {
                // Passing data back once the dettails are added
                collapsedAddressView.data = "\(expandedAddressView.addressLine1Text.text ?? ""), \(expandedAddressView.cityText.text ?? ""), \(expandedAddressView.stateText.text ?? "")"
            }, toggleButton: nil, toggleButtonCallBack: nil)
        ],ctaButton: ctaButton)
        
    }
    



    override func viewDidLoad() {
        super.viewDidLoad()
        stackContainerView = initializeTestViews()
        guard let stackContainerView = stackContainerView else {return}
        self.view.backgroundColor = .white
        self.view.addSubview(stackContainerView)
        stackContainerView.translatesAutoresizingMaskIntoConstraints = false
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Expan", for: .normal)
        button.setContentCompressionResistancePriority(.required, for: .vertical)
        
        
        let button2 = UIButton(frame: .zero)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.backgroundColor = .red
        button2.setTitleColor(.black, for: .normal)
        button2.setTitle("Collapse", for: .normal)
        button2.setContentCompressionResistancePriority(.required, for: .vertical)
        stackContainerView.setContentCompressionResistancePriority(.required, for: .vertical)
        
        stackContainerView.setContentHuggingPriority(.required, for: .vertical)
        
        let view = UIView()
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        let uiStackView = UIStackView(frame: .zero)
        uiStackView.translatesAutoresizingMaskIntoConstraints = false
        uiStackView.distribution = .fill
        uiStackView.axis = .vertical
        uiStackView.spacing = 0.0
        
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        view2.setContentHuggingPriority(.defaultLow, for: .vertical)
        view2.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        let headerLabel = UILabel()
        headerLabel.text = "=========Example Dribble Effect========"
        headerLabel.font = UIFont.systemFont(ofSize: 18.0)
        
        self.view.addSubview(uiStackView)
        uiStackView.addArrangedSubview(headerLabel)
        uiStackView.addArrangedSubview(view2)
        uiStackView.addArrangedSubview(stackContainerView)
        
        NSLayoutConstraint.activate([
            uiStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            uiStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            uiStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            uiStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
}

