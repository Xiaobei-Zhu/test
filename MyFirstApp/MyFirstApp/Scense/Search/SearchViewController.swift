//
//  SearchViewController.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2021/1/3.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchDisplayLogic: class {
    func displayCountryInformation(viewModel: Search.SearchCountry.ViewModel)
}

class SearchViewController: UIViewController, SearchDisplayLogic, UISearchResultsUpdating {

    func displayCountryInformation(viewModel: Search.SearchCountry.ViewModel) {
        countryInformationDict = viewModel.countryInformationDic
        createCountryNameDict()
        
    }
    
    // MARK: - Properties
    var interactor: SearchBusinessLogic?
    var router: SearchRouterInput?
    var countryInformationDict: Array<[String:String]> = []
    
    var countryImage = [String]()
    var countryNames = [String]()
    
    let countryIndexTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T","U", "V", "W", "X", "Y", "Z"]
//    let countryImage = 
    var countryNameDict = [String: [String]]()
    var countrySectionTitles = [String]()
    var searchResults = [String]()
    var searchController:UISearchController!
    // Mark: - Outlets
    
    //@IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Object Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SearchConfigurator.sharedInstance.configure(self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getCountryInformation(request: Search.SearchCountry.Request())
       
    }
    
    // MARK: - Do something

    func displaySomething(viewModel: Search.SearchCountry.ViewModel) {
        //nameTextField.text = viewModel.name
    }
 
}
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countrySectionTitles.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countrySectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countryKey = countrySectionTitles[section]
        guard let countryValues = countryNameDict[countryKey] else {
    return 0 }
        return countryValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SearchTableViewCell
        let countryKey = countrySectionTitles[indexPath.section]
//        let country = (searchController.isActive) ? searchResults[indexPath.row] : countryNames[indexPath.row]
        if let countryValues = countryNameDict[countryKey] {
            cell.countryLabel.text = countryValues[indexPath.row]
            let imageFileName = countryValues[indexPath.row].lowercased().replacingOccurrences(of: "", with: "_")
            cell.ImageView.image = UIImage(named: imageFileName)
        }
        return cell
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        tableView.sectionIndexBackgroundColor = UIColor(named: "Background Color")
        tableView.sectionIndexColor = .white
        return countryIndexTitles
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let index = countrySectionTitles.index(of: title) else {
                return -1
        }
        return index
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 34
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor(named: "Background Color")
        headerView.textLabel?.textColor = UIColor(named: "SearchSectionTextColor")
        headerView.textLabel?.font = UIFont(name: "Label TT Norms Bold", size: 12.0)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        router?.showCountryScreen(countryName: ["countryName": countryNames[indexPath.row],"countryImage": countryImage[indexPath.row]])
    }

   
    
    func createCountryNameDict(){
        for countries in countryInformationDict {
            countryNames.append(countries["countryName"]!)
            countryImage.append(countries["countryImage"]!)
        }
        for countryName in countryNames {
           //Get the first letter of the animal name and build the dictionary
           let firstLetterIndex = countryName.index(countryName.startIndex, offsetBy: 1)
           let countryNameKey = countryName.substring(to: firstLetterIndex)
           if var countryNameValues = countryNameDict[countryNameKey] {
               countryNameValues.append(countryName)
               countryNameDict[countryNameKey] = countryNameValues
           }else {
               countryNameDict[countryNameKey] = [countryName]
           }
            countrySectionTitles = [String](countryNameDict.keys)
            countrySectionTitles = countrySectionTitles.sorted(by: { $0 < $1})
            print(countryNameDict)
            tableView.reloadData()
        }
    }
}
extension SearchViewController:  UISearchBarDelegate {
    func filterContent(for searchText: String) {
        searchResults = countryNames.filter({ (countryName) -> Bool in      
            for countryNameInArr in countryNames {
                let isMatch = countryNameInArr.localizedCaseInsensitiveContains(searchText)
                return isMatch
    }
            return false
        })
    }
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
            }
    }

}
