//
//  SuperHeroDetailViewController.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit


class SuperHeroDetailViewController: UIViewController {

  
    @IBOutlet weak var tableView: UITableView!
   
    var configurator:SuperHeroDetailConfigurator?
    let tableViewDataSource:SuperHeroDetailDataSource = SuperHeroDetailDataSource()
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.tableViewDataSource.displaySuperHero = configurator?.superHero
        self.tableView.delegate = self.tableViewDataSource
        self.tableView.dataSource = self.tableViewDataSource
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
