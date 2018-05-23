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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
