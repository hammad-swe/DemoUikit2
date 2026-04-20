//
//  DashBoardTableViewCell.swift
//  DemoUIkit2
//
//  Created by Hammad Ali on 20/04/2026.
//

import UIKit

class DashBoardTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    
    
    
    @IBOutlet weak var dashboardCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func ShowColectionTapped(_ sender: Any) {
        
    }
    
}
