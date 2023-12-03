//
//  NewsListViewController.swift
//  NewsHive-MVVM
//
//  Created by Ahmet Enes Irmak on 29.11.2023.
//

import UIKit

class NewsListViewController: UIViewController, NewsListViewModelDelegate {
    
    //MARK: - Property
    var newsListViewModel: NewsListViewModel!
    weak var mainCoordinator: MainCoordinator?
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        registerTableViewCell()
        setupViewModel()
        newsListViewModel.fetchNewsList()
    }
    

    //MARK: - Function
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainCoordinator?.showDetails(of: newsListViewModel.newsList[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
