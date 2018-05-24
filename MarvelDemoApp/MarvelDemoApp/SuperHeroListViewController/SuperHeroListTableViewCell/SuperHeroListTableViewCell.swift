//
//  SuperHeroListTableViewCell.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

class SuperHeroListTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var activityIndictor: UIActivityIndicatorView!
    @IBOutlet weak var favButton: UIButton!
    var idOfSuperHero:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.activityIndictor.hidesWhenStopped = true
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundImage.image = #imageLiteral(resourceName: "image_not_available")
    }
    
    func downloadImage(url: String) {
        activityIndictor.startAnimating()
         self.backgroundImage.image = #imageLiteral(resourceName: "image_not_available")
        let urL  = URL(string: url)
        if let correctURL = urL {
            ImageDownloader.image(for: correctURL) { (image) in
                DispatchQueue.main.async() {
                    self.activityIndictor.startAnimating()
                    self.backgroundImage.image = image
                }
            }
//            ImageLoader.sharedLoader.imageForUrl(urlString: url) { (image, value) in
//                DispatchQueue.main.async() {
//                    self.activityIndictor.startAnimating()
//                    self.backgroundImage.image = image
//                }
//            }
//            self.backgroundImage.loadImageWithUrl(correctURL) {[unowned self] (value) in
//                self.activityIndictor.stopAnimating()
//            }
        }
    }
    @IBAction func btnFavouriteTapped(_ sender: Any) {
        let button:UIButton = sender as! UIButton
        button.isSelected  =   !button.isSelected
        
        if button.isSelected {
            SaveFavourite.saveFavouriteSelection(idOfSuperHero: idOfSuperHero)
        } else {
            SaveFavourite.removeFavouriteSelection(idOfSuperHero: idOfSuperHero)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
