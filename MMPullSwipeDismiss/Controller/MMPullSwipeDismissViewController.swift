//
//  MMPullSwipeDismissViewController.swift
//  MMPullSwipeDismiss
//
//  Created by Mukesh on 03/11/17.
//  Copyright © 2017 Mad Apps. All rights reserved.
//

import UIKit
import Hero

class MMPullSwipeDismissViewController: UITableViewController {
    
    var panGR : UIPanGestureRecognizer!
    var progressBool : Bool = false
    var dismissBool : Bool = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        panGR = UIPanGestureRecognizer(target: self, action: #selector(pan))
        panGR.delegate = self
        
        view.backgroundColor = UIColor.white
        view.addGestureRecognizer(panGR)
        tableView.bouncesZoom = false

        
    }

    @objc func dismissVc(){
        hero_dismissViewController()
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}


extension MMPullSwipeDismissViewController : UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{

        return true
    }
}



