//
//  Coordinator.swift
//  NewsHive-MVVM
//
//  Created by Ahmet Enes Irmak on 30.11.2023.
//

import UIKit

class MainCoordinator: NewsCoordinator {
    
    var childCoordinators: [NewsCoordinator] = []
    var navigationController = UINavigationController()

    func startCoordinator() {
        let storyboard = UIStoryboard(name: "News", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as! NewsListViewController
        
        initialViewController.mainCoordinator = self
        navigationController.pushViewController(initialViewController, animated: false)
        navigationController.navigationBar.tintColor = .white
    }
    
    func showDetails(of news: News) {
        let detailsVC = UIStoryboard(name: "News", bundle: nil).instantiateViewController(identifier: "NewsDetailViewController") as! NewsDetailViewController
        
        let newsDetailsVM = NewsDetailViewModel(selectedNews: news)
        detailsVC.newsDetailViewModel = newsDetailsVM
        navigationController.pushViewController(detailsVC, animated: true)
    }
    
}
