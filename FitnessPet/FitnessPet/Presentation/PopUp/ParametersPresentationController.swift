//
//  ParametersPresentationController.swift
//  FitnessPet
//
//  Created by intern on 04.07.2021.
//

import UIKit

class ParametersPresentationController: UIPresentationController {
    
    var inset: CGFloat
    
    init(inset: CGFloat, presentedViewController: UIViewController, presenting: UIViewController?) {
        self.inset = inset
        super.init(presentedViewController: presentedViewController, presenting: presenting)
    }
    private lazy var dimmingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        view.alpha = 0.0
        
        return view
    }()
    
    override var frameOfPresentedViewInContainerView: CGRect {
        
        guard let containerView = containerView,
              let presentedView = presentedView else { return .zero }
        let safeAreaFrame = containerView.bounds.inset(by: containerView.safeAreaInsets)
        let targetWidth = safeAreaFrame.width - inset * 2
        let fittingSize = CGSize(width: targetWidth,
                                 height: UIView.layoutFittingCompressedSize.height)
        let targetHeight = presentedView.systemLayoutSizeFitting(fittingSize,
                                                                 withHorizontalFittingPriority: .required,
                                                                 verticalFittingPriority: .defaultLow).height
        var frame = safeAreaFrame
        frame.size.width = targetWidth
        frame.origin.x += inset
        frame.origin.y += inset
        frame.size.height = min(targetHeight, containerView.frame.height - inset * 6)
        
        return frame
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func presentationTransitionWillBegin() {
        if let containerView = containerView {
            containerView.insertSubview(dimmingView, at: 0)
            
            NSLayoutConstraint.activate([
                dimmingView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                dimmingView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                dimmingView.topAnchor.constraint(equalTo: containerView.topAnchor),
                dimmingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        }
        
        dimmingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismiss)))
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1.0
            })
        } else {
            dimmingView.alpha = 1.0
        }
    }
    
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0.0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        })
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    @objc private func dismiss() {
        presentedViewController.dismiss(animated: true)
    }
}
