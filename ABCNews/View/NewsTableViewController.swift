//
//  NewsTableViewController.swift
//  ABCNews
//
//  Created by Nafisa Rahman on 3/18/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    lazy var newsViewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: self sizing cells
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = self.tableView.frame.height
        
        tableView.contentInset = UIEdgeInsets.zero
        
        //get news feed
        newsViewModel.getNewsFeed{
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return newsViewModel.getNumOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newsViewModel.getNumOfRows(section: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = (indexPath as NSIndexPath).section
        
        
        if section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath) as! TopTableViewCell
            
            cell.configure(topCellImgLink: newsViewModel.getCellThumbnail(row: indexPath.row),
                           topCellTitle: newsViewModel.getCellTitle(row: indexPath.row),
                           topCellDesc: newsViewModel.getCellPublishDate(row: indexPath.row))
            
            return cell
            
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as! NormalTableViewCell
            
            cell.configure(normalCellImgLink: newsViewModel.getCellImageLink(row: indexPath.row + 1),
                           normalCellTitle: newsViewModel.getCellTitle(row: indexPath.row + 1),
                           normalCellDesc: newsViewModel.getCellPublishDate(row: indexPath.row + 1))
            
            return cell
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
