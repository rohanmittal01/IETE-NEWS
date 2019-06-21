//
//  sideMeniTableViewController.swift
//  NEWS
//
//  Created by Vandana Mittal on 6/12/19.
//  Copyright © 2019 Rohan Mittal. All rights reserved.
//

import UIKit

class sideMeniTableViewController: UITableViewController {

    
    @IBOutlet var menu: UITableView!
    var menuArray = ["Add Post", "Read news","About us", "Contact us","Settings"]
    var indexPos=0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menu.delegate=self
        menu.dataSource=self
        
        tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor.init(red: 127/255, green: 216/255, blue: 86/255, alpha: 1.0)    // UIColor.init(red: 192/255, green: 1.0, blue: 157/255, alpha: 1.0) 
        
     //adding background image to sideMenu
    //    bgImage()
        navbarShadow()
        navbarImage()
     //   sidemenuShadow()
    //    navbarImage()
    }
    
    func bgImage()
    {
        
        let bgImage = UIImage(named: "ietelogo")
        let imageView = UIImageView(image: bgImage)
        self.menu.backgroundView = imageView
        imageView.contentMode = .scaleAspectFit

    }
    
    
    func navbarShadow()
    {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    }
    
    func sidemenuShadow()
    {
        menu.layer.shadowRadius = 5
        menu.layer.shadowOpacity = 1
    }
    
    func navbarImage()
    {
        let navController = navigationController!
        let image = #imageLiteral(resourceName: "ietelogo")
        let imageView = UIImageView(image: image)
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        let bannerX = bannerWidth/2 - image.size.width/2
        let bannerY = bannerHeight/2 - image.size.height/2
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray
        cell.textLabel?.textColor = .white
        cell.textLabel?.text=menuArray[indexPath.row]
        
        // Configure the cell...
        
        return cell
    }
    
    
  

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        indexPos=indexPath.row

        if(indexPos==0)
        {
            self.performSegue(withIdentifier: "1", sender: self)
            
        }
        else if(indexPos==1)
        {
            self.performSegue(withIdentifier: "2", sender: self)
        }
        else if(indexPos==2)
        {
            self.performSegue(withIdentifier: "3", sender: self)
        }
        else if(indexPos==3)
        {
            self.performSegue(withIdentifier: "4", sender: self)
        }
        else if(indexPos==4)
        {
            self.performSegue(withIdentifier: "5", sender: self)
        }
        
        
    
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.backgroundColor = UIColor.clear
     
        
    }
    
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
