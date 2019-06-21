//
//  newsDetailsViewController.swift
//  NEWS
//
//  Created by Vandana Mittal on 6/17/19.
//  Copyright © 2019 Rohan Mittal. All rights reserved.
//

import UIKit

class newsDetailsViewController: UIViewController {

    @IBOutlet weak var transparentBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        transparentBar.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
