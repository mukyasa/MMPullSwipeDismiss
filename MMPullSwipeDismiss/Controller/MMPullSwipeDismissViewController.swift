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
    
    var panGR = UIPanGestureRecognizer()
    var progressBool : Bool = false
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        let camera = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVc))
        self.navigationItem.leftBarButtonItem = camera
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        panGR.addTarget(self, action: #selector(pan))
        panGR.delegate = self
        view.backgroundColor = UIColor.white
        view.addGestureRecognizer(panGR)
        
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



