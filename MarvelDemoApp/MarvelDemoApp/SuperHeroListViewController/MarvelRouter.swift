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
protocol MarvelAppRouterView {
   func showMovieDetailViewController()
}
class MarvelAppRouter: MarvelAppRouterView {

    var movieDetailViewController:UIViewController? = nil
    var navigationController:UINavigationController? = nil
    var movieListViewController:SuperHeroListViewController? = nil
    func showMovieDetailViewController() {
        let storyboard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        movieDetailViewController = storyboard.instantiateViewController(withIdentifier: "")
        navigationController?.pushViewController(movieDetailViewController!, animated: true)
    }
    
}

