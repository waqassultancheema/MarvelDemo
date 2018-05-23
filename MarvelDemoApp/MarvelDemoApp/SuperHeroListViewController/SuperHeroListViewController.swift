//
//  SuperHeroListViewController.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
protocol SuperHeroListViewControllerInput
{
    
}

protocol SuperHeroListViewControllerOutput
{
    func fetchItems(request: SuperHeroList.Fetch.Request)
}
class SuperHeroListViewController: UIViewController {

  
    @IBOutlet weak var activityIndictor: UIActivityIndicatorView!
    var output: SuperHeroListViewControllerOutput!
    var router: SuperHeroListRouter!
    let tableViewDataSource:SuperHeroListViewDataSource = SuperHeroListViewDataSource()
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var offset = 0
    var searchEnabled = false
    override func awakeFromNib()
    {
        super.awakeFromNib()
        SuperHeroConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.activityIndictor.hidesWhenStopped = true
        self.tableView.delegate = self.tableViewDataSource
        self.tableView.dataSource = self.tableViewDataSource
        self.searchTextField.delegate = self
        activityIndictor.startAnimating()
        let request = SuperHeroList.Fetch.Request(isFilteredApplied: false, offset: offset, limit: 20, searchQuery: "")
        output.fetchItems(request: request)
        fetchMoreItemsFromServer()
        handleTableViewSelection()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SuperHeroListViewController:UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         activityIndictor.startAnimating()
        if textField.text != "" {
            let request = SuperHeroList.Fetch.Request(isFilteredApplied: true, offset: offset, limit: 20, searchQuery: textField.text ?? "")
            searchEnabled = true
            output.fetchItems(request: request)
        } else {
            let request = SuperHeroList.Fetch.Request(isFilteredApplied: false, offset: offset, limit: 20, searchQuery:"")
            searchEnabled = true
            output.fetchItems(request: request)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
        return true
    }
    
}
