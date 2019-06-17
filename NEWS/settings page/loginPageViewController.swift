//
//  loginPageViewController.swift
//  NEWS
//
//  Created by Vandana Mittal on 6/16/19.
//  Copyright © 2019 Rohan Mittal. All rights reserved.
//

import UIKit


class loginPageViewController: UIViewController {

    
    @IBOutlet var blankView: UIView!
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        submitButtonSetting()
        blankViewSetting()
        registerButtonSetting()
        
    }
    
    func blankViewSetting()
    {
        blankView.layer.cornerRadius = blankView.frame.height/16
        blankView.layer.shadowColor = UIColor.black.cgColor
        blankView.layer.shadowRadius = 15.0
        blankView.layer.shadowOpacity = 0.6
        
    }
    
    func submitButtonSetting()
    {
        submit.layer.cornerRadius = submit.frame.height/3
        submit.layer.shadowColor = UIColor.darkGray.cgColor
    }
    
    func registerButtonSetting()
    {
        register.layer.cornerRadius = register.frame.height/3
        register.layer.shadowColor = UIColor.darkGray.cgColor
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
