//
//  UIViewController+Compatible.swift
//  JoUIKit
//
//  Created by Django Lee on 06/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

extension JoUIKit where Base: UIViewController {
    
    public func addChildViewController(_ childController: UIViewController, frame: CGRect? = nil) {
        base.addChildViewController(childController)
        base.view.addSubview(childController.view)
        if let frame = frame {
            childController.view.frame = frame
        }
        childController.didMove(toParentViewController: base)
    }

    public func removeFromParentViewController() {
        base.willMove(toParentViewController: nil)
        base.view.removeFromSuperview()
        base.removeFromParentViewController()
    }
}