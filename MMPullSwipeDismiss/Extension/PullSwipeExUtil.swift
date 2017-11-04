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
    
    @objc func pan(){
        
        var sender : UIView
        if let viewPan = self.navigationController?.view{
            sender = viewPan
        }else{
            sender = view
            
        }
        let translation = panGR.translation(in: nil)
        let progressX = (translation.x / 2 ) / view.bounds.width
        let progressY = (translation.y / 2 ) / view.bounds.height
        switch panGR.state {
        case .began:
            print(tableView.contentOffset.y)
            print(tableView.contentSize.height - tableView.frame.size.height)
            if panGR.direction == .right{
                progressBool = false
                self.navigationController?.heroModalAnimationType = .uncover(direction: .right)
                hero_dismissViewController()
                
            }else if(panGR.direction == .down && tableView.isAtTop){
                progressBool = true
                self.navigationController?.heroModalAnimationType = .uncover(direction: .down)
                hero_dismissViewController()
                
            }else if(panGR.direction == .up && tableView.isAtBottom){
                
                progressBool = true
                self.navigationController?.heroModalAnimationType = .uncover(direction: .up)
                hero_dismissViewController()
                
            }
            else{
                return
            }
            
        case .changed:
            
            if(progressBool){
                
                let currentPos = CGPoint(x: view.center.x , y: translation.y + view.center.y)
                Hero.shared.update(progressY)
                Hero.shared.apply(modifiers: [.position(currentPos)], to: sender)
                
                
            }else{
                
                if(translation.x > 0){
                    let currentPos = CGPoint(x: translation.x + view.center.x , y: view.center.y)
                    Hero.shared.update(progressX)
                    Hero.shared.apply(modifiers: [.position(currentPos)], to: sender)
                }
                
                
                
            }
            
            
        default:
            if fabs(progressY + panGR.velocity(in: nil).y / view.bounds.height ) > 0.5 {
                Hero.shared.finish()
            }
            else if progressX + panGR.velocity(in: nil).x / view.bounds.width > 0.4 {
                Hero.shared.finish()
            }
            else {
                Hero.shared.cancel()
                self.navigationController?.heroModalAnimationType = .uncover(direction: .right)
                
            }
            
        }
    }
    
}
