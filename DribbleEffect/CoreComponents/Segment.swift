//
//  StackView.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

enum SegmentState {
    case expanded
    case collapsed
}

final class Segment: UIView {
    
    private let collapsedView: UIView
    private let expandedView: UIView
    private var expandedViewHeightConstriant: NSLayoutConstraint?
    var isExpanded: Bool = false
    var didToggle: ((UIView) -> Void)?
    var toggleButton: UIButton = {
        
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
        
    }()
    
    private var toggleButtonCallback: ((SegmentState) -> Void)?
    
    typealias  PaddingTuple = (top: CGFloat, bottom: CGFloat, right: CGFloat, left: CGFloat)
    
    init(collapsedView: UIView,
         expandedView: UIView,
         paddingTuple: PaddingTuple = (8,8,16,16),
         toggleButton: UIButton? = nil,
         toggleButtonCallBack: ((SegmentState) -> Void)? = nil) {
        self.collapsedView = collapsedView
        self.expandedView = expandedView
        if let toggleButton = toggleButton {
            self.toggleButton = toggleButton
            self.toggleButton.translatesAutoresizingMaskIntoConstraints = false
            self.toggleButtonCallback = toggleButtonCallBack
        }
        super.init(frame: .zero)
        
        setup(paddingTuple: paddingTuple)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup(paddingTuple: PaddingTuple) {
        self.addSubview(collapsedView)
        self.addSubview(expandedView)
        collapsedView.translatesAutoresizingMaskIntoConstraints = false
        expandedView.translatesAutoresizingMaskIntoConstraints = false
        expandedView.alpha = 0
        
        expandedViewHeightConstriant = expandedView.heightAnchor.constraint(equalToConstant: 0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            collapsedView.topAnchor.constraint(equalTo: self.topAnchor, constant:  paddingTuple.top),
            collapsedView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -paddingTuple.bottom),
            collapsedView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:  paddingTuple.left),
            collapsedView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -paddingTuple.right * 3),
            expandedView.topAnchor.constraint(equalTo: self.topAnchor, constant:  paddingTuple.top),
            expandedView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant:  -paddingTuple.bottom),
            expandedView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:  paddingTuple.left),
            expandedView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -paddingTuple.right * 3),
            expandedViewHeightConstriant!
        ])
        
        addSubview(toggleButton)
        NSLayoutConstraint.activate([
            toggleButton.topAnchor.constraint(equalTo: self.topAnchor, constant: paddingTuple.top),
            toggleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -paddingTuple.right),
            toggleButton.heightAnchor.constraint(equalToConstant: 25),
            toggleButton.widthAnchor.constraint(equalToConstant: 25)
        ])
        toggleButton.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
    }
    
    func expand() {
        if isExpanded { return }
        adjustDetailViewHeight()
        isExpanded = !isExpanded
        
        if self.toggleButtonCallback != nil {
            self.toggleButtonCallback?(.expanded)
        } else {
            self.toggleButton.setTitle("-", for: .normal)
        }
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
        if toggleButtonCallback != nil {
            toggleButtonCallback?(.collapsed)
        } else {
            self.toggleButton.setTitle("+", for: .normal)
        }
        UIView.animate(withDuration: 0.2) {
            self.expandedView.addConstraint(self.expandedViewHeightConstriant!)
            self.layoutIfNeeded()
            self.expandedView.alpha = self.expandedView.alpha == 0 ? 1 : 0
            self.collapsedView.alpha = self.collapsedView.alpha == 0 ? 1 : 0
        }
    }
}

