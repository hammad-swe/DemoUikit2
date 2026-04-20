//
//  DashBoardTableViewCell.swift
//  DemoUIkit2
//
//  Created by Hammad Ali on 20/04/2026.
//

import UIKit

class DashBoardTableViewCell: UITableViewCell {
    
   
   

    static let identifier = "DashBoardTableViewCell"
    
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var dashboardCollectionView: UICollectionView!
    
    
    private var items: [Model] = []
        private var isExpanded = false
        var onToggle: (() -> Void)?

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // image style
//        itemImage.layer.cornerRadius = 10
//        itemImage.clipsToBounds = true
        
        // collectionView layout
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize           = CGSize(width: 110, height: 130)
//        dashboardCollectionView.collectionViewLayout = layout
        
        
        
        dashboardCollectionView.register(UINib(nibName: "dashBoardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: dashBoardCollectionViewCell.identifier)
        dashboardCollectionView.delegate = self
        dashboardCollectionView.dataSource = self
        
        // hide by defaults
        dashboardCollectionView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        isExpanded.toggle()
        
//        UIView.animate(withDuration: 0.3) {
//                    self.dashboardCollectionView.isHidden = !self.isExpanded
//                    self.showButton.setTitle(self.isExpanded ? "Hide" : "Show", for: .normal)
//                    self.contentView.layoutIfNeeded()
//                }
        onToggle?()
        
    }
    
    // configure function
    
    func configure(with model: Model, relatedItems: [Model]){
        itemName.text = model.name
        itemDescription.text = model.description
        itemPrice.text = model.price
        itemImage.image = UIImage(named: model.image)
        
        
        items = relatedItems
        dashboardCollectionView.reloadData()
        
//        isExpanded = false
//        dashboardCollectionView.isHidden = true
//       showButton.setTitle("Show", for: .normal)
        
    }
    
}


extension DashBoardTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dashboardCollectionView.dequeueReusableCell(withReuseIdentifier: dashBoardCollectionViewCell.identifier, for: indexPath) as! dashBoardCollectionViewCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//           return CGSize(width: 150, height: 150)
//       }
    
}
