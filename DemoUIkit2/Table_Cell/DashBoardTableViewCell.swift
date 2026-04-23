//
//  DashBoardTableViewCell.swift
//  DemoUIkit2
//
//  Created by Hammad Ali on 20/04/2026.
//

import UIKit

class DashBoardTableViewCell: UITableViewCell {
    
   
   

    static let identifier = "DashBoardTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "DashBoardTableViewCell", bundle: nil)
    }

    
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var dashboardCollectionView: UICollectionView!
    
    
    @IBOutlet var dashboardCollectionViewHieghtConstraint: NSLayoutConstraint!
    
    
    private var items: [Model] = []
//    var items = [Model]()
        private var isExpanded = false
    
        var onToggle: (() -> Void)?

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 10
            contentView.layer.masksToBounds = true
//         image style
        itemImage.layer.cornerRadius = 10
       
        itemImage.clipsToBounds = true
        
        
        // collectionView layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 110, height: 200)
        layout.minimumLineSpacing  = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        dashboardCollectionView.collectionViewLayout = layout
        
        
        
        dashboardCollectionView.register(dashBoardCollectionViewCell.nib(), forCellWithReuseIdentifier: dashBoardCollectionViewCell.identifier)
        dashboardCollectionView.delegate = self
        dashboardCollectionView.dataSource = self
        
        dashboardCollectionView.showsHorizontalScrollIndicator = false
        dashboardCollectionView.backgroundColor = .clear
        
        // hide by defaults
        dashboardCollectionView.isHidden = true
        dashboardCollectionViewHieghtConstraint.constant = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func showButtonTapped(_ sender: Any) {
        isExpanded.toggle()
        
        self.dashboardCollectionView.isHidden = !self.isExpanded
        self.dashboardCollectionViewHieghtConstraint.constant = self.isExpanded ? 150 : 0
        self.showButton.setTitle(self.isExpanded ? "Hide" : "Show", for: .normal)
        
        self.contentView.layoutIfNeeded()
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
        
        isExpanded = false
        dashboardCollectionView.isHidden = true
        dashboardCollectionViewHieghtConstraint.constant = 0
       showButton.setTitle("Show", for: .normal)
//        
    }
    
}


extension DashBoardTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dashboardCollectionView.dequeueReusableCell(withReuseIdentifier: dashBoardCollectionViewCell.identifier, for: indexPath) as! dashBoardCollectionViewCell
        cell.config(with: items[indexPath.item])
        return cell
    }
    
}

extension DashBoardTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 110, height: 130)
       }
}
