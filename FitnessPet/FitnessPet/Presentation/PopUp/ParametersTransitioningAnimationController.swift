//
//  PopAnimator.swift
//  FitnessPet
//
//  Created by intern on 27.06.2021.
//

import UIKit

class ParametersTransitioningAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    let isPresenting: Bool
    let duration: TimeInterval = 0.5
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresenting ? animatePresentationWithTransitionContext(transitionContext) : animateDismissalWithTransitionContext(transitionContext)
    }
    
    func animatePresentationWithTransitionContext(_ transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        guard
            let presentedController = transitionContext.viewController(forKey: .to),
            let presentedControllerView = transitionContext.view(forKey: .to)
        else {
            return
        }
        presentedControllerView.frame = transitionContext.finalFrame(for: presentedController)
        presentedControllerView.center.y += containerView.bounds.size.height
        let backgroundImage = UIImageView(frame: presentedControllerView.frame)
        backgroundImage.image = UIImage(named: "iPhone 6-7-8 – 54")
        backgroundImage.contentMode = .scaleAspectFill
        presentedControllerView.layer.contents = backgroundImage.image?.cgImage
        presentedControllerView.layer.cornerRadius = 10
        presentedControllerView.layer.masksToBounds = true
        containerView.addSubview(presentedControllerView)
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       options: [.allowUserInteraction, .beginFromCurrentState],
                       animations: {
                        presentedControllerView.center.y += presentedControllerView.frame.height
                       }, completion: { (completed: Bool) -> Void in
                        transitionContext.completeTransition(completed)
                       })
    }
    
    func animateDismissalWithTransitionContext(_ transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let presentedControllerView = transitionContext.view(forKey: .from)
        else {
            return
        }
        
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       options: [.allowUserInteraction, .beginFromCurrentState],
                       animations: {
                        presentedControllerView.alpha = 0
                       }, completion: {(completed: Bool) -> Void in
                        transitionContext.completeTransition(completed)
                       })
    }
    
}
