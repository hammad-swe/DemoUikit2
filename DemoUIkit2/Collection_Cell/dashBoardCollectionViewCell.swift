//
//  dashBoardCollectionViewCell.swift
//  DemoUIkit2
//
//  Created by Hammad Ali on 20/04/2026.
//

import UIKit

class dashBoardCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "dashBoardCollectionViewCell"
       
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        itemImage.layer.cornerRadius = 8
//        itemImage.clipsToBounds = true
//        contentView.layer.cornerRadius = 8
//        contentView.layer.borderWidth = 0.5
//        contentView.layer.borderColor = UIColor.separator.cgColor
       
    }
    
    public func configure(with model: Model){
        self.title.text = model.name
        self.price.text = model.price
        self.itemImage.image = UIImage(named: model.image)
    }

}
