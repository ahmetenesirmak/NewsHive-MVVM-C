//
//  NewsListViewModel.swift
//  NewsHive-MVVM
//
//  Created by Ahmet Enes Irmak on 29.11.2023.
//

import Foundation

//MARK: - Protocol
protocol NewsViewModelDelegate {
    func dataUpdated()
}

//MARK: - NewsListViewModel
class NewsListViewModel {
    
    var newsList: [News] = []
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=6713bba1da9f4f558790e1847696f11a")!
    var delegate: NewsViewModelDelegate?
}

extension NewsListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func fetchNewsList() {
        NewsWebService().getArticles(url: url) { newsList in
            if let newsList = newsList {
                self.newsList = newsList
                self.delegate?.dataUpdated()
            }
        }
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.newsList.count
    }
    
    func newsAtIndex(_ index: Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)
    }
}


//MARK: - NewsViewModel

struct NewsViewModel {
    let news: News
}

extension NewsViewModel {
    var title: String {
        return self.news.title ?? ""
    }
    
    var description: String {
        return self.news.description ?? ""
    }
    
    var content: String {
        return self.news.content ?? ""
    }
    
    var author: String {
        return self.news.author ?? "News Hive"
    }
    
    var urlToImage: URL? {
        if let urlString = self.news.urlToImage {
            return URL(string: urlString)
        } else {
            return nil
        }
    }
    
    var url: String {
        return self.news.url ?? ""
    }
}
