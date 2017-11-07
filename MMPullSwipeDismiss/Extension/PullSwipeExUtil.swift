//
//  PullSwipeExUtil.swift
//  MMPullSwipeDismiss
//
//  Created by Mukesh on 04/11/17.
//  Copyright © 2017 Mad Apps. All rights reserved.
//

import UIKit
import Hero

extension MMPullSwipeDismissViewController {
    
    @objc func pan(recognizer : UIPanGestureRecognizer){
        
        //1. Monitor the translation of view
        let translation = recognizer.translation(in: nil)
        let progressX = (translation.x / 2 ) / view.bounds.width
        let progressY = (translation.y / 2 ) / view.bounds.height
        
        //1. Monitor the direction of view
        if((recognizer.direction == .up && tableView.isAtBottom) || (recognizer.direction == .down && tableView.isAtTop)){
            
            if(dismissBool){
                dismissBool = false
                hero_dismissViewController()
                self.heroModalAnimationType = tableView.isAtTop ? .uncover(direction: .down) : .uncover(direction: .up)
                progressBool = true
                recognizer.setTranslation(.zero, in: view)

            }
            
            
        }else if(recognizer.direction == .left || recognizer.direction == .right){
            
            if(translation.x > 0){
                if(dismissBool){
                    dismissBool = false
                    hero_dismissViewController()
                    self.heroModalAnimationType = .uncover(direction: .right)
                    recognizer.setTranslation(.zero, in: view)

                }
                
            }
            
        }
        //3. Gesture states
        switch recognizer.state {
            //3.1 Gesture states began to check the pan direction the user initiated
        case .began:


          print("began")
            
            //3.2 Gesture state changed to Translate the view according to the user pan gesture
        case .changed:

            
            if(progressBool){

                let currentPos = CGPoint(x: view.center.x , y: translation.y + view.center.y)
                Hero.shared.update(progressY)
                Hero.shared.apply(modifiers: [.position(currentPos)], to: view)

            }else{

                if(translation.x > 0 ){
                    let currentPos = CGPoint(x: translation.x + view.center.x , y: view.center.y)
                    Hero.shared.update(progressX)
                    Hero.shared.apply(modifiers: [.position(currentPos)], to: view)
                    
                }

            }
            
            
            //3.3 Gesture state end to finish the animation
        default:
            dismissBool = true
            progressBool = false
            if fabs(progressY + recognizer.velocity(in: nil).y / view.bounds.height ) > 0.5 {
                Hero.shared.finish()
            }
            else if progressX + recognizer.velocity(in: nil).x / view.bounds.width > 0.5 {
                Hero.shared.finish()
            }
            else {
                Hero.shared.cancel()
                self.heroModalAnimationType = .uncover(direction: .right)
                
            }
            
        }
    }
    
}
