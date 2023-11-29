//
//  NewsEntity.swift
//  NewsHive-MVVM
//
//  Created by Ahmet Enes Irmak on 29.11.2023.
//

import Foundation

//MARK: - NewsList
struct NewsList: Codable {
    let articles: [News]?
}

//MARK: - News
struct News: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
