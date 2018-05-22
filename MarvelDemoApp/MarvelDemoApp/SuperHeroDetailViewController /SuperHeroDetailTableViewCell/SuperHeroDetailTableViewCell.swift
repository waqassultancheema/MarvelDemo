//
//  SuperHeroListTableViewCell.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

class SuperHeroDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var activityIndictor: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.activityIndictor.hidesWhenStopped = true
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
