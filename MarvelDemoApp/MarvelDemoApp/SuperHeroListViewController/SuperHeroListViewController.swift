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

  
    var output: SuperHeroListViewControllerOutput!
    var router: MarvelAppRouter!
    let tableViewDataSource:SuperHeroListViewDataSource = SuperHeroListViewDataSource()
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
   
    override func awakeFromNib()
    {
        super.awakeFromNib()
        SuperHeroConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.tableView.delegate = self.tableViewDataSource
        self.tableView.dataSource = self.tableViewDataSource
        let request = SuperHeroList.Fetch.Request(isFilteredApplied: false, offset: 0, limit: 10)
        output.fetchItems(request: request)
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
