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
        
        /*
         Add navbar  to controller through storyboard and replace the selector method with panWithNavbar
         
         */
//        panGR = UIPanGestureRecognizer(target: self, action: #selector(panWithNavbar))

        panGR.delegate = self
        
        view.backgroundColor = UIColor.white
        view.addGestureRecognizer(panGR)
        tableView.bouncesZoom = false
        
        headerView()

        
    }
    
    func headerView(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 84))
        
        let button:UIButton = UIButton(frame: CGRect(x: 20, y: 10, width: 50, height: 40))
        button.setTitle("Back", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action:#selector(dismissVc), for: .touchUpInside)
        header.addSubview(button)
        
        let label = UILabel(frame: CGRect(x: 20, y: 50, width: 300, height: 44))
        label.text = "Your Detail Page"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        header.addSubview(label)
        
        tableView.tableHeaderView = header
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



