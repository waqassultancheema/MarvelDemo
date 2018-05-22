//
//  SuperHeroListTableViewCell.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

protocol SuperHeroDetailTableViewCellOutput
{
    func fetchItems(request: ComicsModel.Fetch.Request)
}
class SuperHeroDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activityIndictor: UIActivityIndicatorView!

    var comicURL:String  = ""
    var request:ComicsModel.Fetch.Request?
    var output: SuperHeroDetailTableViewCellOutput!
    let instance = ComicConfigurator()

    override func awakeFromNib() {
        super.awakeFromNib()
        instance.configure(cell: self)
        self.activityIndictor.hidesWhenStopped = true
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
