//
//  UIView+SupportingLoad.swift
//  JoUIKit
//
//  Created by Django Lee on 06/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

extension UIView {
    
    private static var supportingLoadViewToken: CChar = 0
    private static var onceToken: Int = 0
    
    internal override func jo_supportingLoadView() {
        
        jo_supportingLoadView()

        guard Thread.main == Thread.current else { return }
        
        let initializationCompletion = objc_getAssociatedObject(self, &UIView.supportingLoadViewToken) as? Bool
        guard window != nil, initializationCompletion == nil else { return }
        objc_setAssociatedObject(self, &UIView.supportingLoadViewToken, true, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        self.jo_prepareLoadView()
        self.jo_setupSubviews()
        self.jo_bindingSubviewsLayout()
        self.jo_setupUI()
    }
    
}
