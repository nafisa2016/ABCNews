//
//  NewsFeedNetworking.swift
//  ABCNews
//
//  Created by Nafisa Rahman on 3/18/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation

class NewsFeedNetworking {
    
    struct Response : Decodable  {
        let title : String
        let pubDate : String
        let thumbnail : String?
        let link : String
        
        
        enum CodingKeys: String, CodingKey {
            case items = "items"
        }
        
        enum ItemKeys : String, CodingKey {
            case title
            case pubDate
            case link
            case enclosure
        }
        
        enum EnclosureKeys : String , CodingKey {
            case thumbnail
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            
            let item = try values.nestedContainer(keyedBy: ItemKeys.self, forKey: .items)
            
            title = try item.decode(String.self,forKey: .title)
            pubDate = try item.decode(String.self,forKey: .pubDate)
            link = try item.decode(String.self,forKey: .link)
            
            let enclosure = try item.nestedContainer(keyedBy: EnclosureKeys.self, forKey: .enclosure)
            
            thumbnail = try enclosure.decode(String.self, forKey: .thumbnail)
            
        }
        
        
    }
    
//    struct Item : Decodable {
//        let title : String
//        let pubDate : String
//        let thumbnail : String
//        let enclosure : Enclosure
//    }
//
//    struct Enclosure: Decodable {
//        let link : String?
//    }
    
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
                    var allFeedData : [CellModel] = []
                    allFeedData =  weakSelf.addData(jsonData: responseData)
                    //completion(allFeedData)
                }
                
            } //weak self
            
        })
        
        task.resume()
    }
    
    
    //MARK: parse JSON data received and add to data structure
    func addData(jsonData : Data) -> [CellModel]{
        
        let allFeedData : [CellModel] = []
        
        do {
            
            let responseData = try JSONDecoder().decode(Response.self, from: jsonData)
            
            
            
            //            if let feed = container["feed"] {
            //                print( feed.results.count)
            //
            //                for each in feed.results {
            //
            //                    let feedModel = FeedDataModel(songName: each.name, artistName: each.artistName, imageURL: each.artworkUrl100)
            //                    allFeedData.append(feedModel)
            //
            //                }
            //
            //            }
            
            
        } catch {
            print("feed JSON parsing error")
        }
        
        return allFeedData
        
    }
}
