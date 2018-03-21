//
//  NormalTableViewCell.swift
//  ABCNews
//
//  Created by Nafisa Rahman on 3/18/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import UIKit

class NormalTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var normalCellImgView: UIImageView!
    @IBOutlet weak var normalCellTitleLbl: UILabel!
    @IBOutlet weak var normalCellDescLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(normalCellImgLink: String,normalCellTitle:String,normalCellDesc: String){
        
        self.normalCellTitleLbl.text = normalCellTitle
        self.normalCellDescLbl.text  = normalCellDesc
        
        //populate cell image
        self.normalCellImgView.getImage(contentMode: .scaleAspectFit, url: normalCellImgLink)
    }

}
