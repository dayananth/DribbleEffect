//
//  StackView.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class StackView: UIView {
    
    let previewView: UIView
    let detailView: UIView
    var heightConstraint: NSLayoutConstraint?
    var detailViewHeightConstriant: NSLayoutConstraint?
    var isExpanded: Bool = false
    var didToggle: ((UIView) -> Void)?
    
    init(previewView: UIView, detailView: UIView) {
        self.previewView = previewView
        self.detailView = detailView
        super.init(frame: .zero)
        self.addSubview(previewView)
        self.addSubview(detailView)
        previewView.translatesAutoresizingMaskIntoConstraints = false
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.alpha = 0
        
        detailViewHeightConstriant = detailView.heightAnchor.constraint(equalToConstant: 0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            previewView.topAnchor.constraint(equalTo: self.topAnchor),
            previewView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            previewView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            previewView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            detailView.topAnchor.constraint(equalTo: self.topAnchor),
            detailView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            detailViewHeightConstriant!
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func expand() {
        if isExpanded { return }
        adjustDetailViewHeight()
        isExpanded = !isExpanded
    }
    
    @objc func tapped() {
        isExpanded ? collapse() : expand()
        self.didToggle?(self)
    }
    
    private func addDetailView() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: self.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        layoutIfNeeded()
        
    }
    
    private func adjustDetailViewHeight() {
        UIView.animate(withDuration: 0.2) {
            self.detailView.removeConstraint(self.detailViewHeightConstriant!)
            self.detailView.layoutIfNeeded()
            self.detailView.alpha = self.detailView.alpha == 0 ? 1 : 0
            self.previewView.alpha = self.previewView.alpha == 0 ? 1 : 0
        }
    }
    
    func collapse() {
        if !isExpanded {return}
        isExpanded = !isExpanded
        UIView.animate(withDuration: 0.2) {
            self.detailView.addConstraint(self.detailViewHeightConstriant!)
            self.layoutIfNeeded()
            self.detailView.alpha = self.detailView.alpha == 0 ? 1 : 0
            self.previewView.alpha = self.previewView.alpha == 0 ? 1 : 0
        }
    }
}

