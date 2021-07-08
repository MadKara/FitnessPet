//
//  ParametersTransitioningDelegate.swift
//  FitnessPet
//
//  Created by intern on 04.07.2021.
//

import UIKit

class ParametersTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    let inset: CGFloat
    
    init(inset: CGFloat) {
        self.inset = inset
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return ParametersPresentationController(inset: inset, presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ParametersTransitioningAnimationController(isPresenting: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ParametersTransitioningAnimationController(isPresenting: false)
    }
}
