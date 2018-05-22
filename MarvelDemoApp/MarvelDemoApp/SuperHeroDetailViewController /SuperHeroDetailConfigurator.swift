//
//  SuperHeroDetailConfigurator.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/22/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

class SuperHeroDetailConfigurator: NSObject {
    
    let presenter = SuperHeroPresenter()
    let interactor = SuperHeroInteractor()
    let router = SuperHeroListRouter()
    var superHero:SuperHeroList.Fetch.ViewModel.DisplayedSuperHero?
  //  private override init() {}
    
    // MARK: - Configuration
    
    func configure(superHeroDetailViewController:SuperHeroDetailViewController)
    {
        
    }
}
