//
//  NewsFeedNetworking.swift
//  ABCNews
//
//  Created by Nafisa Rahman on 3/18/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation

class NewsFeedNetworking {
    
    fileprivate struct Response : Decodable  {
        let items: [Item]
        
        enum CodingKeys: String, CodingKey {
            case items
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            items = try container.decode([Item].self, forKey: .items)
        }
    }
    
    
    func getFeed(){
        
        let endPoint : String = "https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml"
        
        guard let url = URL(string: endPoint) else {
            print("can't create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest , completionHandler: {[weak self]  (data, response, error) in
            
            if let weakSelf = self {
                
                guard let _:URLResponse = response  , error == nil else {
                    
                    return
                }
                
                guard let responseData = data else {
                    print("Error: did not receive  data")
                    
                    return
                }
                
                //response status is 200
                let response = response as? HTTPURLResponse
                if response?.statusCode == 200{
                    
                    //call function to parse received JSON data
                    var allFeedData : [Item] = []
                    
                    if let alldata = weakSelf.addData(jsonData: responseData) {
                        allFeedData  = alldata
                    }
                    
                    //completion(allFeedData)
                }
                
            } //weak self
            
        })
        
        task.resume()
    }
    
    
    //MARK: parse JSON data received and add to data structure
    func addData(jsonData : Data) -> [Item]?{
        
        do {
            
            let responseData = try JSONDecoder().decode(Response.self, from: jsonData)
            
            return responseData.items
            
        } catch {
            print("feed JSON parsing error")
        }
        
        return nil
        
    }
}
