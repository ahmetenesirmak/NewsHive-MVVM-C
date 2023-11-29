//
//  NewsWebService.swift
//  NewsHive-MVVM
//
//  Created by Ahmet Enes Irmak on 29.11.2023.
//

import Foundation

final class NewsWebService {
    func getArticles(url: URL, completion: @escaping ([News]?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let newsList = try? JSONDecoder().decode(NewsList.self, from: data)
                
                if let newsList = newsList {
                    completion(newsList.articles)
                }
            }
        } .resume()
    }
}
