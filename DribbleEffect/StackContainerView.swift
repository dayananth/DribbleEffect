//
//  StackContainerView.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit


class StackContainerView: UIView {
    
    let stackView: UIStackView =  {
        let uiStackView = UIStackView(frame: .zero)
        uiStackView.translatesAutoresizingMaskIntoConstraints = false
        uiStackView.distribution = .fill
        uiStackView.axis = .vertical
        uiStackView.spacing = 16.0
        return uiStackView
    }()
    
    let stackViews: [StackView]
    
    init(stackViews: [StackView]) {
        self.stackViews = stackViews
        super.init(frame: .zero)
//        var prevView:UIView? = nil
        
//        for view in stackViews {
//            view.translatesAutoresizingMaskIntoConstraints = false
//            self.addSubview(view)
//            if prevView == nil {
//                view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive =  true
//            } else {
//                view.topAnchor.constraint(equalTo: prevView!.bottomAnchor, constant: 16.0)
//            }
//            NSLayoutConstraint.activate([
////                view.topAnchor.constraint(equalTo: prevView.topAnchor, constant: 0),
//                view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
//                view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16.0),
//            ])
//            view.setContentHuggingPriority(.defaultHigh, for: .vertical)
//            view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
//            prevView = view
//        }
//        if let prevView = prevView {
//            prevView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0).isActive = true
//        }
        
        for view in stackViews {
            stackView.addArrangedSubview(view)
            view.didToggle = { [weak self] (view) in
                guard let weakSelf = self else {return}
                for v in weakSelf.stackViews {
                    if v != view {
                        v.collapse()
                    }
                }
            }
        }
        
        stackView.addArrangedSubview(stackViews[0])
        stackView.addArrangedSubview(stackViews[1])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
//            return nil;
//        }
//
//        if self.point(inside: point, with: event) {
//            for subview in self.subviews {
//                let convertedPoint = subview.convert(point, from: self)
//                let hitTestView = subview.hitTest(convertedPoint, with: event)
//                if let hitTestView = hitTestView as? StackView {
//                    hitTestView.expand()
//                    return hitTestView
//                }
//            }
//
//            return self
//        }
//        return nil
//    }
}
