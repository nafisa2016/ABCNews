//
//  NewsViewModel.swift
//  ABCNews
//
//  Created by Nafisa Rahman on 3/18/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation

class NewsViewModel {
    
    //MARK:- Declarations
    var newsFeed : [Item]
    var newsFeedNetworking: NewsFeedNetworking!
    
    
    init(){
        newsFeed = []
        newsFeedNetworking = NewsFeedNetworking()
    }
    
}

extension NewsViewModel {
    
    //MARK:- Get no of sections
    func getNumOfSections() -> Int {
        
        return 2
    }
    
    //MARK:- Get no of rows
    func getNumOfRows(section: Int) -> Int {
        
        if newsFeed.count > 0 {
            
            if section == 1 {
                return newsFeed.count - 1
            }else {
                return 1
            }
        }else {
            return 0
        }
        
    }
    
    //MARK:- Get cell title
    func getCellTitle(row: Int) -> String {
        
        return newsFeed[row].title
    }
    
    //MARK:- publish date formatting
    func formatPublishDate(input: String)-> String {
        
        var formattedDateTime = ""
        
        if !input.isEmpty {
            
            let myFormatter = DateFormatter()
            myFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            myFormatter.locale = Locale(identifier: "en_AU")
            
            let inputDate = myFormatter.date(from: input)
            myFormatter.dateFormat = "MMM dd,yyyy hh:mm a"
            myFormatter.amSymbol = "AM"
            myFormatter.pmSymbol = "PM"
            formattedDateTime = myFormatter.string(from: inputDate!)
        }
        
        
        return formattedDateTime
    }
    
    
    //MARK:- Get Cell Publish date
    func getCellPublishDate(row:Int) -> String {
        
        return formatPublishDate(input: newsFeed[row].pubDate)
    }
    
    //MARK:- Get Cell Image link
    func getCellImageLink(row: Int) -> String {
        
        return newsFeed[row].link ?? newsFeed[row].thumbnail 
    }
    
    //MARK:- Get cell thumbnail
    func getCellThumbnail(row: Int) -> String {
        
        return newsFeed[row].thumbnail 
    }
    
    //MARK:- Get news feed
    func getNewsFeed(completion: @escaping () -> Void){
        
        newsFeedNetworking.getFeed { (feed) in
            
            DispatchQueue.main.async {
                self.newsFeed = feed
                completion()
            }
        }
    }
    
}
