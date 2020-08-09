//
//  ViewController.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 08/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var stackView: StackView =  {
//        let previewView = PreviewView1(frame: .zero)
//        let detailView = DetailView1(frame: .zero)
//        let stackView = StackView(previewView: previewView, detailView: detailView)
//        return stackView
//    }()
    
//    var stackView: StackView =  {
//        let previewView = PreviewView(frame: .zero)
//        let detailView = DetailView(frame: .zero)
//        let stackView = StackView(previewView: previewView, detailView: detailView)
//        return stackView
//    }()
//
    
    var stackContainerView: SegmentContainerView = {
        let previewView = PreviewView(frame: .zero)
        let detailView = DetailView(frame: .zero)
//        let stackView1 = Segment(collapsedView: previewView, expandedView: detailView)
        
        let previewView2 = PreviewView1(frame: .zero)
        let detailView2 = DetailView1(frame: .zero)
//        let stackView2 = Segment(collapsedView: previewView2, expandedView: detailView2)
        
        let collapsedNameView = CollapsedNameView(frame: .zero)
        let expandedNameView = ExpandedNameView(frame: .zero)
        
        let collapsedAgeView = CollapsedAgeView(frame: .zero)
        let expandedAgeView = ExpandedAgeView(frame: .zero)
        
        let previewView3 = PreviewView(frame: .zero)
        let detailView3 = DetailView(frame: .zero)
        
        return SegmentContainerView(segmentBundles: [
            SegmentBundle(expandedView: expandedNameView, collapsedView: collapsedNameView, ctaText: "Add Name", ctaActionCallback: {
                 
                 collapsedNameView.data = "Name: \(expandedNameView.firstNameTextField.text ?? "")  ,  \(expandedNameView.lastNameTextField.text ?? "")"
             }),
//            SegmentBundle(expandedView: detailView, collapsedView: previewView, ctaText: "Name", ctaActionCallback: nil),
//            SegmentBundle(expandedView: detailView2, collapsedView: previewView2, ctaText: "Test", ctaActionCallback: nil),
//            SegmentBundle(expandedView: detailView3, collapsedView: previewView3, ctaText: "Name", ctaActionCallback: nil)
            SegmentBundle(expandedView: expandedAgeView, collapsedView: collapsedAgeView, ctaText: "Add Age", ctaActionCallback: {
                collapsedAgeView.data = "Age: \(expandedAgeView.dayTextField.text ?? "") \(expandedAgeView.monthTextField.text ?? "" )/\(expandedAgeView.yearTextField.text ?? "")"
            })
        ])
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        var topConstant
        
        self.view.backgroundColor = .white
        self.view.addSubview(stackContainerView)
        stackContainerView.translatesAutoresizingMaskIntoConstraints = false
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
//        view2.setContentHuggingPriority(., for: <#T##NSLayoutConstraint.Axis#>)
        
        self.view.addSubview(uiStackView)
//        uiStackView.addArrangedSubview(view2)
        uiStackView.addArrangedSubview(stackContainerView)
//        uiStackView.addArrangedSubview(button)
//        uiStackView.addArrangedSubview(button2)
//        uiStackView.addArrangedSubview(view)
        
        NSLayoutConstraint.activate([
            uiStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            uiStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            uiStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            uiStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
//            uiStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            uiStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
    }

    
    @objc func buttonTapped() {
//        stackView.expand()
    }
    
    @objc func buttonTapped2() {
//        stackView.collapse()
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
    
    func setupAStack(stackView: Segment) {
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

