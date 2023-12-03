//
//  NewsDetailViewModel.swift
//  NewsHive-MVVM
//
//  Created by Ahmet Enes Irmak on 29.11.2023.
//

import Foundation

class NewsDetailViewModel {
    
    var selectedNews: News?
    
    init(selectedNews: News) {
        self.selectedNews = selectedNews
    }

}
