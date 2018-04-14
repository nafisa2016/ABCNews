//
//  NormalCellModel.swift
//  ABCNews
//
//  Created by Nafisa Rahman on 3/18/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let title : String
    let pubDate : String
    let thumbnail : String
    let link : String?
    
    enum CodingKeys : String, CodingKey {
        case title
        case pubDate
        case thumbnail
        case enclosure
    }
    
    enum EnclosureKeys : String , CodingKey {
        case link
    }
    
    init(from decoder: Decoder) throws {
        let item = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try item.decode(String.self,forKey: .title)
        pubDate = try item.decode(String.self,forKey: .pubDate)
        thumbnail = try item.decode(String.self,forKey: .thumbnail)
        
        let enclosure = try item.nestedContainer(keyedBy: EnclosureKeys.self, forKey: .enclosure)
        
        link = try enclosure.decodeIfPresent(String.self, forKey: .link)
        
    }
    
}


