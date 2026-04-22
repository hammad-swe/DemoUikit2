//
//  DashBoardViewController.swift
//  DemoUIkit2
//
//  Created by Hammad Ali on 20/04/2026.
//

import UIKit

class DashBoardViewController: UIViewController {
   
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    
    
    private let items: [Model] = [
           Model(name: "Chapli Kabab",  description: "Juicy grilled meat with rich spices.", image: "kabab", price: "Rs. 100.00"),
           Model(name: "Indian Dish",   description: "Spicy, flavorful traditional meal.",  image: "indian_dish",     price: "Rs. 600.00"),
           Model(name: "Gol Gappy",   description: "Crispy shells with tangy filling",            image: "golgappy",   price: "Rs. 200.00"),
           Model(name: "Steak",   description: "Tender, juicy grilled beef cut.",            image: "steak",   price: "Rs. 1000.00")
       ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dashboard"
        
        tableView.register(DashBoardTableViewCell.nib(), forCellReuseIdentifier: DashBoardTableViewCell.identifier,)
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }


}

extension DashBoardViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =   tableView.dequeueReusableCell(withIdentifier: DashBoardTableViewCell.identifier, for: indexPath) as! DashBoardTableViewCell
        cell.configure(with: items[indexPath.row], relatedItems: items)

                cell.onToggle = { [weak tableView] in
                    UIView.animate(withDuration: 0.3) {
                            tableView?.beginUpdates()
                            tableView?.endUpdates()
                        }
                }
        return cell
    }
    
    
}
