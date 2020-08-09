//
//  StackView.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class Segment: UIView {
    
    let collapsedView: UIView
    let expandedView: UIView
    var heightConstraint: NSLayoutConstraint?
    var expandedViewHeightConstriant: NSLayoutConstraint?
    var isExpanded: Bool = false
    var didToggle: ((UIView) -> Void)?
    var toggleButton: UIButton = {
        
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
        
    }()
    
    init(collapsedView: UIView, expandedView: UIView) {
        self.collapsedView = collapsedView
        self.expandedView = expandedView
        super.init(frame: .zero)
        self.addSubview(collapsedView)
        self.addSubview(expandedView)
        collapsedView.translatesAutoresizingMaskIntoConstraints = false
        expandedView.translatesAutoresizingMaskIntoConstraints = false
        expandedView.alpha = 0
        
        expandedViewHeightConstriant = expandedView.heightAnchor.constraint(equalToConstant: 0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            collapsedView.topAnchor.constraint(equalTo: self.topAnchor),
            collapsedView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collapsedView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collapsedView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            expandedView.topAnchor.constraint(equalTo: self.topAnchor),
            expandedView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            expandedView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            expandedView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            expandedViewHeightConstriant!
        ])
        
        addSubview(toggleButton)
        NSLayoutConstraint.activate([
            toggleButton.topAnchor.constraint(equalTo: self.topAnchor),
            toggleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            toggleButton.heightAnchor.constraint(equalToConstant: 25),
            toggleButton.widthAnchor.constraint(equalToConstant: 25)
        ])
        toggleButton.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func expand() {
        if isExpanded { return }
        adjustDetailViewHeight()
        isExpanded = !isExpanded
        self.toggleButton.setTitle("-", for: .normal)
    }
    
    @objc func tapped() {
        isExpanded ? collapse() : expand()
        self.didToggle?(self)
    }
    
    @objc func toggle() {
        isExpanded ? collapse() : expand()
        self.didToggle?(self)
    }
    
    private func addDetailView() {
        NSLayoutConstraint.activate([
            expandedView.topAnchor.constraint(equalTo: self.topAnchor),
            expandedView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            expandedView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            expandedView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        layoutIfNeeded()
        
    }
    
    private func adjustDetailViewHeight() {
        UIView.animate(withDuration: 0.2) {
            self.expandedView.removeConstraint(self.expandedViewHeightConstriant!)
            self.expandedView.layoutIfNeeded()
            self.expandedView.alpha = self.expandedView.alpha == 0 ? 1 : 0
            self.collapsedView.alpha = self.collapsedView.alpha == 0 ? 1 : 0
        }
    }
    
    func collapse() {
        if !isExpanded {return}
        isExpanded = !isExpanded
        self.toggleButton.setTitle("+", for: .normal)
        UIView.animate(withDuration: 0.2) {
            self.expandedView.addConstraint(self.expandedViewHeightConstriant!)
            self.layoutIfNeeded()
            self.expandedView.alpha = self.expandedView.alpha == 0 ? 1 : 0
            self.collapsedView.alpha = self.collapsedView.alpha == 0 ? 1 : 0
        }
    }
}

