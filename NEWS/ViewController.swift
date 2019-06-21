//
//  ViewController.swift
//  NEWS
//
//  Created by Vandana Mittal on 6/12/19.
//  Copyright © 2019 Rohan Mittal. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {


    
 //   @IBOutlet weak var sliderCollectionView: UIImageView!
    
    
    
  //  @IBOutlet weak var pageView: UIPageControl!
   //var imgArr = [#imageLiteral(resourceName: "star"), #imageLiteral(resourceName: "share"), #imageLiteral(resourceName: "about us 2"), #imageLiteral(resourceName: "feedback")]
    
    
    var articles : [article]? = []
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBOutlet var mainView: UIView!
    
    
    var indexPos = 0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchArticles()
    }
    
    func fetchArticles(){
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=33659ed19d2a4799bf1bd8681c478cb8")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            self.articles = [article]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
                    for articleFromJson in articlesFromJson {
                        let articless = article()
                        if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String {
                            
                            articless.author = author
                            articless.desc = desc
                            articless.headline = title
                            articless.url = url
                            articless.imgUrl = urlToImage
                            
                            
                            
                            self.urlString = (articleFromJson["url"] as? String)!
                        }
                        self.articles?.append(articless)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error)
            }
            
            
        }
        
        task.resume()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as! articleCell
        
        cell.title.text = self.articles?[indexPath.item].headline
        cell.desc.text = self.articles?[indexPath.item].desc
        cell.author.text = self.articles?[indexPath.item].author
        cell.imgView.downloadImage(from: (self.articles?[indexPath.item].imgUrl!)!)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        indexPos=indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
    
    var urlString : String = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! webViewViewController
        vc.url  = self.urlString
        
    }
    
}











extension UIImageView {
    
    func downloadImage(from url: String){
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}

