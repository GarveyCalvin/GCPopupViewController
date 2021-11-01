//
//  UIViewController+GCPopupViewController.swift
//  SwiftDemo
//
//  Created by GarveyCalvin on 2021/10/29.
//  Copyright © 2021 GarveyCalvin. All rights reserved.
//

import UIKit

enum GCPopupViewAnimation {
    case fade
}

private var kName = "\0"
private var kBackgraoundViewName: UInt8 = 0
private var kOverlayViewName: UInt8 = 0
private var kDuration = 0.35

extension UIViewController {
    private var overlayView: UIView! {
        get {
            return objc_getAssociatedObject(self, &kOverlayViewName) as? UIView
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kOverlayViewName, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var popupViewController: UIViewController? {
        get {
            return objc_getAssociatedObject(self, &kName) as? UIViewController
        }
        set {
            objc_setAssociatedObject(self, &kName, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var backgroundView: UIView? {
        get {
            return objc_getAssociatedObject(self, &kBackgraoundViewName) as? UIView
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kBackgraoundViewName, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func gc_presentPopupViewController(popupViewController: UIViewController, animationType: GCPopupViewAnimation) {
        if (self.popupViewController != nil) {
            debugPrint("不能 present 多个视图")
            return
        }
        self.popupViewController = popupViewController
        
        let source = self.view!
        self.overlayView = UIView()
        self.overlayView.frame = source.frame
        
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        self.backgroundView?.frame = popupViewController.view.frame
        
        source.addSubview(self.overlayView)
        self.overlayView.addSubview(popupViewController.view)
        
        if (animationType == .fade) {
            fadeIn(popupView: popupViewController.view)
        }
    }
    
    func gc_dismissPopupViewController(animationType: GCPopupViewAnimation) {
        if (animationType == .fade) {
            fadeOut(popupView: popupViewController!.view)
        }
    }
    
    private func fadeIn(popupView: UIView) {
        popupView.alpha = 0
        self.overlayView.alpha = 0
        UIView.animate(withDuration: kDuration, delay: 0, options: .curveEaseOut) {
            popupView.alpha = 1
            self.overlayView.alpha = 1
        } completion: { _ in
        }
    }
    
    private func fadeOut(popupView: UIView) {
        UIView.animate(withDuration: kDuration, delay: 0, options: .curveEaseOut) {
            popupView.alpha = 0
            self.overlayView.alpha = 0
        } completion: { _ in
            popupView.removeFromSuperview()
            self.overlayView.removeFromSuperview()
            self.popupViewController = nil
        }
    }
    
    private func topView() -> UIView {
        var recentVC: UIViewController? = self
        while recentVC?.parent != nil {
            recentVC = recentVC?.parent
        }
        return recentVC!.view
    }
}
