//
//  ViewController.swift
//  MMPullSwipeDismiss
//
//  Created by Mukesh on 03/11/17.
//  Copyright © 2017 Mad Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goToDetailAction(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "detail")
        vc.modalPresentationStyle = .overCurrentContext
        vc.isHeroEnabled = true
        vc.heroModalAnimationType = .selectBy(presenting: .cover(direction: .left), dismissing: .uncover(direction: .right))
        self.present(vc, animated: true, completion: nil)
    }
    
}

