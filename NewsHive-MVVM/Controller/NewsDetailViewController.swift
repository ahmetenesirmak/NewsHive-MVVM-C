//
//  NewsDetailViewController.swift
//  NewsHive-MVVM
//
//  Created by Ahmet Enes Irmak on 29.11.2023.
//

import UIKit
import SafariServices
import Kingfisher

class NewsDetailViewController: UIViewController, SFSafariViewControllerDelegate {
    
    //MARK: - Property
    var newsDetailViewModel: NewsDetailViewModel!
    
    //MARK: - IBOutlet
    @IBOutlet weak var newsDetailImage: UIImageView!
    @IBOutlet weak var newsDetailTitle: UILabel!
    @IBOutlet weak var newsDetailAuthor: UILabel!
    @IBOutlet weak var newsDetailPublicationDate: UILabel!
    @IBOutlet weak var newsDetailDescription: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    //MARK: - Function
    private func setup() {
        newsDetailImage.kf.setImage(with: URL(string: newsDetailViewModel.selectedNews?.urlToImage ?? ""))
        newsDetailTitle.text = newsDetailViewModel.selectedNews?.title
        newsDetailAuthor.text = newsDetailViewModel.selectedNews?.author ?? "News Hive"
        newsDetailDescription.text = newsDetailViewModel.selectedNews?.description
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func readMoreButtonTapped(_ sender: UIButton) {
        if let url = URL(string: newsDetailViewModel.selectedNews?.url ?? "") {
            let safariViewController = SFSafariViewController(url: url)
            safariViewController.delegate = self
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
}
