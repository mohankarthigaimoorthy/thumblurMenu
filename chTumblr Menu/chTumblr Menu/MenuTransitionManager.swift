//
//  MenuTransitionManager.swift
//  chTumblr Menu
//
//  Created by Imcrinox Mac on 18/12/1444 AH.
//

import Foundation
import UIKit
 
class MenuTransitionManager: NSObject {
    
    private var presenting = false
    
    func offstage(_ amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: amount, y: 0)
    }
    
    func offStageMenuController(_ mainviewController: mainViewController) {
        if !presenting{
            mainviewController.view.alpha = 0
        }
        
        let topRowOffset : CGFloat = 300
        let middleRowOffset : CGFloat = 150
        let bottomRowOffset : CGFloat = 50
        
        mainviewController.textBtn.transform = self.offstage(-topRowOffset)
        mainviewController.textLbl.transform = self.offstage(-topRowOffset)
        
        mainviewController.quoteBtn.transform = self.offstage(-middleRowOffset)
        mainviewController.quoteLbl.transform = self.offstage(-middleRowOffset)
        
        mainviewController.chatBtn.transform = self.offstage(-bottomRowOffset)
        mainviewController.chatLbl.transform = self.offstage(-bottomRowOffset)
        
        mainviewController.photoBtn.transform = self.offstage(topRowOffset)
        mainviewController.photoLbl.transform = self.offstage(topRowOffset)
        
        mainviewController.linkBtn.transform = self.offstage(middleRowOffset)
        mainviewController.linkLbl.transform = self.offstage(middleRowOffset)
        
        mainviewController.musicBtn.transform = self.offstage(bottomRowOffset)
        mainviewController.musicLbl.transform = self.offstage(bottomRowOffset)
    }
    
    func onStageMenuController(_ mainviewController: mainViewController)
    {
        mainviewController.view.alpha = 1
        
        mainviewController.textBtn.transform = .identity
        mainviewController.textLbl.transform = .identity
        mainviewController.quoteBtn.transform = .identity
        mainviewController.quoteLbl.transform = .identity
        mainviewController.chatBtn.transform = .identity
        mainviewController.chatLbl.transform = .identity
        mainviewController.photoBtn.transform = .identity
        mainviewController.photoLbl.transform = .identity
        mainviewController.linkBtn.transform = .identity
        mainviewController.linkLbl.transform = .identity
        mainviewController.musicBtn.transform = .identity
        mainviewController.musicLbl.transform = .identity
    }
}

extension MenuTransitionManager : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
}


extension MenuTransitionManager : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let screen: (from:UIViewController, to:UIViewController) = (transitionContext.viewController(forKey: .from)!, transitionContext.viewController(forKey: .to)!)
        let mainviewController  = !self.presenting ? screen.from as! mainViewController : screen.to as!
        mainViewController
        let bottomViewController = !self.presenting ? screen.to as UIViewController : screen.from as UIViewController
        
        let menuView: UIView! = mainviewController.view
        let bottomView: UIView! = bottomViewController.view
        
        if (self.presenting) {
            self.offStageMenuController(mainviewController)
        }
        
        container.addSubview(bottomView)
        container.addSubview(menuView)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [],animations: {
            if (self.presenting) {
                self.onStageMenuController(mainviewController)
                
            }
            else {
                self.offStageMenuController(mainviewController)
            }
        }, completion: {
            finished in
            transitionContext.completeTransition(true)
            let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .compactMap({$0 as? UIWindowScene})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            keyWindow?.endEditing(true)

        })
    }
    
    
}
