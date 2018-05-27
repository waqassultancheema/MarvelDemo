//
//  SuperHeroListTableViewCell.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
enum CellType {
    case None
    case Comic
    case Event
    case Story
    case Series
}

protocol SuperHeroDetailTableViewCellOutput
{
    func fetchComicItems(request: ComicsModel.Fetch.Request)
     func fetchEventItems(request: EventsModel.Fetch.Request)
     func fetchStoriesItems(request: StoriesModel.Fetch.Request)
     func fetchSeriesItems(request: SeriesModel.Fetch.Request)
}
class SuperHeroDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activityIndictor: UIActivityIndicatorView!

    var comicURL:String  = ""
    var requestComic:ComicsModel.Fetch.Request?
    var requestEvent:EventsModel.Fetch.Request?
    var requestSeries:SeriesModel.Fetch.Request?
    var requestStories:StoriesModel.Fetch.Request?

    var output: SuperHeroDetailTableViewCellOutput!
    let instance = ComicConfigurator()
    let eventInstance = EventConfigurator()
    let seriesInstance = SeriesConfigurator()
    let storiesInstance = StoriesConfigurator()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.activityIndictor.hidesWhenStopped = true
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.headerLabel.text = ""
        self.descriptionLabel.text = ""
    }
    
    func configureCellWithCellType(cellType:CellType) {
        if cellType == .Comic {
            instance.configure(cell: self)
        } else  if cellType == .Event {
            eventInstance.configure(cell: self)
        } else  if cellType == .Story {
            storiesInstance.configure(cell: self)
        }  else  if cellType == .Series {
            seriesInstance.configure(cell: self)
        }
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
