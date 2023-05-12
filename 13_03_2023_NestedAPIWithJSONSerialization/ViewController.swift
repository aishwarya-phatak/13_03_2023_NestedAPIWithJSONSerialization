//
//  ViewController.swift
//  13_03_2023_NestedAPIWithJSONSerialization
//
//  Created by Vishal Jagtap on 12/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var products : [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
    }

    func jsonParsing(){
        let url = URL(string: "https://dummyjson.com/products")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            let jsonRepsonse = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
            
            let productsResponse = jsonRepsonse["products"] as! [[String:Any]]
            let total = jsonRepsonse["total"] as! Int
            let skip = jsonRepsonse["skip"] as! Int
            let limit = jsonRepsonse["limit"] as! Int
            
            for eachProduct in productsResponse{
                let eachProductId = eachProduct["id"] as! Int
                let eachProductTitle = eachProduct["title"] as! String
                let eachProductImages = eachProduct["images"] as! [String]
                
                for eachImageURLString in eachProductImages{
                  let url = URL(string: eachImageURLString)
                }
                
                let newProduct = Product(id: eachProductId, title: eachProductTitle, images: eachProductImages)
                
                self.products.append(newProduct)
            }
            
        }
    }
}
