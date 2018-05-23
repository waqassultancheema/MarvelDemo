//
//  MarvelDemoAppRouter.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/8/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
/*                       Router
 This is a simple component. The router takes care for the transition and passing data (if necessary) between view controllers. Also, you can use segues, unlike the VIPER architecture where you can’t do that. */
protocol SuperHeroListRouterView {
   func showSuperHeroDetailViewController(superHero:SuperHeroList.Fetch.ViewModel.DisplayedSuperHero)
   func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

protocol SuperHeroListDataPassing
{
    var dataStore: SuperHeroList.Fetch.ViewModel.DisplayedSuperHero? { get }
}

class SuperHeroListRouter: SuperHeroListRouterView,SuperHeroListDataPassing{
    
    
    
    var dataStore: SuperHeroList.Fetch.ViewModel.DisplayedSuperHero?
    
    var navigationController:UINavigationController? = nil
    var superHeroListViewController:SuperHeroListViewController? = nil
    
    func showSuperHeroDetailViewController(superHero:SuperHeroList.Fetch.ViewModel.DisplayedSuperHero) {
        dataStore  = superHero
        superHeroListViewController?.performSegue(withIdentifier: "SuperHeroDetail", sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let superHeroDetailViewController = segue.destination as? SuperHeroDetailViewController {
            superHeroDetailViewController.configurator = SuperHeroDetailConfigurator()
            slicetheArray()
             superHeroDetailViewController.configurator?.superHero = dataStore
        }
    }
    
    func slicetheArray() {
        if let array = dataStore?.superHero.comics.items {
            if array.count >= 3 {
                dataStore?.superHero.comics.items = Array(array[0 ..< 3])
            } else {
            }
        }
        if let array = dataStore?.superHero.events.items {
            if array.count >= 3 {
                dataStore?.superHero.events.items = Array(array[0 ..< 3])
            } else {
            }
        }
        if let array = dataStore?.superHero.series.items {
            if array.count >= 3 {
                dataStore?.superHero.series.items = Array(array[0 ..< 3])
            } else {
            }
        }
        if let array = dataStore?.superHero.stories.items {
            if array.count >= 3 {
                dataStore?.superHero.stories.items = Array(array[0 ..< 3])
            } else {
            }
        }
    }
    
}

