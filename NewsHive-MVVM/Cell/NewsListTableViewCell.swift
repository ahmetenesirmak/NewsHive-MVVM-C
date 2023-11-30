//
//  NewsListTableViewCell.swift
//  NewsHive-MVVM
//
//  Created by Ahmet Enes Irmak on 29.11.2023.
//

import UIKit
import Kingfisher

class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(newsImageURL: URL? = nil, newsTitle: String) {
        self.newsTitle.text = newsTitle
        self.newsImage.kf.setImage(with: newsImageURL)
    }
    
}
