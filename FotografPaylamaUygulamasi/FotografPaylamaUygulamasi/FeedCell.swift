//
//  FeedCell.swift
//  FotografPaylamaUygulamasi
//
//  Created by Samet on 11.10.2024.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var yorumLabel: UILabel!
    @IBOutlet weak var PostImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
