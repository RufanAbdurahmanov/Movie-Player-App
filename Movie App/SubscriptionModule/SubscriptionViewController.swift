//
//  SubscriptionViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 16.06.22.
//

import UIKit

class SubscriptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0.09000000358, green: 0.1099999994, blue: 0.1330000013, alpha: 1)
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func subscribeButton(_ sender: Any) {
        print("subscribe tapped")
        self.dismiss(animated: true)
    }
    

}
