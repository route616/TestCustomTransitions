//
//  AnimationController.swift
//  TestCustomTransitions
//
//  Created by Игорь on 21.05.2021.
//

import UIKit

class AnimationController: NSObject {
    private let animationDuration: TimeInterval = 0.3
    private var animationType: AnimationType

    private let resizeRatio: CGFloat = 0.678
    private let modRotationAngle: CGFloat = 345.0 * CGFloat.pi / 180.0
    private let offsetRatio: CGFloat = 167.09 / 375

    enum AnimationType {
        case present
        case dismiss
    }

    init(animationType: AnimationType) {
        self.animationType = animationType
    }

    private func presentAnimate(
        with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView
    ) {
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(rotationAngle: modRotationAngle)
            .concatenating(CGAffineTransform(scaleX: resizeRatio, y: resizeRatio))
            .concatenating(
                CGAffineTransform(translationX: viewToAnimate.frame.width * offsetRatio, y: 0)
            )
        viewToAnimate.layer.cornerRadius = 30

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            viewToAnimate.transform = .identity
            viewToAnimate.layer.cornerRadius = 0
        }) { _ in
            transitionContext.completeTransition(true)
        }
    }

    private func dismissAnimate(
        with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView
    ) {
        viewToAnimate.clipsToBounds = true
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            viewToAnimate.transform = CGAffineTransform(rotationAngle: self.modRotationAngle)
                .concatenating(
                    CGAffineTransform(scaleX: self.resizeRatio, y: self.resizeRatio)
                )
                .concatenating(
                    CGAffineTransform(
                        translationX: viewToAnimate.frame.width * self.offsetRatio, y: 0
                    )
                )
            viewToAnimate.layer.cornerRadius = 30
        }) { _ in
//            transitionContext.completeTransition(true)
        }
    }
}

extension AnimationController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
    ) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let fromViewController = transitionContext.viewController(forKey: .from)
        else {
            transitionContext.completeTransition(false)
            return
        }
        switch animationType {
        case .present:
            transitionContext.containerView.addSubview(toViewController.view)
            presentAnimate(with: transitionContext, viewToAnimate: toViewController.view)
        case .dismiss:
            dismissAnimate(with: transitionContext, viewToAnimate: fromViewController.view)
        }
    }
}
