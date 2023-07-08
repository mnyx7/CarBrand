//
//  CarBrandCell.swift
//  TableView
//
//  Created by Minaya Yagubova on 26.01.23.
//

import UIKit

struct CarModel {
    let name: String
    let logo: String
}

class CustomCell: UITableViewCell {
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var table: UITableView!
    
    var cars = ["BMW", "MercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedesMercedes", "Tesla", "Audi", "Toyoto"]
    var carsLogo = ["bmw", "mrcd", "tsl", "Audi", "Toyoto"]
    var items = [CarModel(name: "BMW", logo: "logo"),
                 CarModel(name: "Mercedes", logo: "logo"),
                 CarModel(name: "Ferrari", logo: "logo"),
                 CarModel(name: "Tesla", logo: "logo"),
                 CarModel(name: "Toyota", logo: "logo")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "BRANDS"
        navigationController?.navigationItem.title = "adasdas"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarBrandCell") as! CarBrandCell
        cell.nameLabel.text = items[indexPath.row].name
        cell.logoImage.image = UIImage(named: items[indexPath.row].logo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index: \(indexPath.row) selected")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete")
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let deletedItem = items.remove(at: sourceIndexPath.row)
        print(items)
        items.insert(deletedItem, at: destinationIndexPath.row)
//        items.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        print(items)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let add = UIContextualAction(style: .normal, title: "Add") { _, _, _ in
            self.items.append(CarModel(name: "Audi", logo: ""))
            self.table.reloadData()
        }
        let add2 = UIContextualAction(style: .normal, title: "Favorite") { _, _, _ in
            self.items.append(CarModel(name: "Audi", logo: ""))
            self.table.reloadData()
        }
        add.backgroundColor = .green
        add2.backgroundColor = .orange
        return UISwipeActionsConfiguration(actions: [add, add2])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        nil
    }
    
    @IBAction func edit(_ sender: Any) {
        if table.isEditing {
            table.isEditing = false
        } else {
            table.isEditing = true
        }
    }
    
}

