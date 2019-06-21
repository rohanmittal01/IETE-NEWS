//
//  webViewViewController.swift
//  NEWS
//
//  Created by Vandana Mittal on 6/21/19.
//  Copyright © 2019 Rohan Mittal. All rights reserved.
//

import UIKit
import WebKit

class webViewViewController: UIViewController {

    var url : String = ""
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        display()
        // Do any additional setup after loading the view.
    }
    
    
    func display()
    {
        let url2 = URL(string: url)
        let urlRequest = URLRequest(url: url2!)
        webView.load(urlRequest)
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
