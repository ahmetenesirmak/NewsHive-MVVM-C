//
//  NewsListViewController.swift
//  NewsHive-MVVM
//
//  Created by Ahmet Enes Irmak on 29.11.2023.
//

import UIKit

class NewsListViewController: UIViewController, NewsViewModelDelegate {
    
    //MARK: - Property
    var newsListViewModel: NewsListViewModel!
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        registerTableViewCell()
        setupViewModel()
        configureNavigationController()
        newsListViewModel.fetchNewsList()
    }
    

    //MARK: - Function
    private func configureNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupViewModel() {
        newsListViewModel = NewsListViewModel()
        newsListViewModel.delegate = self
    }
    
    func dataUpdated() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerTableViewCell() {
        tableView.register(UINib(nibName: "NewsListTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsListTableViewCell")
    }

}

//MARK: - Extension
extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsListViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListViewModel.numberOfRowsInSection(section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as! NewsListTableViewCell
        
        let newsVM = self.newsListViewModel.newsAtIndex(indexPath.row)
        cell.bind(newsImageURL: newsVM.urlToImage, newsTitle: newsVM.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
