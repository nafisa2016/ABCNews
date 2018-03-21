//
//  NormalCellModel.swift
//  ABCNews
//
//  Created by Nafisa Rahman on 3/18/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation

class CellModel   {
    
    var cellImgLink: String
    var cellTitle: String
    var cellPublishDate: String
    
    init(cellImgLink: String,cellTitle:String,cellPublishDate:String){
        
        self.cellImgLink       = cellImgLink
        self.cellTitle         = cellTitle
        self.cellPublishDate   = cellPublishDate
        
    }
    
//    enum CodingKeys: String,CodingKey {
//
//        case cellTitle = "title"
//        case cellPublishDate = "pubDate"
//        case cellImgLink = "thumbnail"
//    }
//
//    required init(from decoder: Decoder) throws {
//
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        cellTitle = try values.decode(String.self, forKey: .cellTitle)
//        cellPublishDate = try values.decode(String.self, forKey: .cellPublishDate)
//        cellImgLink = try values.decode(String.self, forKey: .cellImgLink)
//
//    }
    
}


