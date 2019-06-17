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
    
    
    var articles : [article] = []
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBOutlet var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   //     navBarShadow()

  //      mainView.layer.shadowRadius = 5
    //    mainView.layer.shadowOpacity = 1
        fetchHeadlines()
    }
    
    
    
    
    func navBarShadow()
    {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    }



    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return self.articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as! articleCell
    
    // Configure the cell...
    
        cell.title.text = self.articles[indexPath.item].headline
        cell.author.text = self.articles[indexPath.item].author
        cell.desc.text = self.articles[indexPath.item].desc
        
    
    
        return cell
    }

    
    func fetchHeadlines()
    {
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=33659ed19d2a4799bf1bd8681c478cb8")!)
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data,response,error) in
            
            if(error != nil)
            {
                print(error!)
                return
            }
            
            self.articles = [article]()
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let articlesFromJson = json["NewsItem"] as? [[String: AnyObject]]
                {
                    
                    for articlesFromJson in articlesFromJson {
                        
                        let articles = article()
                        if let title = articlesFromJson["title"] as? String,
                        let author = articlesFromJson["author"] as? String,
                            let desc = articlesFromJson["description"] as? String, let url = articlesFromJson["url"] as? String,let urlToImage = articlesFromJson["urlToImage"] as? String
                        {
                            articles.author = author
                            articles.desc = desc
                            articles.headline = title
                            articles.imgUrl = urlToImage
                            articles.url = url
                            
                        }
                        self.articles.append(articles)
                    
                        
                    }
                    
                }
              //  DispatchQueue.main.async {
                    // self.tableView.reloadData()
             //   }
               
                
            } catch let error {
                print(error)
            }
        }
        
   //     task.resume()
        
    }

    
    
    
    
    
    
    
    

}




//extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate
//{
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return imgArr.count
//    }
//
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////       // var cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DataCollectionViewCell
////     //   cell?.img.image =
////        return
////    }
//
//}
//
//
