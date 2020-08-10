//
//  SegmentBundle.swift
//  DribbleEffect
//
//  Created by Dayanand Ramasamy on 09/08/20.
//  Copyright © 2020 Dayanand Ramasamy. All rights reserved.
//

import UIKit

class SegmentBundle {

    let expandedView: UIView
    
    let collapsedView: UIView
    
    let ctaText: String?
    
    let ctaActionCallback: (() -> Void)?
    
    let segment: Segment
    
    
    init (expandedView: UIView,
          collapsedView: UIView,
          ctaText: String? = nil,
          ctaActionCallback: (() -> Void)?,
          toggleButton: UIButton?,
          toggleButtonCallBack: ((SegmentState) -> Void)?) {
        self.expandedView = expandedView
        self.collapsedView = collapsedView
        self.ctaText = ctaText
        self.ctaActionCallback = ctaActionCallback
        self.segment = Segment(collapsedView: collapsedView,
                               expandedView: expandedView,
                               toggleButton: toggleButton,
                               toggleButtonCallBack: toggleButtonCallBack)
    }
    
}
