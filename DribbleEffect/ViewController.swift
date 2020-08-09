//
//  ViewController.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 08/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: StackView =  {
        let previewView = PreviewView1(frame: .zero)
        let detailView = DetailView1(frame: .zero)
        let stackView = StackView(previewView: previewView, detailView: detailView)
        return stackView
    }()
    
//    var stackView: StackView =  {
//        let previewView = PreviewView(frame: .zero)
//        let detailView = DetailView(frame: .zero)
//        let stackView = StackView(previewView: previewView, detailView: detailView)
//        return stackView
//    }()
//
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        var topConstant
        
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Expan", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setContentCompressionResistancePriority(.required, for: .vertical)
        
        
        let button2 = UIButton(frame: .zero)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.backgroundColor = .red
        button2.setTitleColor(.black, for: .normal)
        button2.setTitle("Collapse", for: .normal)
        button2.addTarget(self, action: #selector(buttonTapped2), for: .touchUpInside)
        button2.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.setContentCompressionResistancePriority(.required, for: .vertical)
        
        stackView.setContentCompressionResistancePriority(.required, for: .vertical)
        
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
//        view2.setContentHuggingPriority(., for: <#T##NSLayoutConstraint.Axis#>)
        
        self.view.addSubview(uiStackView)
        uiStackView.addArrangedSubview(view2)
        uiStackView.addArrangedSubview(stackView)
        uiStackView.addArrangedSubview(button)
        uiStackView.addArrangedSubview(button2)
        uiStackView.addArrangedSubview(view)
        
        NSLayoutConstraint.activate([
            uiStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            uiStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            uiStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            uiStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            uiStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            uiStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
    }

    
    @objc func buttonTapped() {
        stackView.expand()
    }
    
    @objc func buttonTapped2() {
        stackView.collapse()
    }

}

class StackView: UIView {
    
    let previewView: UIView
    let detailView: UIView
    var heightConstraint: NSLayoutConstraint?
    var expandedHeight:CGFloat = 0
    var collapsedHeight:CGFloat = 0
    var detailViewHeightConstriant: NSLayoutConstraint?
    
    init(previewView: UIView, detailView: UIView) {
        self.previewView = previewView
        self.detailView = detailView
//        self.detailView.alpha = 0
//        self.previewView.alpha = 1
        super.init(frame: .zero)
        self.addSubview(previewView)
        self.addSubview(detailView)
        previewView.translatesAutoresizingMaskIntoConstraints = false
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.alpha = 0
        
        detailViewHeightConstriant = detailView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            previewView.topAnchor.constraint(equalTo: self.topAnchor),
            previewView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            previewView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            previewView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            detailView.topAnchor.constraint(equalTo: self.topAnchor),
            detailView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            detailView.heightAnchor.constraint(equalToConstant: 0)
            detailViewHeightConstriant!
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: previewView.frame.height)
//        heightConstraint.isActive = true
    }

    
    func expand() {
//        previewView.alpha = 0
//        detailView.alpha = 1
        if collapsedHeight == 0 {
            collapsedHeight = self.frame.height
        }
        if expandedHeight > 0 {
//            heightConstraint!.constant = expandedHeight
        } else {
//            addDetailView()
            adjustDetailViewHeight()
//            expandedHeight = self.frame.height
        }
//        previewView.isHidden = true
//        detailView.isHidden = false
        
//        UIView.animate(withDuration: 0.2) {
////            self.detailView.isHidden = !self.detailView.isHidden
////            self.previewView.isHidden = !self.previewView.isHidden
//            self.detailView.alpha = self.detailView.alpha == 0 ? 1 : 0
//            self.previewView.alpha = self.previewView.alpha == 0 ? 1 : 0
//        }
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
        
//        let view = UIView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        let detailViewCopy = detailView.copy() as? UIView
      
        UIView.animate(withDuration: 0.2) {
            self.detailView.removeConstraint(self.detailViewHeightConstriant!)
            self.detailView.layoutIfNeeded()
            self.detailView.alpha = self.detailView.alpha == 0 ? 1 : 0
            self.previewView.alpha = self.previewView.alpha == 0 ? 1 : 0
        }
        
        
    }
    
    func collapse() {
//        previewView.alpha = 1
//        detailView.alpha = 0
//        if self.heightConstraint != nil {
//            self.removeConstraint(self.heightConstraint!)
//        }
//        if self.heightConstraint == nil {
//            self.heightConstraint = self.heightAnchor.constraint(equalToConstant: collapsedHeight)
//            self.heightConstraint!.isActive = true
//            self.addConstraint(self.heightConstraint!)
//        } else {
//            self.heightConstraint?.constant = collapsedHeight
//        }
        UIView.animate(withDuration: 0.2) {
//            self.detailView.isHidden = !self.detailView.isHidden
//            self.previewView.isHidden = !self.previewView.isHidden
            self.detailView.addConstraint(self.detailViewHeightConstriant!)
            self.layoutIfNeeded()
            self.detailView.alpha = self.detailView.alpha == 0 ? 1 : 0
            self.previewView.alpha = self.previewView.alpha == 0 ? 1 : 0
        }
    }
}

typealias ViewsTuple = (previewView: UIView, detailView: UIView)

class StackContainer: UIView {
    
    init(viewTuples: [ViewsTuple]) {
        super.init(frame: .zero)
        var topConstant = 20
        for tuple in viewTuples {
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAStack(stackView: StackView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
    }
    
}



public func createAStack() -> [(UIView, UIView)] {
    
    var previewViewColors: [UIColor] = [.red, .black, .brown, .blue]
    var detailViewColors: [UIColor] = [.cyan, .darkGray, .blue, .green]
    var detailViewColorsHeights: [CGFloat] = [400, 500, 350, 600]
    
    var uiViews = [(UIView, UIView)]()
    for i in 0..<4 {
        
        let uiView = UIView(frame: .zero)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = previewViewColors[i]
        
        let detailView = UIView(frame: .zero)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.backgroundColor = detailViewColors[i]
        
        uiViews.append((uiView, detailView))
    }
    
    return uiViews
}

