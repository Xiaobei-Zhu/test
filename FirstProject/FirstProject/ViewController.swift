//
//  ViewController.swift
//  FirstProject
//
//  Created by Xiaobei Zhu on 2020/12/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FirstProjectTableViewCell
        cell.ImageView.image = UIImage(named:restaurantImages[indexPath.row])
        cell.NameLabel.text = restaurantNames[indexPath.row]
        cell.LocationLabel.text = restaurantLocations[indexPath.row]
        cell.TypeLabel.text = restaurantTypes[indexPath.row]
        if restaurantIsVisited[indexPath.row]{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Creat an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)   //
        
        //Add cancelAction menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
       
        
        //Closure  //Add Call action
        let callActionHandle = {(action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailble", message: "Sorry, the call feature is not available yet.Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call" + " 123-000-\(indexPath.row)", style: .default, handler: callActionHandle)
        optionMenu.addAction(callAction)
        
        //CheckInAction  another type Closure
        let checkInAction = UIAlertAction(title: "Check in", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.restaurantIsVisited[indexPath.row] = true
        })
        optionMenu.addAction(checkInAction)
//        tableView.deselectRow(at: indexPath, animated: false)
        //Display the menu
        present(optionMenu, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            restaurantNames.remove(at: indexPath.row)
            restaurantLocations.remove(at: indexPath.row)
            restaurantTypes.remove(at: indexPath.row)
            restaurantIsVisited.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)
        }
        print("Total item: \(restaurantNames.count)")
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "share", handler: {
                    (action, indexPath) -> Void in
                    let defaultText = "Just checking in at" + self.restaurantNames[indexPath.row]
            //Use image share
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]){
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
                    
                })
        //Delete Button
                let deletAction = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "Delet", handler: {
                    (action, indexPath) -> Void in
                    self.restaurantNames.remove(at: indexPath.row)
                    self.restaurantLocations.remove(at: indexPath.row)
                    self.restaurantTypes.remove(at: indexPath.row)
                    self.restaurantIsVisited.remove(at: indexPath.row)
                    self.restaurantImages.remove(at: indexPath.row)
//                    self.tableView.deleteRow(at: [indexPath], with: .fade)
    
                })
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deletAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        return [deletAction, shareAction]
    }
    


    override var prefersStatusBarHidden: Bool{
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showRestaurantDetail" {
//            if let indexPath = UITableView.indexPathForSelectedRow {
//                let destinationController = segue.destination as! RestaurantDetailViewCellViewController
//                destinationController.restaurantImage =
//    restaurantImages[indexPath.row]
//            }
//    } }
    
   
}

