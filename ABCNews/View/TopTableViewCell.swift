//
//  TopTableViewCell.swift
//  ABCNews
//
//  Created by Nafisa Rahman on 3/18/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var topCellImgView: UIImageView!
    @IBOutlet weak var topCellTitleLbl: UILabel!
    @IBOutlet weak var topCellDescLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(topCellImgLink: String,topCellTitle:String,topCellDesc: String){
        
        self.topCellTitleLbl.text = topCellTitle
        self.topCellTitleLbl.numberOfLines = 0
        self.topCellTitleLbl.lineBreakMode = .byWordWrapping
        
        self.topCellDescLbl.text  = topCellDesc
        
        //populate cell image
        self.topCellImgView.getImage(contentMode: .scaleAspectFill, url: topCellImgLink)
    }

}
