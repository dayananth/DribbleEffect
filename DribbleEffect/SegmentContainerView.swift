//
//  SegmentContainerView.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class SegmentContainerView: UIView {
    
    let stackView: UIStackView =  {
        let uiStackView = UIStackView(frame: .zero)
        uiStackView.translatesAutoresizingMaskIntoConstraints = false
        uiStackView.distribution = .fill
        uiStackView.axis = .vertical
        uiStackView.spacing = 16.0
        return uiStackView
    }()
    
//    let stackViewsWithCTA: [(stackView: StackView,CTA: String)]
    var currentSelectedIndex = -1
    let button = UIButton(frame: .zero)
    
    let segmentBundles : [SegmentBundle]
    
    init(segmentBundles: [SegmentBundle]) {
        self.segmentBundles = segmentBundles
        super.init(frame: .zero)
        setupView()
    }
    
    
    func setupView() {
        
        for segmentBundle in segmentBundles {
            let segment = segmentBundle.segment
            stackView.addArrangedSubview(segment)
            segment.didToggle = { [weak self] (view) in
                guard let weakSelf = self else {return}
                var index = 0
                for v in weakSelf.segmentBundles {
                    if v.segment != view {
                        v.segment.collapse()
                    } else {
                        weakSelf.currentSelectedIndex = index
                        weakSelf.button.setTitle(v.ctaText, for: .normal)
                    }
                    index += 1
                }
            }
        }
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.setTitle(segmentBundles[0].ctaText, for: .normal)
        button.addTarget(self, action: #selector(ctaButtonTapped), for: .touchUpInside)
        button.setContentCompressionResistancePriority(.required, for: .vertical)
        
        for segmentBundle in segmentBundles {
            stackView.addArrangedSubview(segmentBundle.segment)
        }
//        stackView.addArrangedSubview(segmentBundles[0].segment)
//        stackView.addArrangedSubview(segmentBundles[1].segment)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(button)

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
    
    @objc func ctaButtonTapped() {
        segmentBundles[currentSelectedIndex].ctaActionCallback?()
        if currentSelectedIndex + 1 < segmentBundles.count {
            button.setTitle(segmentBundles[currentSelectedIndex+1].ctaText, for: .normal)
            currentSelectedIndex += 1
            for i in 0..<segmentBundles.count {
                if i != currentSelectedIndex {
                    segmentBundles[i].segment.collapse()
                } else {
                    segmentBundles[i].segment.expand()
                }
            }
        } else if currentSelectedIndex + 1 == segmentBundles.count {
            segmentBundles[currentSelectedIndex].segment.collapse()
        }
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
