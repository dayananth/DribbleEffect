//
//  SegmentContainerView.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class SegmentContainerView: UIView {
    
    private let stackView: UIStackView =  {
        let uiStackView = UIStackView(frame: .zero)
        uiStackView.translatesAutoresizingMaskIntoConstraints = false
        uiStackView.distribution = .fill
        uiStackView.axis = .vertical
        uiStackView.spacing = 16.0
        return uiStackView
    }()
    
    private var currentSelectedIndex = -1
    private var ctaButton: UIButton?
    
    private let segmentBundles : [SegmentBundle]
    
    init(segmentBundles: [SegmentBundle], ctaButton: UIButton? = nil) {
        self.segmentBundles = segmentBundles
        self.ctaButton = ctaButton
        super.init(frame: .zero)
        setupView()
    }
    
    
    private func setupView() {
        
        if segmentBundles.count == 0 {
            return
        }
        
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
                        if let ctaText = v.ctaText {
                            weakSelf.ctaButton?.setTitle(ctaText, for: .normal)
                        }
                    }
                    index += 1
                }
            }
        }
        
        ctaButton?.translatesAutoresizingMaskIntoConstraints = false
        ctaButton?.setTitle(segmentBundles[0].ctaText, for: .normal)
        ctaButton?.addTarget(self, action: #selector(ctaButtonTapped), for: .touchUpInside)
        ctaButton?.setContentCompressionResistancePriority(.required, for: .vertical)
        
        for segmentBundle in segmentBundles {
            stackView.addArrangedSubview(segmentBundle.segment)
        }
        stackView.addArrangedSubview(UIView())
        if let ctaButton = ctaButton {
            stackView.addArrangedSubview(ctaButton)
        }

        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
           ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func ctaButtonTapped() {
        segmentBundles[currentSelectedIndex].ctaActionCallback?()
        if currentSelectedIndex + 1 < segmentBundles.count {
            ctaButton?.setTitle(segmentBundles[currentSelectedIndex+1].ctaText, for: .normal)
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
